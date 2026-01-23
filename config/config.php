<?php
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'proyectogit');
define('DB_PORT', 3307);

define('ROOT_PATH', 'http://localhost:8080/laliga/public/');

// ============ Cargar configuración desde API JSON ============
require_once __DIR__ . '/../api/api.php';

// IDs dinámicos desde API JSON
define('COMPETITION_ID', get_competition_id());
define('COMPETITION_NAME', get_competition_name());
define('SEASON_ID', get_season_id());
define('SEASON_NAME', get_season_name());

// Aliases para compatibilidad (algunos controladores pueden usar LEAGUE_ID)
define('LEAGUE_ID', COMPETITION_ID);
define('SEASON', SEASON_NAME);

// TTLs (en segundos)
define('TTL_EQUIPOS', 86400);       // 24 horas
define('TTL_CLASIFICACION', 1800);  // 30 minutos
define('TTL_EVENTOS', 21600);       // 6 horas
