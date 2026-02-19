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
<br>
<p>Este proyecto ha sido desarrollado con el objetivo de aprender a trabajar con APIs JSON y mejorar mis habilidades en PHP. A través de LaLiga Stats, he implementado patrones de sincronización de datos, gestión de caché en MySQL, y consumo eficiente de datos desde fuentes externas. Cada sección de la aplicación refleja un aprendizaje clave en el desarrollo backend, desde la integración de APIs hasta la optimización del rendimiento con estrategias de caché inteligentes.</p>
<br>
<p><strong>Estructura del Proyecto:</strong> LaLiga Stats utiliza una arquitectura en capas con separación clara de responsabilidades. Los datos provienen de una API JSON local que se sincroniza con una base de datos MySQL mediante controladores especializados. El frontend consume estos datos desde endpoints públicos que garantizan caché eficiente y evitan llamadas directas a la API. La aplicación incluye páginas para visualizar equipos, tabla de clasificación, partidos próximos y un formulario de contacto, todo construido con PHP vanilla y JavaScript sin dependencias externas.</p>

<div class="estructura-proyecto">
<pre>laliga/
├── 📄 README.md                          # Este archivo
├── 📄 config/
│   └── config.php                        # Configuración global (DB, constantes, TTLs)
├── 📄 database/
│   ├── db.php                            # Conexión MySQLi
│   └── script.sql                        # Esquema de la base de datos
├── 📄 api/
│   ├── api.php                           # Wrapper de funciones fetch_*
│   └── laliga_2025_2026_api_v3.json      # Datos JSON locales (fuente de datos)
├── 📄 controllers/
│   ├── sync_equipos.php                  # Sincronización de equipos
│   ├── sync_clasificacion.php            # Sincronización de clasificación
│   └── sync_eventos.php                  # Sincronización de partidos
├── 📄 includes/
│   ├── header.php                        # Encabezado HTML
│   ├── nav.php                           # Barra de navegación
│   └── footer.php                        # Pie de página
├── 📄 public/
│   ├── index.php                         # Página de inicio
│   ├── equipos.php                       # Página de equipos
│   ├── tabla.php                         # Tabla de clasificación
│   ├── partidos.php                      # Partidos y eventos
│   ├── contacto.php                      # Formulario de contacto
│   ├── data/
│   │   ├── equipos.php                   # Endpoint JSON: datos de equipos
│   │   ├── clasificacion.php             # Endpoint JSON: tabla de clasificación
│   │   ├── eventos.php                   # Endpoint JSON: partidos
│   │   └── metadata.php                  # Endpoint JSON: metadatos
│   └── assets/
│       ├── css/
│       │   └── style.css                 # Estilos responsive
│       ├── js/
│       │   ├── equipos.js                # Lógica de página equipos
│       │   ├── tabla.js                  # Lógica de tabla clasificación
│       │   ├── partidos.js               # Lógica de partidos
│       │   └── contacto.js               # Validación formulario contacto
│       └── imgs/                         # Imágenes y escudos</pre>
</div>
<?php
require_once __DIR__ . '/../includes/footer.php';
?>