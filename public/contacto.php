<?php
require_once __DIR__ . '/../config/config.php';
require_once __DIR__ . '/../database/db.php';
require_once __DIR__ . '/../includes/header.php';

$mensaje_exito = '';
$errores = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = isset($_POST['nombre']) ? trim($_POST['nombre']) : '';
    $email = isset($_POST['email']) ? trim($_POST['email']) : '';
    $asunto = isset($_POST['asunto']) ? trim($_POST['asunto']) : '';
    $mensaje = isset($_POST['mensaje']) ? trim($_POST['mensaje']) : '';

    if (empty($nombre)) {
        $errores[] = 'El nombre es requerido.';
    }
    if (empty($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errores[] = 'El email es invalido.';
    }
    if (empty($asunto)) {
        $errores[] = 'El asunto es obligatorio.';
    }
    if (empty($mensaje)) {
        $errores[] = 'El mensaje es obligatorio.';
    }
    if (strlen($mensaje) < 10) {
        $errores[] = 'El mensaje debe tener al menos 10 caracteres.';
    }

    if (empty($errores)) {
        $stmt = $conn->prepare('INSERT INTO contactos (nombre, email, asunto, mensaje, created_at) VALUES (?, ?, ?, ?, NOW())');

        if ($stmt) {
            $stmt->bind_param('ssss', $nombre, $email, $asunto, $mensaje);

            if ($stmt->execute()) {
                $mensaje_exito = '¡Gracias por tu mensaje! Nos pondremos en contacto pronto.';
                header('Refresh: 5; url=contacto.php');

                $nombre = '';
                $email = '';
                $asunto = '';
                $mensaje = '';
            } else {
                $errores[] = 'Error al guardar el mensaje. Intenta de nuevo.';
            }
            $stmt->close();
        } else {
            $errores[] = 'Error en la conexión a la base de datos.';
        }
    }
}
?>
<main class="container-2">
    <h1>¡Contactanos si tienes alguna duda!</h1>

    <div class="contacto-contenedor">
        <div class="contacto-form-wrapper">
            <?php if ($mensaje_exito): ?>
                <div class="mensaje-exito" id="mensaje-exito">
                    <?= htmlspecialchars($mensaje_exito) ?>
                    <br>
                    <small>Redirigiendo en <span id="contador">5</span> segundos...</small>
                </div>
                <script>
                    let segundos = 5;
                    const contador = document.getElementById('contador');
                    const intervalo = setInterval(() => {
                        segundos--;
                        contador.textContent = segundos;

                        if (segundos === 0) {
                            clearInterval(intervalo);
                        }
                    }, 1000);
                </script>
            <?php endif; ?>

            <?php if (!empty($errores)): ?>
                <div class="lista-errores">
                    <strong>Por favor corrige los siguientes errores:</strong>
                    <ul>
                        <?php foreach ($errores as $error): ?>
                            <li><?= htmlspecialchars($error) ?></li>
                        <?php endforeach; ?>
                    </ul>
                </div>
            <?php endif; ?>

            <form method="POST" action="contacto.php" class="formulario-contacto" id="formulario-contacto">
                <div class="form-group">
                    <label for="nombre">Nombre *</label>
                    <input
                        type="text"
                        id="nombre"
                        name="nombre"
                        placeholder="Tu nombre"
                        required
                        value="<?= isset($nombre) ? htmlspecialchars($nombre) : '' ?>"
                    >
                </div>

                <div class="form-group">
                    <label for="email">Email *</label>
                    <input
                        type="email"
                        id="email"
                        name="email"
                        placeholder="example@example.com"
                        required
                        value="<?= isset($email) ? htmlspecialchars($email) : '' ?>"
                    >
                </div>

                <div class="form-group">
                    <label for="asunto">Asunto *</label>
                    <input
                        type="text"
                        id="asunto"
                        name="asunto"
                        placeholder="Asunto del mensaje"
                        required
                        value="<?= isset($asunto) ? htmlspecialchars($asunto) : '' ?>"
                    >
                </div>

                <div class="form-group">
                    <label for="mensaje">Mensaje *</label>
                    <textarea
                        id="mensaje"
                        name="mensaje"
                        placeholder="Escribe tu mensaje aquí..."
                        rows="6"
                        required
                    ><?= isset($mensaje) ? htmlspecialchars($mensaje) : '' ?></textarea>
                </div>

                <button type="submit" class="btn-enviar">Enviar Mensaje</button>
            </form>

            <p class="campos-requeridos">* Campo requerido</p>
        </div>
    </div>
</main>

<script src="<?= ROOT_PATH ?>assets/js/contacto.js"></script>

<?php
require_once __DIR__ . '/../includes/footer.php';
?>
