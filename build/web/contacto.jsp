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
                        <div style="margin-top: 0.5rem; ">
                            <a class="aMenu"  href="#" style="text-decoration: none; margin-right: 0rem;" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                                </svg>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink" style="padding: 7px;">
                                <li><a class="dropdown-item aMenu"  style="text-decoration: none; font-weight: normal;" href="EditarPerfil"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                                        <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
                                        </svg> Editar mi perfil</a></li>
                                <li><a class="dropdown-item aMenu" style="text-decoration: none; font-weight: normal;" href="Pedidos"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-ul" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm-3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
                                        </svg> Mis pedidos</a></li>
                                <li><a class="dropdown-item aMenu" style="text-decoration: none; font-weight: normal;" href="Reparaciones"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-car-front-fill" viewBox="0 0 16 16">
                                        <path d="M2.52 3.515A2.5 2.5 0 0 1 4.82 2h6.362c1 0 1.904.596 2.298 1.515l.792 1.848c.075.175.21.319.38.404.5.25.855.715.965 1.262l.335 1.679c.033.161.049.325.049.49v.413c0 .814-.39 1.543-1 1.997V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.338c-1.292.048-2.745.088-4 .088s-2.708-.04-4-.088V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.892c-.61-.454-1-1.183-1-1.997v-.413a2.5 2.5 0 0 1 .049-.49l.335-1.68c.11-.546.465-1.012.964-1.261a.807.807 0 0 0 .381-.404l.792-1.848ZM3 10a1 1 0 1 0 0-2 1 1 0 0 0 0 2Zm10 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2ZM6 8a1 1 0 0 0 0 2h4a1 1 0 1 0 0-2H6ZM2.906 5.189a.51.51 0 0 0 .497.731c.91-.073 3.35-.17 4.597-.17 1.247 0 3.688.097 4.597.17a.51.51 0 0 0 .497-.731l-.956-1.913A.5.5 0 0 0 11.691 3H4.309a.5.5 0 0 0-.447.276L2.906 5.19Z"/>
                                        </svg> Reparaciones</a></li>
                                <li><a class="dropdown-item aMenu" style="text-decoration: none; font-weight: normal;" href="CerrarSesion"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-left" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
                                        <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
                                        </svg> Cerrar Sesión</a></li>
                            </ul>

                            <a href="Carrito" class="aMenu" style="margin-right: 6rem;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">
                                <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
                                </svg>
                            </a>
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
                <a href="PaginaInicio" id="a1" style="text-decoration: none;" class="aMenu">Inicio</a>
                <a href="PaginaInicio?source=quienesSomos" id="a2" style="text-decoration: none;" class="aMenu">Quienes Somos</a>
                <a href="PaginaInicio?source=servicios" id="a3" style="text-decoration: none;" class="aMenu">Servicios</a>
                <a href="Productos" id="a3" style="text-decoration: none;" class="aMenu">Productos</a>
                <a href="contacto.jsp" id="a4" style="text-decoration: none;" class="aMenu">Contacto</a>
            </div>
        </nav>
        <!--Fin menu-->

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