<?php

function sincronizar_y_obtener_clasificacion($conn)
{
	$tabla = fetch_league_table();

	if (!$tabla || !is_array($tabla)) {
		echo "<script>console.log('Error: fetch_league_table() retornó datos vacíos o inválidos');</script>";
		return [];
	}

	echo "<script>console.log('Sincronizando clasificación en BBDD...');</script>";

	$metadata = get_standings_metadata();
	$snapshot_id = $metadata['snapshot_id'];
	$season_id = $metadata['season_id'];
	$matchday_ref = $metadata['matchday_ref'];
	$type = $metadata['type'];
	$source_name = $metadata['source_name'];
	$source_url = $metadata['source_url'];
	$generated_at = $metadata['generated_at'];
	$tie_break_rules = $metadata['tie_break_rules'];

	$check_snapshot = $conn->prepare('SELECT id FROM standings_snapshots WHERE id = ?');
	if (!$check_snapshot) {
		echo "<script>console.log('Error preparando check_snapshot: " . addslashes($conn->error) . "');</script>";
		return [];
	}

	$check_snapshot->bind_param('i', $snapshot_id);
	$check_snapshot->execute();
	$check_snapshot->store_result();
	$snapshot_exists = $check_snapshot->num_rows > 0;
	$check_snapshot->close();

	if ($snapshot_exists) {
		// Actualizar snapshot existente
		$update_snapshot = $conn->prepare('UPDATE standings_snapshots SET season_id = ?, matchday_ref = ?, type = ?, source_name = ?, source_url = ?, generated_at = ?, tie_break_rules = ? WHERE id = ?');
		if (!$update_snapshot) {
			echo "<script>console.log('Error preparando update_snapshot: " . addslashes($conn->error) . "');</script>";
			return [];
		}
		$update_snapshot->bind_param('issssssi', $season_id, $matchday_ref, $type, $source_name, $source_url, $generated_at, $tie_break_rules, $snapshot_id);
		if (!$update_snapshot->execute()) {
			echo "<script>console.log('Error actualizando snapshot: " . addslashes($conn->error) . "');</script>";
			$update_snapshot->close();
			return [];
		}
		$update_snapshot->close();
		echo "<script>console.log('Snapshot actualizado: ID " . $snapshot_id . "');</script>";
	} else {
		// Insertar nuevo snapshot
		$insert_snapshot = $conn->prepare('INSERT INTO standings_snapshots (id, season_id, matchday_ref, type, source_name, source_url, generated_at, tie_break_rules) VALUES (?, ?, ?, ?, ?, ?, ?, ?)');
		if (!$insert_snapshot) {
			echo "<script>console.log('Error preparando insert_snapshot: " . addslashes($conn->error) . "');</script>";
			return [];
		}
		$insert_snapshot->bind_param('isssssss', $snapshot_id, $season_id, $matchday_ref, $type, $source_name, $source_url, $generated_at, $tie_break_rules);
		if (!$insert_snapshot->execute()) {
			echo "<script>console.log('Error insertando snapshot: " . addslashes($conn->error) . "');</script>";
			$insert_snapshot->close();
			return [];
		}
		$insert_snapshot->close();
		echo "<script>console.log('Snapshot creado: ID " . $snapshot_id . "');</script>";
	}

	// 2. Eliminar filas antiguas del snapshot
	$delete_rows = $conn->prepare('DELETE FROM standings_rows WHERE snapshot_id = ?');
	if (!$delete_rows) {
		echo "<script>console.log('Error preparando delete_rows: " . addslashes($conn->error) . "');</script>";
		return [];
	}
	$delete_rows->bind_param('i', $snapshot_id);
	if (!$delete_rows->execute()) {
		echo "<script>console.log('Error eliminando filas: " . addslashes($conn->error) . "');</script>";
		$delete_rows->close();
		return [];
	}
	$delete_rows->close();
	echo "<script>console.log('Filas antiguas eliminadas del snapshot');</script>";

	// 3. Insertar nuevas filas
	$stmt = $conn->prepare('INSERT INTO standings_rows (snapshot_id, team_id, position, pj, pg, pe, pp, gf, gc, dg, pts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)');

	if (!$stmt) {
		echo "<script>console.log('Error preparando statement: " . addslashes($conn->error) . "');</script>";
		return [];
	}

	$inserted = 0;

	foreach ($tabla as $row) {
		$team_id = (int)($row['teamid'] ?? $row['api_id_equipo'] ?? null);
		$position = (int)($row['position'] ?? $row['posicion'] ?? null);
		$pts = (int)($row['total'] ?? $row['puntos'] ?? null);
		$pj = (int)($row['played'] ?? $row['jugados'] ?? null);
		$pg = (int)($row['win'] ?? $row['ganados'] ?? null);
		$pe = (int)($row['draw'] ?? $row['empatados'] ?? null);
		$pp = (int)($row['loss'] ?? $row['perdidos'] ?? null);
		$gf = (int)($row['goalsfor'] ?? $row['goles_favor'] ?? null);
		$gc = (int)($row['goalsagainst'] ?? $row['goles_contra'] ?? null);
		$dg = (int)($row['goalsdifference'] ?? $row['diferencia_goles'] ?? null);

		if ($team_id === null || $team_id === 0) {
			echo "<script>console.log('Advertencia: team_id nulo en clasificación, saltando fila');</script>";
			continue;
		}

		// Verificar que el equipo existe en tabla teams
		$check_team = $conn->prepare('SELECT id FROM teams WHERE id = ?');
		if (!$check_team) {
			echo "<script>console.log('Error preparando check_team: " . addslashes($conn->error) . "');</script>";
			continue;
		}

		$check_team->bind_param('i', $team_id);
		$check_team->execute();
		$check_team->store_result();

		if ($check_team->num_rows === 0) {
			echo "<script>console.log('Advertencia: Equipo con team_id=" . $team_id . " no existe en tabla teams');</script>";
			$check_team->close();
			continue;
		}
		$check_team->close();

		$stmt->bind_param(
			'iiiiiiiiiii',
			$snapshot_id,
			$team_id,
			$position,
			$pj,
			$pg,
			$pe,
			$pp,
			$gf,
			$gc,
			$dg,
			$pts
		);

		if ($stmt->execute()) {
			$inserted++;
		} else {
			echo "<script>console.log('Error insertando fila para team_id=" . $team_id . ": " . addslashes($conn->error) . "');</script>";
		}
	}
	$stmt->close();

	echo "<script>console.log('Sincronización de clasificación completada. Datos insertados: " . $inserted . " de " . count($tabla) . "');</script>";

	// 4. Retornar datos ordenados por posición
	$result = $conn->query('SELECT sr.* FROM standings_rows sr WHERE sr.snapshot_id = 1 ORDER BY sr.position ASC');
	$datos = [];
	if ($result) {
		while ($row = $result->fetch_assoc()) {
			$datos[] = $row;
		}
	}
	return $datos;
}
