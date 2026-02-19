<?php
require_once __DIR__ . '/../config/config.php';
require_once __DIR__ . '/../database/db.php';
require_once __DIR__ . '/../api/api.php';
require_once __DIR__ . '/../controllers/sync_clasificacion.php';
require_once __DIR__ . '/../includes/header.php';

$clasificacion = sincronizar_y_obtener_clasificacion($conn);
?>

<main class="container">
    <h1>Tabla de Clasificación - LaLiga EA SPORTS <?php echo SEASON_ID; ?></h1>

    <div class="filtros">
        <input type="text" id="buscador-tabla" placeholder="Buscar equipo...">
    </div>

    <table class="tabla-clasificacion" id="tabla-clasificacion">
        <thead>
            <tr>
                <th>Club</th>
                <th></th>
                <th>PJ</th>
                <th>V</th>
                <th>E</th>
                <th>D</th>
                <th>GF</th>
                <th>GC</th>
                <th>DG</th>
                <th>Pts</th>
                <th>Últimos 5</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if ($clasificacion && is_array($clasificacion)):
                foreach ($clasificacion as $row):
                    $result = $conn->query('SELECT name, crest_url FROM teams WHERE id = ' . intval($row['team_id']));
                    $team = $result ? $result->fetch_assoc() : null;
            ?>
                <tr class="fila-equipo" data-team-name="<?= htmlspecialchars($team['name'] ?? 'N/A') ?>" data-team-id="<?= htmlspecialchars($row['team_id'] ?? '') ?>">
                    <td class="club"><?= htmlspecialchars($row['position'] ?? 'N/A') ?></td>
                    <td class="equipo">
                        <div class="equipo-cell">
                            <img src="<?= htmlspecialchars($team['crest_url'] ?? 'https://via.placeholder.com/40') ?>" alt="Escudo" class="escudo-mini">
                            <span><?= htmlspecialchars($team['name'] ?? 'N/A') ?></span>
                        </div>
                    </td>
                    <td><?= htmlspecialchars($row['pj'] ?? 0) ?></td>
                    <td><?= htmlspecialchars($row['pg'] ?? 0) ?></td>
                    <td><?= htmlspecialchars($row['pe'] ?? 0) ?></td>
                    <td><?= htmlspecialchars($row['pp'] ?? 0) ?></td>
                    <td><?= htmlspecialchars($row['gf'] ?? 0) ?></td>
                    <td><?= htmlspecialchars($row['gc'] ?? 0) ?></td>
                    <td><?= htmlspecialchars($row['dg'] ?? 0) ?></td>
                    <td class="pts"><strong><?= htmlspecialchars($row['pts'] ?? 0) ?></strong></td>
                    <td class="ultimos-5" data-team-id="<?= htmlspecialchars($row['team_id'] ?? '') ?>"></td>
                </tr>
            <?php
                endforeach;
            else:
                echo '<tr><td colspan="11" style="text-align:center;">Error: No se pudieron cargar los datos de clasificación</td></tr>';
            endif;
            ?>
        </tbody>
    </table>

    <p class="sin-resultados" style="display: none; text-align: center; margin: 40px 0;">No se encontraron equipos con el filtro especificado.</p>
</main>

<script src="<?= ROOT_PATH ?>assets/js/tabla.js"></script>

<?php
require_once __DIR__ . '/../includes/footer.php';
?>