
/********************************
 * 
 * Validar formulario pago
 * 
 */


window.onload = validarPago;

function validarPago() {

    var numeroTarjeta = document.getElementById("numero_tarjeta");
    var cvv = document.getElementById("cvv");

    // Limitamos la entrada a 16 dígitos
    numeroTarjeta.oninput = function () {
        if (this.value.length > 16) {
            this.value = this.value.slice(0, 16);
        }
    };

    // Evitamos que se introduzcan caracteres que no sean números
    numeroTarjeta.onkeypress = function (event) {
        var charCode = (event.which) ? event.which : event.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            event.preventDefault();
        }
    };

    // Evitamos que se introduzcan caracteres que no sean números
    cvv.onkeypress = function (event) {
        var charCode = (event.which) ? event.which : event.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            event.preventDefault();
        }
    };

    // Desactivamos el cambio de valor con la rueda del ratón
    numeroTarjeta.onwheel = function (event) {
        event.preventDefault();
    };

    var fecha = new Date(); // obtenemos la fecha actual
    var dia = ("0" + fecha.getDate()).slice(-2); // obtenemos el día
    var mes = ("0" + (fecha.getMonth() + 1)).slice(-2); // obtenemos el mes
    var ano = fecha.getFullYear(); // obtenemos el año

    // En el formato de fecha, el mes empieza desde 0, es por eso que se suma 1.

    // Finalmente formamos la fecha en el formato que HTML date usa (YYYY-MM-DD)
    var fechaActual = ano + "-" + mes + "-" + dia;

    // Y asignamos esta fecha al campo de entrada
    document.getElementById("fechaCaducidad").min = fechaActual;
    document.getElementById("fechaCaducidad").value = fechaActual;

}

