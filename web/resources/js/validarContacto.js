
/********************************
 * 
 * Validar formulario contacto
 * 
 */

window.onload = validarContacto;

function validarContacto() {
    document.getElementById("enviarFormularioContacto").addEventListener('click', validarNombre, false);
    document.getElementById("enviarFormularioContacto").addEventListener('click', validarApellido, false);
    document.getElementById("enviarFormularioContacto").addEventListener('click', validarCorreo, false);
    document.getElementById("enviarFormularioContacto").addEventListener('click', validarAsunto, false);
    document.getElementById("enviarFormularioContacto").addEventListener('click', validarMensaje, false);
}

function validarNombre(e) {
    var pNombre = /^[a-zA-Z]+[a-zA-Z]+$ /;
    var nombre = document.getElementById('nombreContacto').value;
    var campo = document.getElementById('nombreContacto');

    var errorNombre = document.getElementById('errorNombre');

    if (!nombre.trim() == "") {
        if (!pNombre.test(nombre)) {
            campo.style.border = "3px solid red";
            errorNombre.innerHTML = "  'Nombre inválido.'";
            e.preventDefault();
            return false;
        } else {
            campo.style.border = 'none';
        }
    } else {
        campo.style.border = "3px solid red";
        errorNombre.innerHTML = "  'El campo 'Nombre' no puede estar vacío.'";
    }
}

function validarApellido(e) {
    var pApellido = /^[a-zA-Z]+[a-zA-Z]+$/;
    var apellido = document.getElementById('apellidoContacto').value;
    var campo = document.getElementById('apellidoContacto');

    var errorNombre = document.getElementById('errorApellido');

    if (!apellido.trim() == "") {
        if (!pApellido.test(apellido)) {
            campo.style.border = "3px solid red";
            errorNombre.innerHTML = "  'Nombre inválido.'";
            e.preventDefault();
            return false;
        } else {
            campo.style.border = 'none';
        }
    } else {
        campo.style.border = "3px solid red";
        errorNombre.innerHTML = "  'El campo 'Nombre' no puede estar vacío.'";
    }
}

function validarAsunto(e) {
    var pAsunto = /^[A-Za-z\s]+$/;
    var asunto = document.getElementById('asuntoContacto').value;
    var campo = document.getElementById('asuntoContacto');

    var errorTelefono = document.getElementById('errorAsunto');

    if (!asunto.trim() == "") {
        if (!pAsunto.test(asunto)) {
            campo.style.border = "3px solid red";
            errorTelefono.innerHTML = "  'Asunto inválido.'";
            e.preventDefault();
            return false;
        } else {
            campo.style.border = 'none';
        }
    } else {
        campo.style.border = "3px solid red";
        errorTelefono.innerHTML = "  'El campo 'Asunto' no puede estar vacío.'";
    }
}

function validarCorreo(e) {
    var pEmail = /\S+@{1}\S+\.{1}\S+/;
    var email = document.getElementById('correoContacto').value;
    var campo = document.getElementById('correoContacto');

    var errorCorreo = document.getElementById('errorCorreo');

    if (!email.trim() == "") {
        if (!pEmail.test(email)) {
            campo.style.border = "3px solid red";
            errorCorreo.innerHTML = "  'Email inválido.'";
            e.preventDefault();
            return false;
        } else {
            campo.style.border = 'none';
        }
    } else {
        campo.style.border = "3px solid red";
        errorCorreo.innerHTML = "  'El campo 'Email' no puede estar vacío.'";
    }

}
function validarMensaje(e) {
    var pMensaje = /^.+$/;
    var mensaje = document.getElementById('mensajeContacto').value;
    var campo = document.getElementById('mensajeContacto');

    var errorApellido = document.getElementById('errorMensaje');

    if (!mensaje.trim() == "") {
        if (!pMensaje.test(mensaje)) {
            campo.style.border = "3px solid red";
            errorApellido.innerHTML = "  'Mensaje inválido.'";
            e.preventDefault();
            return false;
        } else {
            campo.style.border = 'none';
        }
    } else {
        campo.style.border = "3px solid red";
        errorApellido.innerHTML = "  'El campo 'Mensaje' no puede estar vacío.'";
    }
}