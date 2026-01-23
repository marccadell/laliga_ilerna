<?php
require '../../database/db.php';
require '../../api/api.php';
require '../../controllers/sync_clasificacion.php';

// Sincronizar y obtener clasificación
$clasificacion = sincronizar_y_obtener_clasificacion($conn);

// Enriquecer con nombres de equipos
$result = $conn->query('SELECT sr.*, t.name, t.short_name, t.crest_url FROM standings_rows sr LEFT JOIN teams t ON sr.team_id = t.id WHERE sr.snapshot_id = 1 ORDER BY sr.position ASC');

$datos = [];
if ($result) {
	while ($row = $result->fetch_assoc()) {
		$datos[] = [
			'snapshot_id' => $row['snapshot_id'],
			'team_id' => $row['team_id'],
			'position' => $row['position'],
			'pj' => $row['pj'],
			'pg' => $row['pg'],
			'pe' => $row['pe'],
			'pp' => $row['pp'],
			'gf' => $row['gf'],
			'gc' => $row['gc'],
			'dg' => $row['dg'],
			'pts' => $row['pts'],
			'team_name' => $row['name'],
			'team_short_name' => $row['short_name'],
			'crest_url' => $row['crest_url']
		];
	}
}

header('Content-Type: application/json; charset=utf-8');
echo json_encode($datos, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);
exit;
