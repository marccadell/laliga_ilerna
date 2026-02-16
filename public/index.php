<?php
require_once __DIR__ . '/../config/config.php';
require_once __DIR__ . '/../database/db.php';
require_once __DIR__ . '/../api/api.php';
//require_once __DIR__ . '/../controllers/sync_equipos.php';
//require_once __DIR__ . '/../controllers/sync_eventos.php';
//require_once __DIR__ . '/../controllers/sync_clasificacion.php';
require_once __DIR__ . '/../includes/header.php';
?>
<main class="container-index">
<h1>Bienvenido a LaLiga Stats</h1>

<p>Explora las estadísticas más recientes de La Liga, incluyendo la tabla de clasificación, los próximos partidos y los detalles de cada equipo. Mantente al día con el rendimiento de tus equipos favoritos y no te pierdas ningún partido importante.</p>

<?php
require_once __DIR__ . '/../includes/footer.php';
?>