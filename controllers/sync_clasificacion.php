<?php
	function sincronizar_y_obtener_clasificacion($conn)
	{
		$tabla = fetch_league_table();

		if (!$tabla || !is_array($tabla)) {
			return [];
		}

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
			return [];
		}

		$check_snapshot->bind_param('i', $snapshot_id);
		$check_snapshot->execute();
		$check_snapshot->store_result();
		$snapshot_exists = $check_snapshot->num_rows > 0;
		$check_snapshot->close();

		if ($snapshot_exists) {
			$update_snapshot = $conn->prepare('UPDATE standings_snapshots SET season_id = ?, matchday_ref = ?, type = ?, source_name = ?, source_url = ?, generated_at = ?, tie_break_rules = ? WHERE id = ?');
			if (!$update_snapshot) {
				return [];
			}

			$update_snapshot->bind_param('issssssi', $season_id, $matchday_ref, $type, $source_name, $source_url, $generated_at, $tie_break_rules, $snapshot_id);
			if (!$update_snapshot->execute()) {
				$update_snapshot->close();
				return [];
			}

			$update_snapshot->close();
		} else {
			$insert_snapshot = $conn->prepare('INSERT INTO standings_snapshots (id, season_id, matchday_ref, type, source_name, source_url, generated_at, tie_break_rules) VALUES (?, ?, ?, ?, ?, ?, ?, ?)');
			if (!$insert_snapshot) {
				return [];
			}

			$insert_snapshot->bind_param('isssssss', $snapshot_id, $season_id, $matchday_ref, $type, $source_name, $source_url, $generated_at, $tie_break_rules);
			if (!$insert_snapshot->execute()) {
				$insert_snapshot->close();
				return [];
			}

			$insert_snapshot->close();
		}

		$delete_rows = $conn->prepare('DELETE FROM standings_rows WHERE snapshot_id = ?');
		if (!$delete_rows) {
			return [];
		}

		$delete_rows->bind_param('i', $snapshot_id);
		if (!$delete_rows->execute()) {
			$delete_rows->close();
			return [];
		}
		$delete_rows->close();

		$stmt = $conn->prepare('INSERT INTO standings_rows (snapshot_id, team_id, position,
					pj, pg, pe, pp, gf, gc, dg, pts)
					VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)');
		if (!$stmt) {
			return [];
		}

		$inserted = 0;

		foreach ($tabla as $row) {
			$team_id = (int) ($row['teamid'] ?? $row['api_id_equipo'] ?? null);
			$position = (int) ($row['position'] ?? $row['posicion'] ?? null);
			$pts = (int) ($row['total'] ?? $row['puntos'] ?? null);
			$pj = (int) ($row['played'] ?? $row['jugados'] ?? null);
			$pg = (int) ($row['win'] ?? $row['ganados'] ?? null);
			$pe = (int) ($row['draw'] ?? $row['empatados'] ?? null);
			$pp = (int) ($row['loss'] ?? $row['perdidos'] ?? null);
			$gf = (int) ($row['goalsfor'] ?? $row['goles_favor'] ?? null);
			$gc = (int) ($row['goalsagainst'] ?? $row['goles_contra'] ?? null);
			$dg = (int) ($row['goalsdifference'] ?? $row['diferencia_goles'] ?? null);

			if ($team_id === null || $team_id === 0) {
				continue;
			}

			$check_team = $conn->prepare('SELECT id FROM teams WHERE id = ?');
			if (!$check_team) {
				continue;
			}

			$check_team->bind_param('i', $team_id);
			$check_team->execute();
			$check_team->store_result();

			if ($check_team->num_rows === 0) {
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
			}
		}
		$stmt->close();

		$result = $conn->query('SELECT sr.* FROM standings_rows sr WHERE sr.snapshot_id = 1 ORDER BY sr.position ASC');
		$datos = [];
		if ($result) {
			while ($row = $result->fetch_assoc()) {
				$datos[] = $row;
			}
		}
		return $datos;
}
