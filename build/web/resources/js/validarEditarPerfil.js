
/********************************
 * 
 * Validar formulario registro
 * 
 */

window.onload = editarPerfil;

function editarPerfil() {
    document.getElementById("editarPerfil").addEventListener('click', validarNombre, false);
    document.getElementById("editarPerfil").addEventListener('click', validarApellido, false);
    document.getElementById("editarPerfil").addEventListener('click', validarTelefono, false);
    document.getElementById("editarPerfil").addEventListener('click', validarCorreo, false);    
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

function validarApellido(e) {
    var pApellido = /^[A-Za-z\s]+$/;
    var apellido = document.getElementById('apellido').value;
    var campo = document.getElementById('apellido');

    var errorApellido = document.getElementById('errorApellido');

    if (apellido != null || apellido.trim() != "") {
        if (!pApellido.test(apellido)) {
            campo.style.border = "3px solid red";
            errorApellido.innerHTML = "  'Apellido inválido.'";
            e.preventDefault();
            return false;
        } else {
            campo.style.border = 'none';
            errorApellido.innerHTML = "";
        }
    } else {
        campo.style.border = "3px solid red";
        errorApellido.innerHTML = "  'El campo 'Apellido' no puede estar vacío.'";
    }
}

function validarTelefono(e) {
    var pTelefono = /[0-9]{3}[0-9]{2}[0-9]{2}[0-9]{2}/;
    var telefono = document.getElementById('telefono').value;
    var campo = document.getElementById('telefono');

    var errorTelefono = document.getElementById('errorTelefono');

    if (telefono != null || telefono.trim() != "") {
        if (!pTelefono.test(telefono)) {
            campo.style.border = "3px solid red";
            errorTelefono.innerHTML = "  'Teléfono inválido.'";
            e.preventDefault();
            return false;
        } else {
            campo.style.border = 'none';
            errorTelefono.innerHTML = "";
        }
    } else {
        campo.style.border = "3px solid red";
        errorTelefono.innerHTML = "  'El campo 'Teléfono' no puede estar vacío.'";
    }
}

function validarCorreo(e) {
    var pEmail = /^\w+([.-_+]?\w+)*@\w+([.-]?\w+)*(\.\w{2,10})+$/;
    var email = document.getElementById('correo').value;
    var campo = document.getElementById('correo');

    var errorCorreo = document.getElementById('errorCorreo');

    if (email != null || email.trim() != "") {
        if (!pEmail.test(email)) {
            campo.style.border = "3px solid red";
            errorCorreo.innerHTML = "  'Email inválido.'";
            e.preventDefault();
            return false;
        } else {
            campo.style.border = 'none';
            errorCorreo.innerHTML = "";
        }
    } else {
        campo.style.border = "3px solid red";
        errorCorreo.innerHTML = "  'El campo 'Email' no puede estar vacío.'";
    }
}