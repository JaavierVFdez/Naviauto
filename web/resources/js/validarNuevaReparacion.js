
/********************************
 * 
 * Validar formulario nueva reparacion
 * 
 */

window.onload = nuevaReparacion;

function nuevaReparacion() {
    document.getElementById("nuevaReparacion").addEventListener('click', validarMatricula, false);
    document.getElementById("nuevaReparacion").addEventListener('click', validarPrecio, false);
}

function validarMatricula(e) {
    var pMatricula = /^[0-9]{4}[BCDFGHJKLMNPQRSTVWXYZ]{3}$/;
    var matricula = document.getElementById('matricula').value;
    var campo = document.getElementById('matricula');

    var errorMatricula = document.getElementById('errorMatricula');

    if (matricula != null || matricula.trim() != "") {
        if (!pMatricula.test(matricula)) {
            campo.style.border = "3px solid red";
            errorMatricula.innerHTML = "  'Matrícula inválida.'";
            e.preventDefault();
            return false;
        } else {
            campo.style.border = 'none';
            errorMatricula.innerHTML = "";
        }
    } else {
        campo.style.border = "3px solid red";
        errorMatricula.innerHTML = "  'El campo 'Matrícula' no puede estar vacío.'";
    }
}

function validarPrecio(e) {
    var pPrecio = /^\d+(\.\d{1,2})?$/;
    var precio = document.getElementById('precio').value;
    var campo = document.getElementById('precio');

    var errorPrecio = document.getElementById('errorPrecio');

    if (precio != null || precio.trim() != "") {
        if (!pPrecio.test(precio)) {
            campo.style.border = "3px solid red";
            errorPrecio.innerHTML = "  'Precio inválido.'";
            e.preventDefault();
            return false;
        } else {
            campo.style.border = '1px solid black';
            errorPrecio.innerHTML = "";
        }
    } else {
        campo.style.border = "1px solid black";
        errorPrecio.innerHTML = "  'El campo 'Precio' no puede estar vacío.'";
    }
}

var precio = document.getElementById('precio');

precio.onkeypress = function(event) {
    var charCode = (event.which) ? event.which : event.keyCode;
    
    // Si el carácter no es un número o un punto, previene el ingreso.
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) {
        event.preventDefault();
    }

    // Si el carácter es un punto, verifica que no haya otro punto en la cadena.
    if (charCode == 46 && this.value.indexOf('.') != -1) {
        event.preventDefault();
    }
};

precio.oninput = function() {
    // Si hay más de dos dígitos después del punto decimal, los elimina.
    if (this.value.indexOf('.') != -1 && this.value.split('.')[1].length > 2) {
        this.value = this.value.slice(0, -1);
    }
};
