<%-- 
    Document   : nuevoVehiculo
    Created on : 6 jun 2023, 7:07:13
    Author     : javie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Añadimos el head -->
        <jsp:include page="../../head.jsp" />
    </head>
    <body>
        <!--Javascript-->
        <script src="resources/bootstrap-5.0.2-dist/js/bootstrap.bundle.js"></script>

    <c:choose>
        <c:when test = "${cocheNoAdded}">
            <script>
                toastr["error"]("El DNI introcido no está en nuestro sistema.", {"closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-left",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"})
            </script>
        </c:when>
    </c:choose>


     <!-- Menú -->
        <nav class="navbar navbar-light bg-light" style="background-color: white;">
            <div id="loginRegister">
                <div style="margin-top: 0.5rem; margin-right: 1rem;">
                    <a href="CerrarSesion" class="aMenu">Cerrar Sesión</a>
                </div>
            </div>
            <div class="text-center w-100 mb-4 mt-4" id="logo">
                <div id="logologinDiv">
                    <div id="logoDiv">
                        <img class="center" src="resources/img/logo.png" alt="" width="200" height="65">
                    </div>
                </div>
            </div>
        </nav>
        <!--Fin menu-->

    <!-- Contenido principal -->
    <div class="container bg-light rounded mt-5 mb-5 w-75 text-center">
        <a href="Vehiculos" class="aMenu" style="text-decoration: none;">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-left" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
            <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
            </svg>
            Volver atrás
        </a>
        <h4 class="mb-5" style="padding-top: 0.8em;"><strong>Nuevo Vehículos</strong></h4>
        <form method="post" action="AddVehiculo" class="text-center">
            <label>Mátricula <p id="errorMatricula" style="display: inline-block; font-style: italic;"></p>:</label>
            <input class="form-control mb-1" placeholder="0000ABC" type="text" name="matricula" id="matricula" autocomplete="off" style="width: 50%; text-align: center; display: block; margin: 1rem auto;"/><br/><br/>
            <label class="label">DNI <p style="display: inline-block" id="errorDNI"></p>:</label><br/>
            <input class="form-control mb-1" type="text" name="dni" id="dni" placeholder="Introduce el DNI del propietario" style="width: 37%; text-align: center; display: block; margin: 1rem auto;" maxlength="9" minlength="9" autocomplete="off"/><br/><br/>
            <label>Modelo <p id="errorModelo" style="display: inline-block; ont-style: italic;"></p>:</label>
            <input placeholder="Introduzca el modelo del coche" class="form-control mb-1" style="width: 37%; text-align: center; display: block; margin: 1rem auto;" type="text" name="modelo" id="modelo"/><br/><br/>
            <label>Marca <p id="errorMarca" style="display: inline-block; ont-style: italic;"></p>:</label>
            <input placeholder="Introduzca la marca del coche" class="form-control mb-1" style="width: 37%; text-align: center; display: block; margin: 1rem auto;" type="text" name="marca" id="marca"/><br/><br/>
            <label>Año del vehículo:</label>
            <input class="form-control mb-1" style="width: 37%; text-align: center; display: block; margin: 1rem auto;" autocomplete="off" type="date" name="anyoVehiculo" id="anyoVehiculo" required/><br/><br/>
            <br/>
            <label>Kilometraje Actual: <p id="errorKilometrajeActual" style="display: inline-block; ont-style: italic;"></p>:</label>
            <input type="text" name="kilometrajeActual" id="kilometrajeActual" class="form-control" style="width: 50%; text-align: center; display: block; margin: 1rem auto;" placeholder="0.00" autocomplete="off"/>

            <input type="submit" class="btn btn-danger mb-4" onclick="validarNuevaReparacion()" name="nuevoVehiculo" value="Añadir Reparación" id="nuevoVehiculo" />
        </form>
    </div>
    <!-- Fin contenido principal -->

    <script src="resources/js/validarNuevoVehiculo.js"></script>
</body>
</html>
