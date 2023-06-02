<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Naviauto - Acceder</title>

        <!-- Añadimos el head -->
        <jsp:include page="head.jsp" />
    </head>
    <body>

    <c:choose>
        <c:when test = "${registroExito}">
            <script>
                toastr["success"]("${mensajeRegistro}", {"closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
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
    
    <c:choose>
        <c:when test = "${mensajeError}">
            <script>
                toastr["error"]("${error}", {"closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
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

        <div class="text-center w-100 mb-4 mt-4" id="logo">
            <div id="logologinDiv">
                <div id="logoDiv">
                    <img class="center" src="resources/img/logo.png" alt="" width="200" height="65">
                </div>
            </div>
        </div>
        <div class="w-100 y text-center mb-3" id="menuTop">

            <a href="Inicio" id="a1" class="amenu aMenu">Inicio</a>
            <a href="#quienesSomos" id="a2" class="amenu aMenu">Quienes Somos</a>
            <a href="Servicios" id="a3" class="amenu aMenu">Servicios</a>
            <a href="Productos" id="a3" class="amenu aMenu">Productos</a>
            <a href="Contacto" id="a4" class="amenu aMenu">Contacto</a>
        </div>
    </nav>
    <!--Fin menu-->

    <!-- Login -->
    <div class="contenedorLogin">
        <div class="imagenLogin">
        </div>
        <div class="formularioLogin">
            <div class="campos">
                <h3>Accede a tu cuenta</h3>
                <form method="post" action="Login">
                    <input type="email" name="correo" id="correoLogin" placeholder="Correo electrónico" size="65" maxlength="45" autocomplete="off"/><br/>
                    <p style="display: inline-block" id="errorCorreo"></p><br/>
                    <input type="password" name="password" id="passwordLogin" placeholder="Contraseña" size="65" maxlength="20" minlength="8"/><br/>
                    <p style="display: inline-block" id="errorPassword"></p><br/> <br/>
                    <p><a href="#">¿Has olvidado tu contraseña?</a></p>
                    <p>¿No tienes cuenta?, <a href="NuevaCuenta">registrate aquí</a>.</p>
                    <input type="submit" onclick="validarLogin()" value="Acceder" id="iniciarSesion" class="btn btn-danger"/>
                </form>
            </div>
        </div>
    </div>
    <!-- /Fin Login -->


    <!--Import del footer -->
    <jsp:include page="footer.jsp" />

    <script src="resources/js/validarLogin.js"></script>
</body>
</html>
