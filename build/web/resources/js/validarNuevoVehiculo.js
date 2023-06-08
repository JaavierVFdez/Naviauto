
/********************************
 * 
 * Validar formulario nueva reparacion
 * 
 */

window.onload = nuevoVehiculo;

function nuevoVehiculo() {
    document.getElementById("nuevoVehiculo").addEventListener('click', validarMatricula, false);
    document.getElementById("nuevoVehiculo").addEventListener('click', validarDNI, false);
    document.getElementById("nuevoVehiculo").addEventListener('click', validarMarca, false);
    document.getElementById("nuevoVehiculo").addEventListener('click', validarModelo, false);
    document.getElementById("nuevoVehiculo").addEventListener('click', validarkilometrajeActual, false);
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

function validarDNI(e) {
    var pDNI = /^\d{8}[a-zA-Z]$/;
    var dni = document.getElementById('dni').value;
    var campo = document.getElementById('dni');

    var errorDNI = document.getElementById('errorDNI');

    if (dni != null || dni.trim() != "") {
        if (!pDNI.test(dni)) {
            campo.style.border = "3px solid red";
            errorDNI.innerHTML = "  'DNI inválido.'";
            e.preventDefault();
            return false;
        } else {
            campo.style.border = 'none';
            errorDNI.innerHTML = "";
        }
    } else {
        campo.style.border = "3px solid red";
        errorDNI.innerHTML = "  'El campo 'DNI' no puede estar vacío.'";
    }
}

function validarModelo(e) {
    var pModelo = /^[A-Za-z\s]+$/;
    var modelo = document.getElementById('modelo').value;
    var campo = document.getElementById('modelo');

    var errorModelo = document.getElementById('errorModelo');

    if (modelo != null || modelo.trim() != "") {
        if (!pModelo.test(modelo)) {
            campo.style.border = "3px solid red";
            errorModelo.innerHTML = "  'Modelo inválido.'";
            e.preventDefault();
            return false;
        } else {
            campo.style.border = 'none';
            errorModelo.innerHTML = "";
        }
    } else {
        campo.style.border = "3px solid red";
        errorModelo.innerHTML = "  'El campo 'Modelo' no puede estar vacío.'";
    }
}

function validarMarca(e) {
    var pMarca = /^[A-Za-z\s]+$/;
    var marca = document.getElementById('marca').value;
    var campo = document.getElementById('marca');

    var errorMarca = document.getElementById('errorMarca');

    if (marca != null || marca.trim() != "") {
        if (!pMarca.test(marca)) {
            campo.style.border = "3px solid red";
            errorMarca.innerHTML = "  'Marca inválido.'";
            e.preventDefault();
            return false;
        } else {
            campo.style.border = 'none';
            errorMarca.innerHTML = "";
        }
    } else {
        campo.style.border = "3px solid red";
        errorMarca.innerHTML = "  'El campo 'Marca' no puede estar vacío.'";
    }
}

function validarkilometrajeActual(e) {
    var pkilometrajeActual = /^\d+(\.\d{1,2})?$/;
    var kilometrajeActual = document.getElementById('kilometrajeActual').value;
    var campo = document.getElementById('kilometrajeActual');

    var errorKilometrajeActual = document.getElementById('errorKilometrajeActual');

    if (kilometrajeActual != null || kilometrajeActual.trim() != "") {
        if (!pkilometrajeActual.test(kilometrajeActual)) {
            campo.style.border = "3px solid red";
            errorKilometrajeActual.innerHTML = "  'Kilometraje Actual inválido.'";
            e.preventDefault();
            return false;
        } else {
            campo.style.border = '1px solid black';
            errorKilometrajeActual.innerHTML = "";
        }
    } else {
        campo.style.border = "1px solid black";
        errorKilometrajeActual.innerHTML = "  'El campo 'Kilometraje Actual' no puede estar vacío.'";
    }
}

var kilometrajeActual = document.getElementById('kilometrajeActual');

kilometrajeActual.onkeypress = function (event) {
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

kilometrajeActual.oninput = function () {
    // Si hay más de dos dígitos después del punto decimal, los elimina.
    if (this.value.indexOf('.') != -1 && this.value.split('.')[1].length > 2) {
        this.value = this.value.slice(0, -1);
    }
};