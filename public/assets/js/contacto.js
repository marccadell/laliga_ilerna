document.addEventListener('DOMContentLoaded', function () {
    const formulario = document.getElementById('formulario-contacto');

    if (formulario) {
        formulario.addEventListener('submit', function (e) {
            const nombre = document.getElementById('nombre').value.trim();
            const email = document.getElementById('email').value.trim();
            const asunto = document.getElementById('asunto').value.trim();
            const mensaje = document.getElementById('mensaje').value.trim();

            let errores = [];

            if (nombre === '') {
                errores.push('El nombre es requerido.');
            }

            if (email === '') {
                errores.push('El email es requerido.');
            } else if (!validarEmail(email)) {
                errores.push('El email no es valido.');
            }

            if (asunto === '') {
                errores.push('El asunto es requerido.');
            }

            if (mensaje === '') {
                errores.push('El mensaje es requerido.');
            } else if (mensaje.length < 10) {
                errores.push('El mensaje debe tener al menos 10 caracteres.');
            }

            if (errores.length > 0) {
                e.preventDefault();
                mostrarErrores(errores);
                window.scrollTo(0, 0);
            }
        });

        const campos = formulario.querySelectorAll('input, textarea');
        campos.forEach(campo => {
            campo.addEventListener('focus', function () {
                const listaErrores = document.querySelector('.lista-errores');
                if (listaErrores) {
                    listaErrores.remove();
                }
            });
        });
    }
});

// Función para validar el formato del email
function validarEmail(email) {
    const regexEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return regexEmail.test(email);
}

// Función para mostrar los errores
function mostrarErrores(errores) {
    const listaErroresExistente = document.querySelector('.lista-errores');
    if (listaErroresExistente) {
        listaErroresExistente.remove();
    }

    const divErrores = document.createElement('div');
    divErrores.className = 'lista-errores';

    let html = '<strong>Por favor corrige los siguientes errores:</strong><ul>';
    errores.forEach(error => {
        html += `<li>${error}</li>`;
    });
    html += '</ul>';

    divErrores.innerHTML = html;

    const formulario = document.getElementById('formulario-contacto');
    formulario.parentNode.insertBefore(divErrores, formulario);
}
