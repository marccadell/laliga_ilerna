<?php
function sincronizar_y_obtener_eventos($conn)
{
    $eventos_api = fetch_league_events();

    if (!$eventos_api || !is_array($eventos_api)) {
        return [];
    }

    $conn->query('SET FOREIGN_KEY_CHECKS=0');

    $delete_result = $conn->query('DELETE FROM matches WHERE season_id = ' . (int) SEASON_ID);
    if (!$delete_result) {
        $conn->query('SET FOREIGN_KEY_CHECKS=1');
        return [];
    }

    $stmt = $conn->prepare("
        INSERT INTO `matches`
        (`id`, `season_id`, `matchday`, `utc_date`, `timezone`, `local_date`, `venue`,
        `home_team_id`, `away_team_id`, `status`, `ft_home`, `ft_away`, `ht_home`, `ht_away`,
        `winner`, `points_home`, `points_away`, `updated_at`)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())");
    if (!$stmt) {
        $conn->query('SET FOREIGN_KEY_CHECKS=1');
        return [];
    }
    $inserted = 0;

    foreach ($eventos_api as $evento) {
        $id = (int) ($evento['id'] ?? 0);
        $season_id = (int) ($evento['season_id'] ?? SEASON_ID);
        $matchday = (int) ($evento['matchday'] ?? 0);
        $utc_date = $evento['utc_date'] ?? null;
        $timezone = $evento['timezone'] ?? 'Europe/Madrid';
        $local_date_raw = $evento['local_date'] ?? null;
        $local_date = null;
        if ($local_date_raw) {
            $local_date = preg_replace('/[\+\-]\d{2}:?\d{2}$/', '', $local_date_raw);
        }
        $venue = $evento['venue'] ?? '';
        $home_team_id = (int) ($evento['home_team_id'] ?? 0);
        $away_team_id = (int) ($evento['away_team_id'] ?? 0);
        $status = $evento['status'] ?? 'scheduled';
        $ft_home = isset($evento['goles_local']) ? (int) $evento['goles_local'] : null;
        $ft_away = isset($evento['goles_visitante']) ? (int) $evento['goles_visitante'] : null;
        $ht_home = isset($evento['home_score_half']) ? (int) $evento['home_score_half'] : null;
        $ht_away = isset($evento['away_score_half']) ? (int) $evento['away_score_half'] : null;
        $winner = $evento['winner'] ?? null;
        $points_home = (int) ($evento['points_home'] ?? 0);
        $points_away = (int) ($evento['points_away'] ?? 0);

        if ($id === 0) {
            continue;
        }

        $stmt->bind_param(
            'iiissssiiissiisii',
            $id,
            $season_id,
            $matchday,
            $utc_date,
            $timezone,
            $local_date,
            $venue,
            $home_team_id,
            $away_team_id,
            $status,
            $ft_home,
            $ft_away,
            $ht_home,
            $ht_away,
            $winner,
            $points_home,
            $points_away
        );

        if ($stmt->execute()) {
            $inserted++;
        }
    }
    $stmt->close();

    $conn->query('SET FOREIGN_KEY_CHECKS=1');

    $result = $conn->query('SELECT m.*,
                            ht.name as home_team_name, ht.short_name as home_team_short_name, ht.code as home_team_code, ht.crest_url as home_team_crest,
                            at.name as away_team_name, at.short_name as away_team_short_name, at.code as away_team_code, at.crest_url as away_team_crest
                            FROM matches m
                            LEFT JOIN teams ht ON m.home_team_id = ht.id
                            LEFT JOIN teams at ON m.away_team_id = at.id
                            WHERE m.season_id = ' . (int) SEASON_ID . '
                            ORDER BY m.utc_date DESC');
    $datos = [];
    if ($result) {
        while ($row = $result->fetch_assoc()) {
            $datos[] = $row;
        }
    }
    return $datos;
}
