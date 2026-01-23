<?php
echo "<script>console.log('Obteniendo metadatos de API JSON...')</script>";
$metadata = get_api_metadata();
if ($metadata) {
    echo "<script>console.log('[OK] Competición: " . $metadata['competition_name'] . " (ID: " . $metadata['competition_id'] . ")')</script>";
	echo "<script>console.log('[OK] Season: " . $metadata['season_name'] . " (ID: " . $metadata['season_id'] . ")')</script>";
	echo "<script>console.log('[OK] Total equipos en JSON: " . $metadata['total_teams'] . "')</script>";
	echo "<script>console.log('[OK] Total partidos en JSON: " . $metadata['total_matches'] . "')</script>";
} else {
    echo "<script>console.log('[ERROR] No se pudo obtener metadatos')</script>";
}

echo "<script>console.log('Obteniendo tabla de posiciones desde API...')</script>";
$tabla_api = fetch_league_table();
if ($tabla_api && is_array($tabla_api)) {
	echo "<script>console.log('[OK] Tabla de posiciones obtenida: " . count($tabla_api) . " equipos')</script>";
	if (!empty($tabla_api)) {
		$primer_equipo = reset($tabla_api);
		echo "<script>console.log('Ejemplo (1er lugar): " . ($primer_equipo['teamid'] ?? 'N/A') . "')</script>";
	}
} else {
	echo "[ERROR] fetch_league_table() retornó datos vacíos\n";
    echo "<script>console.log('[ERROR] fetch_league_table() retornó datos vacíos')</script>";
}

echo "<script>console.log('Verificando equipos en BBDD...')</script>";
$result = $conn->query('SELECT COUNT(*) as total FROM teams');
$row = $result->fetch_assoc();
echo "<script>console.log('Equipos en BBDD: " . $row['total'] . "')</script>";

if ($row['total'] > 0) {
	$clasificacion = sincronizar_y_obtener_clasificacion($conn);

	if (isset($clasificacion['error'])) {
        echo "<script>console.log('[ERROR] Error al sincronizar clasificación en BBDD... . " . htmlspecialchars($clasificacion['error']) . "')</script>";
	} elseif (empty($clasificacion)) {
        echo "<script>console.log('No hay datos de clasificación en la BBDD después de sincronizar')</script>";
	} else {
        echo "<script>console.log('Clasificación sincronizada : " . count($clasificacion) . " equipos')</script>";
		echo "<h2>Tabla de posiciones:</h2>\n";
		echo str_pad("Pos", 5) . str_pad("Team ID", 12) . str_pad("Pts", 5) .
			str_pad("PJ", 4) . str_pad("PG", 4) . str_pad("PE", 4) . str_pad("PP", 4) .
			str_pad("GF", 4) . str_pad("GC", 4) . str_pad("DG", 4) . "\n";
		echo str_repeat("-", 70) . "\n";

		foreach ($clasificacion as $row) {
			echo str_pad($row['position'] ?? 'N/A', 5) .
				str_pad($row['team_id'] ?? 'N/A', 12) .
				str_pad($row['pts'] ?? 0, 5) .
				str_pad($row['pj'] ?? 0, 4) .
				str_pad($row['pg'] ?? 0, 4) .
				str_pad($row['pe'] ?? 0, 4) .
				str_pad($row['pp'] ?? 0, 4) .
				str_pad($row['gf'] ?? 0, 4) .
				str_pad($row['gc'] ?? 0, 4) .
				str_pad($row['dg'] ?? 0, 4) . "\n";
		}
	}
} else {
    echo "<script>console.log('No hay equipos en BBDD. Ejecuta primero \'Test Sync Equipos\'')</script>";
}
?>