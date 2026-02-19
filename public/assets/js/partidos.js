let eventosData = [];
let offset = 0;
const limit = 10;
let loading = false;

function cargarEventos() {
    const cards = document.querySelectorAll(".evento-card");
    eventosData = [];

    cards.forEach((card) => {
        const equipoLocal = card.getAttribute("data-equipo-local");
        const equipoVisitante = card.getAttribute("data-equipo-visitante");
        const fecha = card.getAttribute("data-fecha");

        eventosData.push({
            equipoLocal: equipoLocal,
            equipoVisitante: equipoVisitante,
            fecha: fecha,
        });
    });
}


function filtrarEventos() {
    const buscador = document.getElementById("buscador-partido").value.toLowerCase();
    const fechaSeleccionada = document.getElementById("filtro-fecha").value;

    const cards = document.querySelectorAll(".evento-card");
    let visible = 0;

    cards.forEach((card) => {
        const equipoLocal = card
            .getAttribute("data-equipo-local")
            .toLowerCase();
        const equipoVisitante = card
            .getAttribute("data-equipo-visitante")
            .toLowerCase();
        const fecha = card.getAttribute("data-fecha");

        let mostrar = true;

        if (
            buscador &&
            !equipoLocal.includes(buscador) &&
            !equipoVisitante.includes(buscador)
        ) {
            mostrar = false;
        }

        if (fechaSeleccionada && fecha !== fechaSeleccionada) {
            mostrar = false;
        }

        if (mostrar) {
            card.style.display = "block";
            visible++;
        } else {
            card.style.display = "none";
        }
    });

    const sinResultados = document.querySelector(".sin-resultados");
    if (visible === 0) {
        sinResultados.style.display = "block";
    } else {
        sinResultados.style.display = "none";
    }
}

document.addEventListener("DOMContentLoaded", function () {
    cargarEventos();

    const buscadorInput = document.getElementById("buscador-partido");
    const filtroFecha = document.getElementById("filtro-fecha");

    if (buscadorInput) {
        buscadorInput.addEventListener("input", filtrarEventos);
    }

    if (filtroFecha) {
        filtroFecha.addEventListener("change", filtrarEventos);
    }

});

