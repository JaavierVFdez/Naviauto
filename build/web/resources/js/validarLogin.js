
/********************************
 * 
 * Validar formulario login
 * 
 */

window.onload = validarLogin;

function validarLogin() {
    document.getElementById("iniciarSesion").addEventListener('click', validarCorreo, false);
    document.getElementById("iniciarSesion").addEventListener('click', validarPassword, false);
}


function validarCorreo(e) {
    var pEmail = /^\w+([.-_+]?\w+)*@\w+([.-]?\w+)*(\.\w{2,10})+$/;
    var email = document.getElementById('correoLogin').value;
    var campo = document.getElementById('correoLogin');

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

function validarPassword(e) {
    var pPassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{6,16}/;
    var password = document.getElementById('passwordLogin').value;
    var campo = document.getElementById('passwordLogin');

    var errorPasswprd = document.getElementById('errorPassword');

    if (!password != null || password.trim() != "") {
        if (!pPassword.test(password)) {
            campo.style.border = "3px solid red";
            errorPasswprd.innerHTML = "  'Contraseña inválida (1 mayús. 1 número y 1 carácter especial).'";
            e.preventDefault();
            return false;
        } else {
            campo.style.border = 'none';
            errorPasswprd.innerHTML = "";
        }
    } else {
        campo.style.border = "3px solid red";
        errorPasswprd.innerHTML = "  'El campo 'Contraseña' no puede estar vacía.'";
    }
}