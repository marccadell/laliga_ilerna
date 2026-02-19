<?php
header('Content-Type: application/json; charset=utf-8');

try {
    require __DIR__ . '/../../config/config.php';
    require __DIR__ . '/../../database/db.php';
    require __DIR__ . '/../../controllers/sync_eventos.php';

    $eventos = @sincronizar_y_obtener_eventos($conn);

    echo json_encode($eventos, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);
} catch (Throwable $e) {
    http_response_code(500);
}
exit;
