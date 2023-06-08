<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Naviauto - Contacto</title>

        <!-- Añadimos el head -->
        <jsp:include page="head.jsp" />
    </head>

    <body style="/*background: url(&quot;design.jpg&quot;);*/background-position: 0 -60px;">

        

        <!--Menu-->
        <nav class="navbar navbar-light bg-light" style="background-color: white;">
            <div id="loginRegister">
                <c:choose>
                    <c:when test = "${registrado}">
                        <div style="margin-top: 0.5rem; margin-right: 1rem;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                            <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                            </svg>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <span><a href="IniciarSesion" id="inicioSesion">Iniciar Sesión</a> / <a href="NuevaCuenta" id="registro">Registrarse</a></span>
                    </c:otherwise>
                </c:choose>
            </div>
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
            <!--/Fin opciones paginas-->

        </nav>
        <!--/Fin menu-->

        <!--Contenido Principal -->
        <div class="container my-5" style="height: 66%;">
            <div class="row justify-content-center">
                <div class="col-lg-9">
                    <h2 class="mb-3" style="font-size: 40px; font-weight: bold;">Contáctanos</h2>

                    <!--Formulario-->
                    <form method="post" action="IniciarSesion" id="formularioContactos">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="your-name" class="form-label">Nombre <p id="errorNombre"></p>:</label>
                                <input type="text" class="form-control" id="nombreContacto" name="nombreContacto" placeholder="Introduzca tu nombre">
                            </div>
                            <div class="col-md-6">
                                <label for="your-surname" class="form-label">Apellido <p id="errorApellido"></p>:</label>
                                <input type="text" class="form-control" id="apellidoContacto" name="apellidoContacto" placeholder="Introduzca tu apellido">
                            </div>
                            <div class="col-md-6">
                                <label for="your-email" class="form-label">Correo electrónico <p id="errorCorreo"></p>:</label>
                                <input type="email" class="form-control" id="correoContacto" name="correoContacto" placeholder="Introduzca tu correo">
                            </div>
                            <div class="col-md-6">
                                <label for="your-subject" class="form-label">Asunto <p id="errorAsunto"></p>:</label>
                                <input type="text" class="form-control" id="asuntoContacto" name="asuntoContacto" placeholder="Comenta el asunto">
                            </div>
                            <div class="col-12">
                                <label for="your-message" class="form-label">Mensaje <p id="errorMensaje"></p>:</label>
                                <textarea class="form-control" id="mensajeContacto" name="mensajeContacto" rows="5" placeholder="Describa tu problema o duda"></textarea>
                            </div>
                            <div class="col-12">
                                <div class="row">
                                    <div id="botonEnviarContacto">
                                        <input type="submit" onclick="validarContacto()" value="Enviar" class="btn btn-danger" id="enviarFormularioContacto">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!--Fin formulario-->

                </div>
            </div>
        </div>
        <!--/Fin contenido principal-->


        <!--Ubicacion iframe-->
        <div style="height: 44.5vh; width: 100vw;">
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3168.433330779357!2d-6.041070184692324!3d37.42686677982421!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd126b1177c0bf35%3A0x3c4afd3f4e6ad9dd!2sNaviauto!5e0!3m2!1sen!2ses!4v1677262222742!5m2!1sen!2ses"
                width="99.2%" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
        <!--/Fin ubicacion iframe-->

        <!--Datos empresa-->
        <div id="datosEmpresa" style="height: 28%; background-color: #cc0000; opacity: 0.8;">
            <div id="datos1" class="text-center" style="width: 100%; float: left; font-size: x-large; color: white; font-weight: bold;">
                <br /><svg xmlns="http://www.w3.org/2000/svg" width="40" height="30" fill="currentColor"
                           class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z" />
                </svg><br />P.I. Navisur C/ Jacinto, 5 <br>(Ctra. Camas-Santiponce)<br>41907</div>
            <div id="datos2" class="text-center" style="width: 100%; font-size: x-large; color: white; font-weight: bold;"><br /><svg
                    xmlns="http://www.w3.org/2000/svg" width="40" height="30" fill="currentColor"
                    class="bi bi-telephone-fill" viewBox="0 0 16 16">
                <path fill-rule="evenodd"
                      d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
                </svg></i><br />955 998 105<br><br><br></div>
            <div id="datos3" class="text-center" style="width: 100%; font-size: x-large; color: white; font-weight: bold;"><br /><svg
                    xmlns="http://www.w3.org/2000/svg" width="40" height="30" fill="currentColor" class="bi bi-phone-fill"
                    viewBox="0 0 16 16">
                <path
                    d="M3 2a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V2zm6 11a1 1 0 1 0-2 0 1 1 0 0 0 2 0z" />
                </svg><br />673 249 869<br><br><br></div>
            <div id="datos4" class="text-center" style="width: 100%; float: right; font-size: x-large; color: white; font-weight: bold;">
                <br /><svg xmlns="http://www.w3.org/2000/svg" width="40" height="30" fill="currentColor"
                           class="bi bi-envelope-at-fill" viewBox="0 0 16 16">
                <path
                    d="M2 2A2 2 0 0 0 .05 3.555L8 8.414l7.95-4.859A2 2 0 0 0 14 2H2Zm-2 9.8V4.698l5.803 3.546L0 11.801Zm6.761-2.97-6.57 4.026A2 2 0 0 0 2 14h6.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.606-3.446l-.367-.225L8 9.586l-1.239-.757ZM16 9.671V4.697l-5.803 3.546.338.208A4.482 4.482 0 0 1 12.5 8c1.414 0 2.675.652 3.5 1.671Z" />
                <path
                    d="M15.834 12.244c0 1.168-.577 2.025-1.587 2.025-.503 0-1.002-.228-1.12-.648h-.043c-.118.416-.543.643-1.015.643-.77 0-1.259-.542-1.259-1.434v-.529c0-.844.481-1.4 1.26-1.4.585 0 .87.333.953.63h.03v-.568h.905v2.19c0 .272.18.42.411.42.315 0 .639-.415.639-1.39v-.118c0-1.277-.95-2.326-2.484-2.326h-.04c-1.582 0-2.64 1.067-2.64 2.724v.157c0 1.867 1.237 2.654 2.57 2.654h.045c.507 0 .935-.07 1.18-.18v.731c-.219.1-.643.175-1.237.175h-.044C10.438 16 9 14.82 9 12.646v-.214C9 10.36 10.421 9 12.485 9h.035c2.12 0 3.314 1.43 3.314 3.034v.21Zm-4.04.21v.227c0 .586.227.8.581.8.31 0 .564-.17.564-.743v-.367c0-.516-.275-.708-.572-.708-.346 0-.573.245-.573.791Z" />
                </svg><br />naviautotaller@gmail.com<br><br><br></div>
        </div>
        <!--/Fin datos empresa-->



        <!--Añadimos el footer -->
        <jsp:include page="footer.jsp" />

        <script src="resources/js/validarContacto.js"></script>

        <!-- Scripts -->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
        <script src="resources/js/jquery.min.js"></script>
        <script src="resources/bootstrap-5.0.2-dist/js/bootstrap.bundle.js"></script>
        <script src="resources/js/bold-and-bright.js"></script>
    </body>

</html>