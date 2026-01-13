<?php
require_once __DIR__ . '/../config/config.php';

$conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME, DB_PORT);

if (!$conn) {
    die("Conexión fallida: " . mysqli_connect_error());
} else {
    ?><script>console.log("Conexión DB exitosa");</script><?php
}

