<?php
require_once __DIR__ . '/../config/config.php';
require_once __DIR__ . '/../database/db.php';
require_once __DIR__ . '/../api/api.php';
require_once __DIR__ . '/../controllers/sync_equipos.php';
require_once __DIR__ . '/../includes/header.php';

$equipos_sincronizados = sincronizar_y_obtener_equipos($conn);
?>

<main class="container">
    <h1>Equipos - LaLiga EA SPORTS <?php echo SEASON_ID; ?></h1>
    <div class="filters-section">
        <div class="search-box">
            <input type="text" id="buscador" placeholder="Buscar equipo por nombre o codigo...">
        </div>

        <div class="filter-group">
            <label for="filtro-ciudad">Filtrar por ciudad:</label>
            <select id="filtro-ciudad">
                <option value="">Todas las ciudades</option>
            </select>
        </div>
    </div>

    <div id="lista-equipos" class="equipos-grid">
        <?php if ($equipos_sincronizados && is_array($equipos_sincronizados)): ?>
            <?php foreach ($equipos_sincronizados as $equipo): ?>
                <div class="equipo-card">
                    <div class="equipo-header">
                        <img src="<?= htmlspecialchars($equipo['crest_url'] ?? 'https://via.placeholder.com/80') ?>"
                            alt="<?= htmlspecialchars($equipo['name']) ?>" class="escudo">
                        <h3><?= htmlspecialchars($equipo['name']) ?></h3>
                    </div>
                    <div class="equipo-info">
                        <p><strong>Codigo:</strong> <?= htmlspecialchars($equipo['code'] ?? 'N/A') ?></p>
                        <p><strong>Ciudad:</strong> <?= htmlspecialchars($equipo['city'] ?? 'N/A') ?></p>
                        <p><strong>Estadio:</strong> <?= htmlspecialchars($equipo['stadium'] ?? 'N/A') ?></p>
                        <p><strong>Capacidad:</strong>
                            <?= ($equipo['stadium_capacity'] ? number_format($equipo['stadium_capacity']) : 'N/A') ?></p>
                    </div>
                </div>
            <?php endforeach; ?>
        <?php else: ?>
            <div class="error">Error: No se ha podido cargar los equipos</div>
        <?php endif; ?>
    </div>

    <div id="sin-resultados" class="mensaje-vacio" style="display:none;">
        <p>No se han encontrado equipos con los filtros seleccionados.</p>
    </div>

<?php require_once __DIR__ . '/../includes/footer.php'; ?>

<script src="assets/js/equipos.js"></script>