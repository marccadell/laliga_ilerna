<?php
	function sincronizar_y_obtener_equipos($conn)
	{
		$equipos_api = fetch_all_teams();

		if (!$equipos_api || !is_array($equipos_api)) {
			echo "<script>console.log('fetch_all_teams() ha devuelto datos vacios o invalidos');</script>";
			return [];
		}
		echo "<script>console.log('Sincronizando equipos en BBDD...');</script>";

		$conn->query('SET FOREIGN_KEY_CHECKS=0');

		$delete_result = $conn->query('DELETE FROM teams');
		if (!$delete_result) {
			echo "<script>console.log('Error eliminando equipos antiguos: " . addslashes($conn->error) . "');</script>";
			$conn->query('SET FOREIGN_KEY_CHECKS=1');
			return [];
		}
		echo "<script>console.log('Equipos antiguos eliminados');</script>";

		$stmt = $conn->prepare('INSERT INTO teams (id, season_id, name, short_name, code,
					slug, crest_url, stadium, stadium_capacity, city, updated_at)
					VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())');
		if (!$stmt) {
			echo "<script>console.log('Error preparando statement: " . addslashes($conn->error) . "');</script>";
			return [];
		}
		$inserted = 0;

		foreach ($equipos_api as $equipo) {
			$id = (int)($equipo['id'] ?? null);
			$season_id = (int)SEASON_ID;
			$name = $equipo['name'] ?? null;
			$short_name = $equipo['short_name'] ?? null;
			$code = $equipo['code'] ?? '';
			$slug = $equipo['slug'] ?? '';
			$crest_url = $equipo['crest_url'] ?? null;
			$stadium = $equipo['stadium'] ?? null;
			$stadium_capacity = (int)($equipo['stadium_capacity'] ?? 0);
			$city = $equipo['city'] ?? null;

			if ($id === null || $id === 0) {
				echo "<script>console.log('ID NULL en equipo, SKIP');</script>";
				continue;
			}

			$stmt->bind_param(
				'iissssssis',
				$id,
				$season_id,
				$name,
				$short_name,
				$code,
				$slug,
				$crest_url,
				$stadium,
				$stadium_capacity,
				$city
			);

			if ($stmt->execute()) {
				$inserted++;
			} else {
				echo "<script>console.log('Error insertando equipo id=" . $id . ": " . addslashes($conn->error) . "');</script>";
			}
		}
		$stmt->close();
		echo "<script>console.log('Sincronizacion de equipos completada, equipos insertados: " . $inserted . " de " . count($equipos_api) . "');</script>";

		$conn->query('SET FOREIGN_KEY_CHECKS=1');

		$result = $conn->query('SELECT * FROM teams WHERE season_id = ' . SEASON_ID . ' ORDER BY name ASC');
		$datos = [];
		if ($result) {
			while ($row = $result->fetch_assoc()) {
				$datos[] = $row;
			}
		}
		return $datos;

}
