
/********************************
 * 
 * Validar formulario nueva reparacion
 * 
 */

window.onload = nuevaReparacion;

function nuevaReparacion() {
    document.getElementById("nuevoProducto").addEventListener('click', validarNombre, false);
    document.getElementById("nuevoProducto").addEventListener('click', validarStock, false);
    document.getElementById("nuevoProducto").addEventListener('click', validarPrecio, false);

}

function validarNombre(e) {
    var pNombre = /^[A-Za-z\s]+$/;
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

function validarStock(e) {
    var pStock = /^\d+$/;
    var stock = document.getElementById('stock').value;
    var campo = document.getElementById('stock');

    var errorStock = document.getElementById('errorStock');

    if (stock != null || stock.trim() != "") {
        if (!pStock.test(stock)) {
            campo.style.border = "3px solid red";
            errorStock.innerHTML = "  'Stock inválido.'";
            e.preventDefault();
            return false;
        } else {
            campo.style.border = '1px solid black';
            errorStock.innerHTML = "";
        }
    } else {
        campo.style.border = "1px solid black";
        errorStock.innerHTML = "  'El campo 'Stock' no puede estar vacío.'";
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

var stock = document.getElementById('stock');

stock.onkeypress = function (event) {
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

var precio = document.getElementById('precio');

precio.onkeypress = function (event) {
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

precio.oninput = function () {
    // Si hay más de dos dígitos después del punto decimal, los elimina.
    if (this.value.indexOf('.') != -1 && this.value.split('.')[1].length > 2) {
        this.value = this.value.slice(0, -1);
    }
};
