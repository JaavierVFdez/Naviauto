<%-- 
    Document   : nuevaPieza
    Created on : 7 jun 2023, 20:26:02
    Author     : javie
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

    <c:choose>
        <c:when test = "${reparacionNoExiste}">
            <script>
                toastr["error"]("El código de reparación no existe en nuestro sistema.", {"closeButton": false,
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
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" id="iconoPerfil" class="bi bi-person-circle" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                </svg>
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
        <a href="Piezas" class="aMenu" style="text-decoration: none;">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-left" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
            <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
            </svg>
            Volver atrás
        </a>
        <h4 class="mb-5" style="padding-top: 0.8em;"><strong>Nueva Pieza</strong></h4>
        <form method="post" action="AddPieza" class="text-center">
            <label>Código Reparación: <p id="errorReparacion" style="display: inline-block; font-style: italic;"></p>:</label>
            <input class="form-control mb-1" placeholder="Introduzca el código de la reparación" type="text" name="codigoReparacion" id="codigoReparacion" autocomplete="off" style="width: 50%; text-align: center; display: block; margin: 1rem auto;"/><br/><br/>
            <label>Nombre: <p id="errorNombre" style="display: inline-block; font-style: italic;"></p>:</label>
            <input class="form-control mb-1" placeholder="Introduzca el nombre de la pieza" type="text" name="nombre" id="nombre" autocomplete="off" style="width: 50%; text-align: center; display: block; margin: 1rem auto;"/><br/><br/>
            <label>Fabricante: <p id="errorFabricante" style="display: inline-block; font-style: italic;"></p>:</label>
            <input class="form-control mb-1" placeholder="Introduzca el fabricante" type="text" name="fabricante" id="fabricante" autocomplete="off" style="width: 50%; text-align: center; display: block; margin: 1rem auto;"/><br/><br/>
            <label>Precio <p id="errorPrecio" style="display: inline-block; ont-style: italic;"></p>:</label>
            <input type="text" name="precio" id="precio" class="form-control" style="width: 50%; text-align: center; display: block; margin: 1rem auto;" placeholder="0.00" autocomplete="off"/>

            <input type="submit" class="btn btn-danger mb-4" onclick="validarNuevaPieza()" name="nuevaPieza" value="Añadir Pieza" id="nuevaPieza" />
        </form>
    </div>
    <!-- Fin contenido principal -->

    <script src="resources/js/validarNuevaPieza.js"></script>
</body>
</html>
