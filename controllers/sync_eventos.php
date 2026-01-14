
<?php
require_once __DIR__ . '/../database/db.php';
require_once __DIR__ . '/../api/thesportsdb.php';
require_once __DIR__ . '/../config/config.php';

function sincronizar_y_obtener_eventos($conn) {
    $key = 'events';
    $ttl = TTL_EVENTOS;

    $stmt = $conn->prepare('SELECT updated_at, is_updating FROM sync_status WHERE cache_key = ?');
    $stmt->bind_param('s', $key);
    $stmt->execute();
    $stmt->store_result();
    if ($stmt->num_rows === 0) {
        $stmt->close();
        return ['error' => 'No hay registros disponibles para los eventos'];
    }
    $updated_at = null;
    $is_updating = null;
    $stmt->bind_result($updated_at, $is_updating);
    $stmt->fetch();
    $stmt->close();

    $now = time();
    $last_update = $updated_at ? strtotime($updated_at) : 0;

    if ($now - $last_update > $ttl && !$is_updating) {
        $conn->query("UPDATE sync_status SET is_updating = 1 WHERE cache_key = '$key'");
        $eventos = fetch_league_events();
        if ($eventos) {
            $conn->query('DELETE FROM eventos');
            $stmt = $conn->prepare('INSERT INTO eventos (idEvent, dateEvent, strEvent, strHomeTeam, strAwayTeam, intHomeScore, intAwayScore) VALUES (?, ?, ?, ?, ?, ?, ?)');
            foreach ($eventos as $ev) {
                $stmt->bind_param(
                    'sssssss',
                    $ev['idEvent'],
                    $ev['dateEvent'],
                    $ev['strEvent'],
                    $ev['strHomeTeam'],
                    $ev['strAwayTeam'],
                    $ev['intHomeScore'],
                    $ev['intAwayScore']
                );
                $stmt->execute();
            }
            $stmt->close();
            $conn->query("UPDATE sync_status SET updated_at = NOW(), is_updating = 0 WHERE cache_key = '$key'");
        } else {
            $conn->query("UPDATE sync_status SET is_updating = 0 WHERE cache_key = '$key'");
        }
    }

    $result = $conn->query('SELECT * FROM eventos');
    $datos = [];
    while ($row = $result->fetch_assoc()) {
        $datos[] = $row;
    }
    return $datos;
}
