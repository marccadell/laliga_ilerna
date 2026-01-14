<?php
require_once __DIR__ . '/../database/db.php';
require_once __DIR__ . '/../api/thesportsdb.php';
require_once __DIR__ . '/../config/config.php';



function sincronizar_y_obtener_equipos($conn) {
	$key = 'equipos';
	$ttl = TTL_EQUIPOS;
	try {
		$stmt = $conn->prepare('SELECT updated_at, is_updating FROM sync_status WHERE data_key = ?');
		$stmt->bind_param('s', $key);
		$stmt->execute();
		$stmt->store_result();
		if ($stmt->num_rows === 0) {
			$stmt->close();
			return ['error' => 'No hay registros disponibles para los equipos'];
		}
		$updated_at = null;
		$is_updating = null;
		$stmt->bind_result($updated_at, $is_updating);
		$stmt->fetch();
		$stmt->close();

		$now = time();
		$last_update = $updated_at ? strtotime($updated_at) : 0;

		if ($now - $last_update > $ttl && !$is_updating) {
			$conn->query("UPDATE sync_status SET is_updating = 1 WHERE data_key = '$key'");

			$equipos = fetch_all_teams();
			if ($equipos) {
				$conn->query('DELETE FROM equipos');
				$stmt = $conn->prepare('INSERT INTO equipos (idTeam, strTeam, strTeamBadge, strStadium, strDescriptionES) VALUES (?, ?, ?, ?, ?)');
				foreach ($equipos as $eq) {
					$stmt->bind_param(
						'sssss',
						$eq['idTeam'],
						$eq['strTeam'],
						$eq['strTeamBadge'],
						$eq['strStadium'],
						$eq['strDescriptionES']
					);
					$stmt->execute();
				}
				$stmt->close();
				$conn->query("UPDATE sync_status SET updated_at = NOW(), is_updating = 0 WHERE data_key = '$key'");
			} else {
				$conn->query("UPDATE sync_status SET is_updating = 0 WHERE data_key = '$key'");
			}
		}

		$result = $conn->query('SELECT * FROM equipos');
		if (!$result) {
			return ['error' => 'Error al consultar equipos: ' . $conn->error];
		}
		$datos = [];
		while ($row = $result->fetch_assoc()) {
			$datos[] = $row;
		}
		return $datos;
	} catch (Exception $e) {
		return ['error' => 'Error en sincronizar_y_obtener_equipos: ' . $e->getMessage()];
	}
}
