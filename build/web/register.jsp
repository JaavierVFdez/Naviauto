<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Naviauto - Crear Cuenta</title>

        <!-- Añadimos el head -->
        <jsp:include page="head.jsp" />
    </head>
    <body>
        <c:choose>
            <c:when test = "${mensajeError}">
                <script>
                    toastr["error"]("${error}",{"closeButton": false,
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

                <a href="index.jsp" id="a1" class="amenu aMenu">Inicio</a>
                <a href="#quienesSomos" id="a2" class="amenu aMenu">Quienes Somos</a>
                <a href="Servicios" id="a3" class="amenu aMenu">Servicios</a>
                <a href="Productos" id="a3" class="amenu aMenu">Productos</a>
                <a href="Contacto" id="a4" class="amenu aMenu">Contacto</a>
            </div>
        </nav>
        <!--Fin menu-->

        <!-- Login -->
        <div class="contenedorRegister">
            <div class="imagenRegister">
            </div>
            <div class="formularioRegister">
                <div class="camposRegister">
                    <h3>Crear cuenta</h3>
                    <form id="registerForm" method="post" action="Register">
                        <label class="label">Nombre <p style="display: inline-block" id="errorNombre"></p></label><br/>
                        <input type="text" name="nombre" id="nombreRegister" placeholder="Introduce tu nombre" size="65" maxlength="15" autocomplete="off"/><br/><br/>

                        <label class="label">Apellido <p style="display: inline-block" id="errorApellido"></p></label><br/>
                        <input type="text" name="apellido" id="apellidoRegister" placeholder="Introduce tu apellido" size="65" maxlength="15" autocomplete="off"/><br/><br/>

                        <label class="label">Teléfono <p style="display: inline-block" id="errorTelefono"></p></label><br/>
                        <input type="text" name="tlf" id="telefonoRegister" placeholder="Introduce tu teléfono" size="65" maxlength="9" minlength="9" autocomplete="off"/><br/><br/>

                        <label class="label">DNI <p style="display: inline-block" id="errorDNI"></p></label><br/>
                        <input type="text" name="dni" id="dniRegister" placeholder="Introduce tu DNI" size="65" maxlength="9" minlength="9" autocomplete="off"/><br/><br/>

                        <label class="label">Correo electrónico <p style="display: inline-block" id="errorCorreo"></p></label><br/>
                        <input type="email" name="correo" id="correoRegister" placeholder="Introduce tu correo electrónico" size="65" maxlength="50" autocomplete="off"/><br/><br/>

                        <label class="label">Contraseña <p style="display: inline-block" id="errorPassword"></p></label><br/>
                        <input type="password" name="password" id="passwordRegister" placeholder="Introduce tu contraseña" size="65" maxlength="16" minlength="8"/><br/><br/> <br/>

                        <p class="ccenter"><a href="#">¿Has olvidado tu contraseña?</a></p>
                        <p class="ccenter">¿Ya tienes cuenta?, <a href="IniciarSesion">Inicie sesión aquí­</a>.</p>

                        <div id="botonRegistrar">
                            <input type="submit" onclick="validarRegistro()" value="Crear Cuenta" id="crearCuenta" class="btn btn-danger ccenter"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- /Fin Login -->

        <!-- Añadimos el footer -->
        <jsp:include page="footer.jsp" />

        <script src="resources/js/validarRegister.js"></script>
    </body>
</html>
