<?php
require __DIR__ . '/../../config/config.php';
require __DIR__ . '/../../database/db.php';
require __DIR__ . '/../../api/api.php';
require __DIR__ . '/../../controllers/sync_clasificacion.php';

header('Content-Type: application/json; charset=utf-8');

$clasificacion = sincronizar_y_obtener_clasificacion($conn);

if (!$clasificacion || !is_array($clasificacion)) {
    http_response_code(500);
    echo json_encode(['error' => 'Error al sincronizar clasificación']);
    exit;
}

$datos = [];
foreach ($clasificacion as $row) {
    $result = $conn->query('SELECT name, short_name, crest_url FROM teams WHERE id = ' . intval($row['team_id']));
    $team = $result ? $result->fetch_assoc() : null;

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
        'team_name' => $team['name'] ?? 'N/A',
        'team_short_name' => $team['short_name'] ?? 'N/A',
        'crest_url' => $team['crest_url'] ?? 'https://via.placeholder.com/40'
    ];
}

echo json_encode($datos, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);
exit;
