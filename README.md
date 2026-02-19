# ⚽ LaLiga Stats - Estadísticas de La Liga

## 👤 Integrantes

- **Marc Adell Fernandez**

---

## 📌 Tema

**API JSON PHP LaLiga EA Sports** - Aplicación de estadísticas de La Liga EA Sports aplicando datos JSON con PHP y MySQL

---

## 📝 Descripción

Una aplicación web moderna para explorar estadísticas en tiempo real de La Liga española de futbol profesional. Desarrollada con **PHP**, **MySQL** y **JavaScript** para aprender patrones de integración con **APIs JSON**.

---

## 📄 Páginas Principales

| Página       | URL             | Descripción                                                  |
| ------------ | --------------- | ------------------------------------------------------------ |
| **Inicio**   | `/index.php`    | Presentación del proyecto con descripción de funcionalidades |
| **Equipos**  | `/equipos.php`  | Listado de equipos con buscador y filtros                    |
| **Tabla**    | `/tabla.php`    | Clasificación con columnas ordenables                        |
| **Partidos** | `/partidos.php` | Calendario de partidos con filtros por fecha                 |
| **Contacto** | `/contacto.php` | Formulario de contacto con validación                        |

---

## 📊 Datos JSON

**Archivo**: `api/laliga_2025_2026_api_v3.json`

Contiene toda la información de La Liga EA Sports:
- 📋 **Equipos**: Nombre, escudo, fundación, ciudad
- 🏆 **Clasificación**: Posición, puntos, victorias, empates, derrotas, goles
- ⚽ **Eventos/Partidos**: Fecha, hora, equipos, resultado, estado del partido

Los datos se sinconizan automáticamente a MySQL con opcion de TTLs configurables por tipo de dato.

---

## 🌿 Ramas Git

| Rama      | Descripción                                             |
| --------- | ------------------------------------------------------- |
| **main**  | Rama principal con versión estable (v1.0 y v2.0)        |
| **back**  | Desarrollo backend: controladores, APIs, sincronización |
| **style** | Desarrollo frontend: CSS, responsive, estilos visuales  |

---

## 🔀 Conflictos Resueltos

En el desarrollo paso que cuando quise hacer un merge de la rama `style` con `main` habia un conflicto con un componente ya que habia hecho cambios simultaneos en las media queries del componente `style.css`. Lo resolvi manteniendo ambas versiones y mejorando las medias queries para evitar código duplicado.

---

## 🏷️ Tags (Versiones)

- **v1.0** - Primera versión estable del prototipo con las funcionalidades aplicadas (equipos, tabla, partidos)
- **v2.0** - Segunda versión con el front diseñado y acabado

---

## 🎯 Funcionalidades Principales

- 📊 **Tabla de Clasificación**: Visualiza la posición actual de todos los equipos con estadísticas detalladas
- ⚽ **Equipos**: Explora información de cada equipo con escudos, fundación y detalles
- 📅 **Partidos**: Consulta los próximos partidos y resultados de encuentros completados
- 💬 **Contacto**: Formulario para comunicaciones directas con validación en cliente y servidor
- 🔄 **Sincronización Automática**: Caché inteligente en MySQL con TTL configurable
- 📱 **Responsive Design**: Interfaz adaptable para móvil, tablet y desktop

---

## 🏗️ Estructura del Proyecto

```
laliga/
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
│       └── imgs/                         # Imágenes y escudos

```

---

## 🚀 Rutas Principales (URLs)

| Ruta                      | Descripción                      |
| ------------------------- | -------------------------------- |
| `/index.php`              | Página de inicio                 |
| `/equipos.php`            | Listado de todos los equipos     |
| `/tabla.php`              | Tabla de clasificación completa  |
| `/partidos.php`           | Partidos próximos y resultados   |
| `/contacto.php`           | Formulario de contacto           |
| `/data/equipos.php`       | API JSON: datos de equipos       |
| `/data/clasificacion.php` | API JSON: tabla de clasificación |
| `/data/eventos.php`       | API JSON: partidos y eventos     |
| `/data/metadata.php`      | API JSON: metadatos generales    |

---

## 🔧 Tecnologías Utilizadas

- **Backend**: PHP 7.4+ (sin frameworks)
- **Base de Datos**: MySQL
- **Frontend**: JavaScript / HTML (sin librerias externas)
- **CSS**: Responsive Desktop-First
- **Servidor**: XAMPP (Apache)

---

## 💡 Patrones Implementados

✅ **Caché Inteligente**: Sistema de sincronización con tabla `sync_status` y TTL configurable
✅ **API Wrapper**: Funciones `fetch_*` con mapeo dual de campos (español/ingles)
✅ **Validación Dual**: Cliente (JS) y servidor (PHP)
✅ **Arquitectura en Capas**: Separacion entre controladores, modelos y vistas
✅ **Sin Dependencias Externas**: PHP y JavaScript sin frameworks

---

## 📚 Propósito Educativo

Este proyecto fue creado como un proyecto de Git para:
- Tener conocimientos basicos de HTML, CSS, Javascript, Git y Github.
- Leer datos en JSON.
- Trabajar con repositorios locales y remotos con Git y Github.

---

## ✨ Autor

Marc Adell Fernández. Proyecto Git realizado en CFGS ASIR - Febrero 2026
