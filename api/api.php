<?php

if (defined('API_LALIGA_LOADED')) {
    return;
}
define('API_LALIGA_LOADED', true);

//require_once __DIR__ . '/../config/config.php';

// Cargar API
function load_api_data()
{
    $apiPath = __DIR__ . '/laliga_2025_2026_api_v3.json';
    if (!file_exists($apiPath)) {
        return null;
    }
    $jsonContent = file_get_contents($apiPath);
    if ($jsonContent === false) {
        return null;
    }
    return json_decode($jsonContent, true);
}

// Obtener ID de competición
function get_competition_id()
{
    $data = load_api_data();
    if (!$data || !isset($data['competition']['id'])) {
        return 1;
    }
    return $data['competition']['id'];
}

// Obtener nombre de competición
function get_competition_name()
{
    $data = load_api_data();
    if (!$data || !isset($data['competition']['name'])) {
        return 'LALIGA EA SPORTS';
    }
    return $data['competition']['name'];
}

// Obtener ID de season
function get_season_id()
{
    $data = load_api_data();
    if (!$data || !isset($data['season']['id'])) {
        return 20252026;
    }
    return $data['season']['id'];
}

// Obtener nombre de season
function get_season_name()
{
    $data = load_api_data();
    if (!$data || !isset($data['season']['name'])) {
        return '2025-2026';
    }
    return $data['season']['name'];
}

// Obtener mapeo de IDs de teams
function get_teams_ids()
{
    $data = load_api_data();
    if (!$data || !isset($data['teams'])) {
        return [];
    }

    $teams_ids = [];
    foreach ($data['teams'] as $team) {
        $teams_ids[] = [
            'id' => $team['id'],
            'name' => $team['name'],
            'short_name' => $team['short_name'] ?? '',
            'code' => $team['code'] ?? ''
        ];
    }
    return $teams_ids;
}

// Obtener metadatos de la API
function get_api_metadata()
{
    $data = load_api_data();
    if (!$data) {
        return null;
    }

    $teams_map = [];
    if (isset($data['teams']) && is_array($data['teams'])) {
        foreach ($data['teams'] as $team) {
            $teams_map[] = [
                'id' => $team['id'],
                'name' => $team['name'],
                'short_name' => $team['short_name'] ?? '',
                'code' => $team['code'] ?? '',
                'slug' => $team['slug'] ?? ''
            ];
        }
    }

    return [
        'schema_version' => $data['schema_version'] ?? null,
        'competition_id' => $data['competition']['id'] ?? null,
        'competition_name' => $data['competition']['name'] ?? null,
        'competition_slug' => $data['competition']['slug'] ?? null,
        'season_id' => $data['season']['id'] ?? null,
        'season_name' => $data['season']['name'] ?? null,
        'total_teams' => count($data['teams'] ?? []),
        'total_matches' => count($data['matches'] ?? []),
        'teams' => $teams_map,
        'updated_at_utc' => $data['season']['updated_at_utc'] ?? null
    ];
}


// Obtener metadatos de standings para sincronización
function get_standings_metadata()
{
    $data = load_api_data();
    if (!$data) {
        return null;
    }

    return [
        'snapshot_id' => 1,
        'season_id' => $data['season']['id'] ?? 20252026,
        'matchday_ref' => $data['standings']['matchday'] ?? 20,
        'type' => 'official',
        'source_name' => $data['competition']['name'] ?? 'LALIGA',
        'source_url' => 'https://www.laliga.com/en-GB/laliga-easports/standing',
        'generated_at' => $data['season']['updated_at_utc'] ?? date('Y-m-d H:i:s'),
        'tie_break_rules' => json_encode(['points', 'head_to_head_points', 'head_to_head_goal_difference', 'goal_difference', 'goals_for', 'fair_play'])
    ];
}


// Buscar equipos por nombre
function fetch_teams($teamName)
{
    $data = load_api_data();
    if (!$data || !isset($data['teams'])) {
        return [];
    }
    $teamName = strtolower($teamName);
    $results = [];
    foreach ($data['teams'] as $team) {
        if (stripos($team['name'], $teamName) !== false) {
            $results[] = [
                'idTeam' => $team['id'],
                'name' => $team['name'],
                'short_name' => $team['short_name'] ?? '',
                'crest_url' => $team['crest_url'] ?? '',
                'stadium' => $team['stadium']['name'] ?? '',
                'city' => $team['city'] ?? '',
                'stadium_capacity' => $team['stadium']['capacity'] ?? 0,
                'updated_at' => $team['updated_at_utc'] ?? date('Y-m-d H:i:s')
            ];
        }
    }
    return $results;
}

// Obtener todos los equipos de la liga
function fetch_all_teams()
{
    $data = load_api_data();
    if (!$data || !isset($data['teams'])) {
        return [];
    }
    $results = [];
    foreach ($data['teams'] as $team) {
        $results[] = [
            'idTeam' => $team['id'],
            'api_id_equipo' => (string)$team['id'],
            'strTeam' => $team['name'],
            'nombre' => $team['name'],
            'strTeamShort' => $team['short_name'] ?? '',
            'short_name' => $team['short_name'] ?? '',
            'strTeam2Badge' => $team['crest_url'] ?? '',
            'escudo_url' => $team['crest_url'] ?? '',
            'intFormedYear' => null,
            'strStadium' => $team['stadium']['name'] ?? '',
            'estadio' => $team['stadium']['name'] ?? '',
            'strCity' => $team['city'] ?? '',
            'ciudad' => $team['city'] ?? '',
            'stadio_capacidad' => $team['stadium']['capacity'] ?? 0,
            'strCountry' => 'Spain',
            'strLeague' => 'LALIGA EA SPORTS',
            'updated_at' => $team['updated_at_utc'] ?? date('Y-m-d H:i:s')
        ];
    }
    return $results;
}

// Obtener la clasificación de la liga
function fetch_league_table()
{
    $data = load_api_data();
    if (!$data) {
        return [];
    }

    if (isset($data['standings']['table']) && !empty($data['standings']['table'])) {
        $standings = [];
        foreach ($data['standings']['table'] as $row) {
            $standings[] = [
                'teamid' => (string)$row['team']['id'],
                'api_id_equipo' => (string)$row['team']['id'],
                'position' => (int)$row['position'],
                'posicion' => (int)$row['position'],
                'played' => (int)$row['stats']['played'],
                'jugados' => (int)$row['stats']['played'],
                'win' => (int)$row['stats']['wins'],
                'ganados' => (int)$row['stats']['wins'],
                'draw' => (int)$row['stats']['draws'],
                'empatados' => (int)$row['stats']['draws'],
                'loss' => (int)$row['stats']['losses'],
                'perdidos' => (int)$row['stats']['losses'],
                'goalsfor' => (int)$row['stats']['goals_for'],
                'goles_favor' => (int)$row['stats']['goals_for'],
                'goalsagainst' => (int)$row['stats']['goals_against'],
                'goles_contra' => (int)$row['stats']['goals_against'],
                'goalsdifference' => (int)$row['stats']['goals_for'] - (int)$row['stats']['goals_against'],
                'diferencia_goles' => (int)$row['stats']['goals_for'] - (int)$row['stats']['goals_against'],
                'total' => (int)$row['stats']['points'],
                'puntos' => (int)$row['stats']['points']
            ];
        }
        return $standings;
    }

    // Si no hay tabla precomputada, retornar array vacío
    return [];
}

// Obtener los eventos/partidos de la liga
function fetch_league_events()
{
    $data = load_api_data();
    if (!$data || !isset($data['matches'])) {
        return [];
    }

    $results = [];
    $equiposMap = isset($data['teams']) ? array_column($data['teams'], 'name', 'id') : [];

    foreach ($data['matches'] as $match) {
        $homeTeamId = $match['home_team_id'];
        $awayTeamId = $match['away_team_id'];
        $homeTeamName = $match['embed']['home_team']['name'] ?? $equiposMap[$homeTeamId] ?? 'Unknown';
        $awayTeamName = $match['embed']['away_team']['name'] ?? $equiposMap[$awayTeamId] ?? 'Unknown';

        $homeScore = $match['score']['full_time']['home'] ?? null;
        $awayScore = $match['score']['full_time']['away'] ?? null;
        $matchday = $match['matchday'] ?? 0;

        $results[] = [
            'idEvent' => $match['id'],
            'api_id_evento' => (string)$match['id'],
            'strEvent' => $homeTeamName . ' vs ' . $awayTeamName,
            'nombre_evento' => $homeTeamName . ' vs ' . $awayTeamName,
            'dateEvent' => $match['utc_date'] ?? null,
            'fecha_evento' => isset($match['utc_date']) ? date('Y-m-d', strtotime($match['utc_date'])) : null,
            'intHomeScore' => $homeScore,
            'goles_local' => $homeScore,
            'intAwayScore' => $awayScore,
            'goles_visitante' => $awayScore,
            'strHomeTeam' => $homeTeamName,
            'equipo_local' => $homeTeamName,
            'strAwayTeam' => $awayTeamName,
            'equipo_visitante' => $awayTeamName,
            'strVenue' => $match['venue'] ?? '',
            'strStatus' => $match['status'] ?? '',
            'strRound' => 'Jornada ' . $matchday,
            'intHomeTeamId' => $homeTeamId,
            'intAwayTeamId' => $awayTeamId,
            'home_team_id' => $homeTeamId,
            'away_team_id' => $awayTeamId,
            'matchday' => $matchday,
            'jornada' => $matchday,
            'updated_at' => $match['updated_at_utc'] ?? date('Y-m-d H:i:s')
        ];
    }

    return $results;
}

// Obtener detalles de un equipo por ID
function fetch_team_details($teamId)
{
    $data = load_api_data();
    if (!$data || !isset($data['teams'])) {
        return null;
    }

    foreach ($data['teams'] as $team) {
        if ($team['id'] == $teamId) {
            return [
                'idTeam' => $team['id'],
                'api_id_equipo' => (string)$team['id'],
                'strTeam' => $team['name'],
                'nombre' => $team['name'],
                'strTeamShort' => $team['short_name'] ?? '',
                'short_name' => $team['short_name'] ?? '',
                'strTeam2Badge' => $team['crest_url'] ?? '',
                'escudo_url' => $team['crest_url'] ?? '',
                'strStadium' => $team['stadium']['name'] ?? '',
                'estadio' => $team['stadium']['name'] ?? '',
                'strCity' => $team['city'] ?? '',
                'ciudad' => $team['city'] ?? '',
                'strCountry' => 'Spain',
                'strLeague' => 'LALIGA EA SPORTS',
                'intStadiumCapacity' => $team['stadium']['capacity'] ?? 0,
                'stadio_capacidad' => $team['stadium']['capacity'] ?? 0,
                'strStadiumLocation' => $team['city'] ?? '',
                'updated_at' => $team['updated_at_utc'] ?? date('Y-m-d H:i:s')
            ];
        }
    }

    return null;
}

// Obtener jugadores de un equipo por ID
function fetch_team_players($teamId)
{
    // No hay datos de jugadores aun en la API que he creado.
    return [];
}

// Obtener eventos de un equipo por ID
function fetch_team_events($teamId)
{
    $data = load_api_data();
    if (!$data || !isset($data['matches'])) {
        return ['last' => [], 'next' => []];
    }

    $lastEvents = [];
    $nextEvents = [];
    $equiposMap = isset($data['teams']) ? array_column($data['teams'], 'name', 'id') : [];

    foreach ($data['matches'] as $match) {
        $isHomeTeam = $match['home_team_id'] == $teamId;
        $isAwayTeam = $match['away_team_id'] == $teamId;

        if (!$isHomeTeam && !$isAwayTeam) {
            continue;
        }

        $homeTeamName = $match['embed']['home_team']['name'] ?? $equiposMap[$match['home_team_id']] ?? 'Unknown';
        $awayTeamName = $match['embed']['away_team']['name'] ?? $equiposMap[$match['away_team_id']] ?? 'Unknown';

        $homeScore = $match['score']['full_time']['home'] ?? null;
        $awayScore = $match['score']['full_time']['away'] ?? null;
        $matchday = $match['matchday'] ?? 0;

        $event = [
            'idEvent' => $match['id'],
            'api_id_evento' => (string)$match['id'],
            'strEvent' => $homeTeamName . ' vs ' . $awayTeamName,
            'nombre_evento' => $homeTeamName . ' vs ' . $awayTeamName,
            'dateEvent' => $match['utc_date'] ?? null,
            'fecha_evento' => isset($match['utc_date']) ? date('Y-m-d', strtotime($match['utc_date'])) : null,
            'intHomeScore' => $homeScore,
            'goles_local' => $homeScore,
            'intAwayScore' => $awayScore,
            'goles_visitante' => $awayScore,
            'strHomeTeam' => $homeTeamName,
            'equipo_local' => $homeTeamName,
            'strAwayTeam' => $awayTeamName,
            'equipo_visitante' => $awayTeamName,
            'strVenue' => $match['venue'] ?? '',
            'strStatus' => $match['status'] ?? '',
            'matchday' => $matchday,
            'jornada' => $matchday
        ];

        if ($match['status'] === 'finished') {
            $lastEvents[] = $event;
        } else {
            $nextEvents[] = $event;
        }
    }

    return [
        'last' => $lastEvents,
        'next' => $nextEvents
    ];
}
