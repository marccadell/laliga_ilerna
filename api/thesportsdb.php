<?php
require_once __DIR__ . '/../config/config.php';

// Buscar equipos por el nombre
function fetch_teams($teamName) {
	$apiKey = API_KEY;
	$baseUrl = 'https://www.thesportsdb.com/api/v1/json/' . $apiKey . '/searchteams.php?t=' . urlencode($teamName);
	$response = file_get_contents($baseUrl);
	if ($response === false) {
		return null;
	}
	$data = json_decode($response, true);
	return $data['teams'] ?? [];
}

// Obtener todos los equipos de la liga
function fetch_all_teams($leagueId = LEAGUE_ID) {
    $apiKey = API_KEY;
    $baseUrl = 'https://www.thesportsdb.com/api/v1/json/' . $apiKey . '/lookup_all_teams.php?id=' . urlencode($leagueId);
    $response = file_get_contents($baseUrl);
    if ($response === false) {
        return null;
    }
    $data = json_decode($response, true);
    return $data['teams'] ?? [];
}

// Obtener la clasificacion de la liga
function fetch_league_table($leagueId = LEAGUE_ID, $season = SEASON) {
    $apiKey = API_KEY;
    $baseUrl = 'https://www.thesportsdb.com/api/v1/json/' . $apiKey . '/lookuptable.php?l=' . urlencode($leagueId) . '&s=' . urlencode($season);
    $response = file_get_contents($baseUrl);
    if ($response === false) {
        return null;
    }
    $data = json_decode($response, true);
    return $data['table'] ?? [];
}

// Obetener los eventos de los partidos futuros y que ya han ocurrio de la liga
function fetch_league_events($leagueId = LEAGUE_ID, $season = SEASON) {
    $apiKey = API_KEY;
    $baseUrl = 'https://www.thesportsdb.com/api/v1/json/' . $apiKey . '/eventsseason.php?id=' . urlencode($leagueId) . '&s=' . urlencode($season);
    $response = file_get_contents($baseUrl);
    if ($response === false) {
        return null;
    }
    $data = json_decode($response, true);
    return $data['events'] ?? [];
}

// Obteneer los etalles de un equipo por el ID
function fetch_team_details($teamId) {
    $apiKey = API_KEY;
    $baseUrl = 'https://www.thesportsdb.com/api/v1/json/' . $apiKey . '/lookupteam.php?id=' . urlencode($teamId);
    $response = file_get_contents($baseUrl);
    if ($response === false) {
        return null;
    }
    $data = json_decode($response, true);
    return $data['teams'][0] ?? null;
}

// Obtener jugadores de un equipo de la liga
function fetch_team_players($teamId) {
    $apiKey = API_KEY;
    $baseUrl = 'https://www.thesportsdb.com/api/v1/json/' . $apiKey . '/lookup_all_players.php?id=' . urlencode($teamId);
    $response = file_get_contents($baseUrl);
    if ($response === false) {
        return null;
    }
    $data = json_decode($response, true);
    return $data['player'] ?? [];
}

// Obtener los eventos de un equipo de la liga, partidos jugados, proximos partidos, etc...
function fetch_team_events($teamId) {
    $apiKey = API_KEY;
    $baseUrl = 'https://www.thesportsdb.com/api/v1/json/' . $apiKey . '/eventslast.php?id=' . urlencode($teamId);
    $response = file_get_contents($baseUrl);
    if ($response === false) {
        return null;
    }
    $data = json_decode($response, true);
    $lastEvents = $data['results'] ?? [];

    $baseUrlNext = 'https://www.thesportsdb.com/api/v1/json/' . $apiKey . '/eventsnext.php?id=' . urlencode($teamId);
    $responseNext = file_get_contents($baseUrlNext);
    $dataNext = json_decode($responseNext, true);
    $nextEvents = $dataNext['events'] ?? [];

    return [
        'last' => $lastEvents,
        'next' => $nextEvents
    ];
}
