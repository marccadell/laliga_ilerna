<?php
require __DIR__ . '/../../config/config.php';
require __DIR__ . '/../../database/db.php';
require __DIR__ . '/../../api/api.php';
require __DIR__ . '/../../controllers/sync_equipos.php';

header('Content-Type: application/json; charset=utf-8');


$equipos = sincronizar_y_obtener_equipos($conn);

if (!$equipos || !is_array($equipos)) {
    http_response_code(500);
    echo json_encode(['error' => 'Error al sincronizar equipos']);
    exit;
}

echo json_encode($equipos, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);
exit;
