let equiposData = [];

function cargarEquipos() {
    const cards = document.querySelectorAll(".equipo-card");
    equiposData = [];

    cards.forEach((card) => {
        const nombre = card.querySelector("h3").textContent;
        const ciudad = card
            .querySelector(".equipo-info p:nth-child(2)")
            .textContent.replace("Ciudad: ", "");
        const codigo = card
            .querySelector(".equipo-info p:nth-child(1)")
            .textContent.replace("Código: ", "");
        const estadio = card
            .querySelector(".equipo-info p:nth-child(3)")
            .textContent.replace("Estadio: ", "");
        const capacidad = card
            .querySelector(".equipo-info p:nth-child(4)")
            .textContent.replace("Capacidad: ", "");
        const crest = card.querySelector("img").src;

        equiposData.push({
            name: nombre,
            city: ciudad,
            code: codigo,
            stadium: estadio,
            stadium_capacity: capacidad,
            crest_url: crest,
        });
    });

    poblarFiltros();
}

function poblarFiltros() {
    const ciudades = [];

    for (let equipo of equiposData) {
        const ciudad = equipo.city || "Sin ciudad";
        if (!ciudades.includes(ciudad)) {
            ciudades.push(ciudad);
        }
    }

    ciudades.sort();

    const selectCiudad = document.getElementById("filtro-ciudad");
    for (let ciudad of ciudades) {
        const option = document.createElement("option");
        option.value = ciudad;
        option.textContent = ciudad;
        selectCiudad.appendChild(option);
    }
}

function filtrarEquipos() {
    const buscador = document.getElementById("buscador").value.toLowerCase();
    const ciudadSeleccionada = document.getElementById("filtro-ciudad").value;

    const cards = document.querySelectorAll(".equipo-card");
    let visible = 0;

    cards.forEach((card) => {
        const nombre = card.querySelector("h3").textContent.toLowerCase();
        const codigo = card
            .querySelector(".equipo-info p:nth-child(1)")
            .textContent.replace("Código: ", "")
            .toLowerCase();
        const ciudad = card
            .querySelector(".equipo-info p:nth-child(2)")
            .textContent.replace("Ciudad: ", "")
            .toLowerCase();

        let mostrar = true;

        if (buscador && !nombre.includes(buscador) && !codigo.includes(buscador)) {
            mostrar = false;
        }

        if (ciudadSeleccionada && ciudad !== ciudadSeleccionada.toLowerCase()) {
            mostrar = false;
        }

        if (mostrar) {
            card.style.display = "block";
            visible++;
        } else {
            card.style.display = "none";
        }
    });

    const sinResultados = document.getElementById("sin-resultados");
    if (visible === 0) {
        sinResultados.style.display = "block";
    } else {
        sinResultados.style.display = "none";
    }
}

document.addEventListener("DOMContentLoaded", function () {
    cargarEquipos();

    document.getElementById("buscador").addEventListener("input", filtrarEquipos);
    document
        .getElementById("filtro-ciudad")
        .addEventListener("change", filtrarEquipos);
});
