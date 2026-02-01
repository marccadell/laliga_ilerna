<?php
require_once __DIR__ . '/../config/config.php';
require_once __DIR__ . '/../database/db.php';
require_once __DIR__ . '/../api/api.php';
require_once __DIR__ . '/../controllers/sync_eventos.php';
require_once __DIR__ . '/../includes/header.php';

$eventos = sincronizar_y_obtener_eventos($conn);
?>

<main class="container">
    <h1>Partidos - La Liga</h1>

    <div class="filtros">
        <div class="search-box">
            <input type="text" id="buscador-partido" placeholder="Buscar por equipo...">
        </div>
        <div class="filter-group">
            <label for="filtro-fecha">Filtrar por fecha:</label>
            <input type="date" id="filtro-fecha">
        </div>
    </div>

    <div class="eventos-container" id="eventos-container">
        <?php
        if ($eventos && is_array($eventos)):
            foreach ($eventos as $evento):
                $fecha = new DateTime($evento['local_date']);
                $fecha_formateada = $fecha->format('d/m/Y');
                $hora = $fecha->format('H:i');
                $status = $evento['status'] ?? 'scheduled';

                $tiene_resultado = ($evento['ft_home'] !== null && $evento['ft_away'] !== null);
                $clase_status = ($tiene_resultado) ? 'finalizado' : 'proximo';
                $resultado = '';

                $equipo_local = htmlspecialchars($evento['home_team_name'] ?? 'TBD');
                $equipo_visitante = htmlspecialchars($evento['away_team_name'] ?? 'TBD');

                if ($tiene_resultado) {
                    $goles_local = $evento['ft_home'] ?? '-';
                    $goles_visitante = $evento['ft_away'] ?? '-';
                    $resultado = htmlspecialchars($goles_local) . ' - ' . htmlspecialchars($goles_visitante);
                }
                ?>
                <div class="evento-card <?= $clase_status ?>" data-fecha="<?= $fecha->format('Y-m-d') ?>"
                    data-equipo-local="<?= strtolower($evento['home_team_name'] ?? '') ?>"
                    data-equipo-visitante="<?= strtolower($evento['away_team_name'] ?? '') ?>">
                    <div class="evento-fecha">
                        <span class="fecha"><?= htmlspecialchars($fecha_formateada) ?></span>
                        <span class="matchday">J<?= htmlspecialchars($evento['matchday'] ?? '0') ?></span>
                    </div>

                    <div class="evento-contenido">
                        <div class="equipo equipo-local">
                            <img src="<?= htmlspecialchars($evento['home_team_crest'] ?? 'https://via.placeholder.com/40') ?>" alt="Escudo" class="escudo-equipo">
                            <span class="nombre-equipo"><?= $equipo_local ?></span>
                        </div>

                        <div class="resultado">
                            <?php if ($tiene_resultado): ?>
                                <div class="marcador"><?= $resultado ?></div>
                                <span class="estado">Finalizado</span>
                            <?php else: ?>
                                <span class="hora-resultado"><?= htmlspecialchars($hora) ?></span>
                                <hr class="separador-evento"></hr>
                                <span class="estado">Próximo</span>
                            <?php endif; ?>
                        </div>

                        <div class="equipo equipo-visitante">
                            <img src="<?= htmlspecialchars($evento['away_team_crest'] ?? 'https://via.placeholder.com/40') ?>" alt="Escudo" class="escudo-equipo">
                            <span class="nombre-equipo"><?= $equipo_visitante ?></span>
                        </div>
                    </div>
                </div>
                <?php
            endforeach;
        else:
            echo '<div style="text-align:center; padding: 40px; color: #666;">Error: No se ha podido cargar los eventos</div>';
        endif;
        ?>
    </div>

    <p class="sin-resultados" style="display: none; text-align: center; margin: 40px 0;">No se han encontrado partidos con
        los filtros seleccionados.</p>
</main>

<script src="<?= ROOT_PATH ?>assets/js/partidos.js"></script>

<?php
require_once __DIR__ . '/../includes/footer.php';
?>