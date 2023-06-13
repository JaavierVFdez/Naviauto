
/********************************
 * 
 * Validar formulario nueva ategoria
 * 
 */

window.onload = nuevaReparacion;

function nuevaReparacion() {
    document.getElementById("nuevaCategoria").addEventListener('click', validarNombre, false);

}

function validarNombre(e) {
    var pNombre = /^[A-Za-z\s]+$/;
    var nombre = document.getElementById('nombre_categoria').value;
    var campo = document.getElementById('nombre_categoria');

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
