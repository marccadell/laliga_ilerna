let clasificacionData = [];
let partidosData = [];

function cargarPartidos() {
    return fetch('http://localhost:8080/laliga/public/data/eventos.php')
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            console.log('Partidos cargados:', data.length, 'partidos');
            partidosData = data || [];
            return data;
        })
        .catch(error => {
            console.error('Error cargando partidos:', error);
            return [];
        });
}

function obtenerUltimos5Partidos(teamId) {
    if (!Array.isArray(partidosData)) return [];

    const partidos = partidosData
        .filter(partido => {
            const homeTeamId = parseInt(partido.home_team_id);
            const awayTeamId = parseInt(partido.away_team_id);
            return homeTeamId === teamId || awayTeamId === teamId;
        })
        .filter(partido => partido.ft_home !== null && partido.ft_away !== null)
        .sort((a, b) => new Date(b.utc_date) - new Date(a.utc_date))
        .slice(0, 5);

    return partidos.map(partido => {
        const homeTeamId = parseInt(partido.home_team_id);
        const golesLocal = parseInt(partido.ft_home || 0);
        const golesVisitante = parseInt(partido.ft_away || 0);

        let resultado;
        if (homeTeamId === teamId) {
            if (golesLocal > golesVisitante) resultado = 'win';
            else if (golesLocal < golesVisitante) resultado = 'loss';
            else resultado = 'draw';
        } else {
            if (golesVisitante > golesLocal) resultado = 'win';
            else if (golesVisitante < golesLocal) resultado = 'loss';
            else resultado = 'draw';
        }

        return {
            resultado: resultado,
            fecha: partido.utc_date
        };
    });
}

function mostrarUltimos5() {
    const celdas = document.querySelectorAll('.ultimos-5');
    celdas.forEach(celda => {
        const teamId = parseInt(celda.getAttribute('data-team-id'));
        const ultimos5 = obtenerUltimos5Partidos(teamId);

        celda.innerHTML = '';
        ultimos5.forEach(partido => {
            const img = document.createElement('img');
            img.style.width = '13px';
            img.style.height = '13px';
            img.style.marginRight = '4px';
            img.style.verticalAlign = 'middle';
            img.title = `${partido.fecha} - ${partido.resultado}`;

            if (partido.resultado === 'win') {
                img.src = '/laliga/public/assets/icons/check.png';
                img.alt = 'Victoria';
            } else if (partido.resultado === 'draw') {
                img.src = '/laliga/public/assets/icons/forbidden.png';
                img.alt = 'Empate';
            } else if (partido.resultado === 'loss') {
                img.src = '/laliga/public/assets/icons/cross.png';
                img.alt = 'Derrota';
            }

            celda.appendChild(img);
        });
    });
}

function cargarClasificacion() {
    const filas = document.querySelectorAll(".fila-equipo");
    clasificacionData = [];

    filas.forEach((fila) => {
        const nombre = fila.getAttribute("data-team-name");
        const posicion = fila.querySelector(".club").textContent.trim();
        const pj = fila.querySelectorAll("td")[2].textContent.trim();
        const pg = fila.querySelectorAll("td")[3].textContent.trim();
        const pe = fila.querySelectorAll("td")[4].textContent.trim();
        const pp = fila.querySelectorAll("td")[5].textContent.trim();
        const gf = fila.querySelectorAll("td")[6].textContent.trim();
        const gc = fila.querySelectorAll("td")[7].textContent.trim();
        const dg = fila.querySelectorAll("td")[8].textContent.trim();
        const pts = fila.querySelectorAll("td")[9].textContent.trim();

        clasificacionData.push({
            nombre: nombre,
            posicion: posicion,
            pj: pj,
            pg: pg,
            pe: pe,
            pp: pp,
            gf: gf,
            gc: gc,
            dg: dg,
            pts: pts,
        });
    });
}

function filtrarClasificacion() {
    const buscador = document.getElementById("buscador-tabla").value.toLowerCase();
    const filas = document.querySelectorAll(".fila-equipo");
    let visible = 0;

    filas.forEach((fila) => {
        const nombre = fila.getAttribute("data-team-name").toLowerCase();

        let mostrar = true;

        if (buscador && !nombre.includes(buscador)) {
            mostrar = false;
        }

        if (mostrar) {
            fila.style.display = "table-row";
            visible++;
        } else {
            fila.style.display = "none";
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
    cargarPartidos().then(() => {
        cargarClasificacion();
        mostrarUltimos5();
    });

    const buscadorInput = document.getElementById("buscador-tabla");
    if (buscadorInput) {
        buscadorInput.addEventListener("input", filtrarClasificacion);
    }
});
