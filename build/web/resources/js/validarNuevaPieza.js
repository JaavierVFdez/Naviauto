
/********************************
 * 
 * Validar formulario nueva Pieza
 * 
 */

window.onload = nuevaPieza;

function nuevaPieza() {
    document.getElementById("nuevaPieza").addEventListener('click', validarReparacion, false);
    document.getElementById("nuevaPieza").addEventListener('click', validarNombre, false);
    document.getElementById("nuevaPieza").addEventListener('click', validarFabricante, false);
    document.getElementById("nuevaPieza").addEventListener('click', validarPrecio, false);
}

function validarReparacion(e) {
    var pcodigoReparacion = /^\d+$/;
    var codigoReparacion = document.getElementById('codigoReparacion').value;
    var campo = document.getElementById('codigoReparacion');

    var errorReparacion = document.getElementById('errorReparacion');

    if (codigoReparacion != null || codigoReparacion.trim() != "") {
        if (!pcodigoReparacion.test(codigoReparacion)) {
            campo.style.border = "3px solid red";
            errorReparacion.innerHTML = "  'Código Reparación inválido.'";
            e.preventDefault();
            return false;
        } else {
            campo.style.border = 'none';
            errorReparacion.innerHTML = "";
        }
    } else {
        campo.style.border = "3px solid red";
        errorReparacion.innerHTML = "  'El campo 'Código Reparación' no puede estar vacío.'";
    }
}

function validarNombre(e) {
    var pNombre = /^[a-zA-Z\s]{1,25}$/;
    var nombre = document.getElementById('nombre').value;
    var campo = document.getElementById('nombre');

    var errorNombre = document.getElementById('errorNombre');

    if (nombre != null || nombre.trim() != "") {
        if (!pNombre.test(nombre)) {
            campo.style.border = "3px solid red";
            errorNombre.innerHTML = "  'Nombre inválido.'";
            e.preventDefault();
            return false;
        } else {
            campo.style.border = 'none';
            errorNombre.innerHTML = "";
        }
    } else {
        campo.style.border = "3px solid red";
        errorNombre.innerHTML = "  'El campo 'Nombre' no puede estar vacío.'";
    }
}

function validarFabricante(e) {
    var pFabricante = /^[a-zA-Z\s\-']{1,25}$/;
    var fabricante = document.getElementById('fabricante').value;
    var campo = document.getElementById('fabricante');

    var errorFabricante = document.getElementById('errorFabricante');

    if (fabricante != null || fabricante.trim() != "") {
        if (!pFabricante.test(fabricante)) {
            campo.style.border = "3px solid red";
            errorFabricante.innerHTML = "  'Fabricante inválido.'";
            e.preventDefault();
            return false;
        } else {
            campo.style.border = 'none';
            errorFabricante.innerHTML = "";
        }
    } else {
        campo.style.border = "3px solid red";
        errorFabricante.innerHTML = "  'El campo 'Fabricante' no puede estar vacío.'";
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
