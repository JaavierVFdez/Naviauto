<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Naviauto - Página Inicio</title>

        <!--Bootstrap-->
        <link rel="stylesheet" href="resources/bootstrap-5.0.2-dist/css/bootstrap.min.css">


        <!-- Estilo personal -->
        <link rel="stylesheet" href="resources/css/styles.css" />
    </head>

    <body style="background-color: #211f24;">

        <!--Javascript-->
        <script src="resources/bootstrap-5.0.2-dist/js/bootstrap.bundle.js"></script>

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
                <a href="Contacto" id="a4" style="text-decoration: none;" class="aMenu">Contacto</a>
            </div>
        </nav>
        <!--Fin menu-->

        <!-- Slider -->
        <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active" style="background-image: url('resources/img/slider5.jpg'); background-repeat: no-repeat; height: 35rem; width: 100%; background-size: cover;">

                </div>
                <div class="carousel-item" style="background-image: url('resources/img/slider3.jpg'); background-repeat: no-repeat; height: 35rem; background-size: cover;">

                </div>
                <div class="carousel-item" style="background-image: url('resources/img/slider4.jpg'); background-repeat: no-repeat; height: 35rem; background-size: cover;">

                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <!-- Fin slider -->


        <!-- Banner -->
        <div style="background-color: #cc0000; opacity: 0.8; height: 30%; margin-bottom: 0px;" class="text-center w-100">
            <h3 style="padding: 5%; color: #fff; font-weight: bold;">Para que su vehículo esté en perfectas condiciones le ofrecemos, además de reparaciones, <br/>revisiones y mantenimientos para todas las marcas.</h3>
        </div>
        <!-- Fin Banner -->

        <!--Seccion Servicios-->
        <section style="margin-top: 0px;" class="section-services" id="servicios">
            <div class="container text-center">
                <div class="row justify-content-center text-center">
                    <div class="col-md-10 col-lg-8">
                        <div class="header-section">
                            <h2 class="title">Nuestros <span>Servicios</span></h2>
                        </div>
                    </div>
                </div>
                <div class="row">

                    <!-- Inicio servicio -->
                    <div class="col-md-6 col-lg-4">
                        <div class="single-service">
                            <div class="part-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="30" fill="currentColor"
                                     class="bi bi-tools" viewBox="0 0 16 16">
                                <path
                                    d="M1 0 0 1l2.2 3.081a1 1 0 0 0 .815.419h.07a1 1 0 0 1 .708.293l2.675 2.675-2.617 2.654A3.003 3.003 0 0 0 0 13a3 3 0 1 0 5.878-.851l2.654-2.617.968.968-.305.914a1 1 0 0 0 .242 1.023l3.27 3.27a.997.997 0 0 0 1.414 0l1.586-1.586a.997.997 0 0 0 0-1.414l-3.27-3.27a1 1 0 0 0-1.023-.242L10.5 9.5l-.96-.96 2.68-2.643A3.005 3.005 0 0 0 16 3c0-.269-.035-.53-.102-.777l-2.14 2.141L12 4l-.364-1.757L13.777.102a3 3 0 0 0-3.675 3.68L7.462 6.46 4.793 3.793a1 1 0 0 1-.293-.707v-.071a1 1 0 0 0-.419-.814L1 0Zm9.646 10.646a.5.5 0 0 1 .708 0l2.914 2.915a.5.5 0 0 1-.707.707l-2.915-2.914a.5.5 0 0 1 0-.708ZM3 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026L3 11Z" />
                                </svg>
                                <h3 class="title">ESPECIALISTA EN GASES ITV (C.0, HIDROCARBUROS, ETC.)</h3>
                            </div>
                            <div class="part-2">
                                <p class="description">Garantiza la seguridad y el cumplimiento normativo de tus vehículos. Como especialista en gases ITV, te proporciono mediciones precisas, análisis exhaustivos y asesoramiento experto para reducir emisiones y mejorar la eficiencia.</p>
                            </div>
                        </div>
                    </div>
                    <!-- / Fin servicio -->

                    <!-- Inicio servicio -->
                    <div class="col-md-6 col-lg-4">
                        <div class="single-service">
                            <div class="part-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="30" fill="currentColor"
                                     class="bi bi-exclamation-octagon-fill" viewBox="0 0 16 16">
                                <path
                                    d="M11.46.146A.5.5 0 0 0 11.107 0H4.893a.5.5 0 0 0-.353.146L.146 4.54A.5.5 0 0 0 0 4.893v6.214a.5.5 0 0 0 .146.353l4.394 4.394a.5.5 0 0 0 .353.146h6.214a.5.5 0 0 0 .353-.146l4.394-4.394a.5.5 0 0 0 .146-.353V4.893a.5.5 0 0 0-.146-.353L11.46.146zM8 4c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995A.905.905 0 0 1 8 4zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                                </svg>
                                <h3 class="title">DIAGNOSIS GESTIÓN ELECTRÓNICA (AIRBAG, ABS, INYECCIÓN, ETC.)</h3>
                            </div>
                            <div class="part-2">
                                <p class="description">Desbloquea el potencial de tus vehículos con diagnóstico y gestión electrónica de vanguardia. Ofrecemos soluciones precisas y confiables para maximizar el rendimiento y la seguridad de tus vehículos.</p>
                            </div>
                        </div>
                    </div>
                    <!-- / Fin servicio -->

                    <!-- Inicio servicio -->
                    <div class="col-md-6 col-lg-4">
                        <div class="single-service">
                            <div class="part-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="30" fill="currentColor"
                                     class="bi bi-wind" viewBox="0 0 16 16">
                                <path
                                    d="M12.5 2A2.5 2.5 0 0 0 10 4.5a.5.5 0 0 1-1 0A3.5 3.5 0 1 1 12.5 8H.5a.5.5 0 0 1 0-1h12a2.5 2.5 0 0 0 0-5zm-7 1a1 1 0 0 0-1 1 .5.5 0 0 1-1 0 2 2 0 1 1 2 2h-5a.5.5 0 0 1 0-1h5a1 1 0 0 0 0-2zM0 9.5A.5.5 0 0 1 .5 9h10.042a3 3 0 1 1-3 3 .5.5 0 0 1 1 0 2 2 0 1 0 2-2H.5a.5.5 0 0 1-.5-.5z" />
                                </svg>
                                <h3 class="title">AIRE ACONDICIONADO - REPARACIÓN COMPRESOR</h3>
                            </div>
                            <div class="part-2">
                                <p class="description">Recupera la frescura y el confort en tus vehículos con nuestro servicio de reparación. Resolveremos de manera eficiente y confiable devolviéndote un rendimiento óptimo y un ambiente agradable</p>
                            </div>
                        </div>
                    </div>
                    <!-- / Fin servicio -->

                    <!-- Inicio servicio -->
                    <div class="col-md-6 col-lg-4">
                        <div class="single-service">
                            <div class="part-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="30" fill="currentColor"
                                     class="bi bi-gear-wide-connected" viewBox="0 0 16 16">
                                <path
                                    d="M7.068.727c.243-.97 1.62-.97 1.864 0l.071.286a.96.96 0 0 0 1.622.434l.205-.211c.695-.719 1.888-.03 1.613.931l-.08.284a.96.96 0 0 0 1.187 1.187l.283-.081c.96-.275 1.65.918.931 1.613l-.211.205a.96.96 0 0 0 .434 1.622l.286.071c.97.243.97 1.62 0 1.864l-.286.071a.96.96 0 0 0-.434 1.622l.211.205c.719.695.03 1.888-.931 1.613l-.284-.08a.96.96 0 0 0-1.187 1.187l.081.283c.275.96-.918 1.65-1.613.931l-.205-.211a.96.96 0 0 0-1.622.434l-.071.286c-.243.97-1.62.97-1.864 0l-.071-.286a.96.96 0 0 0-1.622-.434l-.205.211c-.695.719-1.888.03-1.613-.931l.08-.284a.96.96 0 0 0-1.186-1.187l-.284.081c-.96.275-1.65-.918-.931-1.613l.211-.205a.96.96 0 0 0-.434-1.622l-.286-.071c-.97-.243-.97-1.62 0-1.864l.286-.071a.96.96 0 0 0 .434-1.622l-.211-.205c-.719-.695-.03-1.888.931-1.613l.284.08a.96.96 0 0 0 1.187-1.186l-.081-.284c-.275-.96.918-1.65 1.613-.931l.205.211a.96.96 0 0 0 1.622-.434l.071-.286zM12.973 8.5H8.25l-2.834 3.779A4.998 4.998 0 0 0 12.973 8.5zm0-1a4.998 4.998 0 0 0-7.557-3.779l2.834 3.78h4.723zM5.048 3.967c-.03.021-.058.043-.087.065l.087-.065zm-.431.355A4.984 4.984 0 0 0 3.002 8c0 1.455.622 2.765 1.615 3.678L7.375 8 4.617 4.322zm.344 7.646.087.065-.087-.065z" />
                                </svg>
                                <h3 class="title">MECÁNICA GENERAL - ELECTRICIDAD AUTOMOVIL</h3>
                            </div>
                            <div class="part-2">
                                <p class="description">Confía en nuestros expertos en mecánica general y electricidad automotriz para mantener tu vehículo en perfectas condiciones. Brindamos soluciones rápidas y confiables para todos los aspectos mecánicos y eléctricos de tu automóvil. </p>
                            </div>
                        </div>
                    </div>
                    <!-- / Fin servicio -->

                    <!-- Inicio servicio -->
                    <div class="col-md-6 col-lg-4" style="height: 30vh;">
                        <div class="single-service">
                            <div class="part-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="30" fill="currentColor"
                                     class="bi bi-droplet-half" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                      d="M7.21.8C7.69.295 8 0 8 0c.109.363.234.708.371 1.038.812 1.946 2.073 3.35 3.197 4.6C12.878 7.096 14 8.345 14 10a6 6 0 0 1-12 0C2 6.668 5.58 2.517 7.21.8zm.413 1.021A31.25 31.25 0 0 0 5.794 3.99c-.726.95-1.436 2.008-1.96 3.07C3.304 8.133 3 9.138 3 10c0 0 2.5 1.5 5 .5s5-.5 5-.5c0-1.201-.796-2.157-2.181-3.7l-.03-.032C9.75 5.11 8.5 3.72 7.623 1.82z" />
                                <path fill-rule="evenodd"
                                      d="M4.553 7.776c.82-1.641 1.717-2.753 2.093-3.13l.708.708c-.29.29-1.128 1.311-1.907 2.87l-.894-.448z" />
                                </svg>
                                <h3 class="title">REVISIONES Y MANTENIMIENTOS DE FLOTA - SERVICIOS DE NEUMÁTICO</h3>
                            </div>
                            <div class="part-2">
                                <p class="description">Optimiza el rendimiento y la eficiencia de tu flota con nuestro servicio de revisiones y mantenimientos especializados. Nuestro equipo de expertos se encarga de mantener tus vehículos en condiciones óptimas, asegurando un funcionamiento fresco y prolongando la vida útil de tu flota. </p>
                            </div>
                        </div>
                    </div>
                    <!-- / End Single Service -->

                    <!-- Inicio servicio -->
                    <div id="lacado2" class="col-md-6 col-lg-4" style="height: 30vh;">
                        <div class="single-service">
                            <div class="part-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="30" fill="currentColor"
                                     class="bi bi-car-front-fill" viewBox="0 0 16 16">
                                <path
                                    d="M2.52 3.515A2.5 2.5 0 0 1 4.82 2h6.362c1 0 1.904.596 2.298 1.515l.792 1.848c.075.175.21.319.38.404.5.25.855.715.965 1.262l.335 1.679c.033.161.049.325.049.49v.413c0 .814-.39 1.543-1 1.997V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.338c-1.292.048-2.745.088-4 .088s-2.708-.04-4-.088V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.892c-.61-.454-1-1.183-1-1.997v-.413a2.5 2.5 0 0 1 .049-.49l.335-1.68c.11-.546.465-1.012.964-1.261a.807.807 0 0 0 .381-.404l.792-1.848ZM3 10a1 1 0 1 0 0-2 1 1 0 0 0 0 2Zm10 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2ZM6 8a1 1 0 0 0 0 2h4a1 1 0 1 0 0-2H6ZM2.906 5.189a.51.51 0 0 0 .497.731c.91-.073 3.35-.17 4.597-.17 1.247 0 3.688.097 4.597.17a.51.51 0 0 0 .497-.731l-.956-1.913A.5.5 0 0 0 11.691 3H4.309a.5.5 0 0 0-.447.276L2.906 5.19Z" />
                                </svg>
                                <h3 class="title">CARGAS DE AIRE ACONDICIONADO - LACADO DE FAROS</h3>
                            </div>
                            <div class="part-2">
                                <p class="description">Recupera la frescura y el confort en tu vehículo con nuestro servicio de cargas de aire acondicionado. Además, ofrecemos servicios de lacado de faros para restaurar la claridad y mejorar la visibilidad de tus faros.</p>
                            </div>
                        </div>
                    </div>
                    <!-- /Final servicio -->

                </div>
            </div>
        </section>
        <!--Fin Seccion servicios-->

        <!--Ofertas-->
        <div style="background-color: #cc0000; opacity: 0.8; height: 30%;" class="text-center w-100">
            <h5 class="pt-4 ofertas" style="color:white; font-size: xx-large; font-weight: bold;">Ofertas</h5>
            <div style="display: grid; grid-template-columns: repeat(5, 1fr); padding: 3%;">
                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="30" fill="currentColor"
                         class="bi bi-brush-fill" viewBox="0 0 16 16">
                    <path style="background-color: white; color:white;"
                          d="M15.825.12a.5.5 0 0 1 .132.584c-1.53 3.43-4.743 8.17-7.095 10.64a6.067 6.067 0 0 1-2.373 1.534c-.018.227-.06.538-.16.868-.201.659-.667 1.479-1.708 1.74a8.118 8.118 0 0 1-3.078.132 3.659 3.659 0 0 1-.562-.135 1.382 1.382 0 0 1-.466-.247.714.714 0 0 1-.204-.288.622.622 0 0 1 .004-.443c.095-.245.316-.38.461-.452.394-.197.625-.453.867-.826.095-.144.184-.297.287-.472l.117-.198c.151-.255.326-.54.546-.848.528-.739 1.201-.925 1.746-.896.126.007.243.025.348.048.062-.172.142-.38.238-.608.261-.619.658-1.419 1.187-2.069 2.176-2.67 6.18-6.206 9.117-8.104a.5.5 0 0 1 .596.04z" />
                    </svg>
                    <p style="color: white; font-weight: bold;">ESCOBILLAS LIMPIA METÁLICAS 6€ UNIDAD</p>
                </div>
                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="30" fill="currentColor"
                         class="bi bi-clock-fill" viewBox="0 0 16 16">
                    <path style="background-color: white; color:white;"
                          d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z" />
                    </svg>
                    <p style="color: white; font-weight: bold;">ACEPTACIÓN DE ENCARGOS 24H</p>
                </div>
                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="30" fill="currentColor"
                         class="bi bi-car-front-fill" viewBox="0 0 16 16">
                    <path style="background-color: white; color:white;"
                          d="M2.52 3.515A2.5 2.5 0 0 1 4.82 2h6.362c1 0 1.904.596 2.298 1.515l.792 1.848c.075.175.21.319.38.404.5.25.855.715.965 1.262l.335 1.679c.033.161.049.325.049.49v.413c0 .814-.39 1.543-1 1.997V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.338c-1.292.048-2.745.088-4 .088s-2.708-.04-4-.088V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.892c-.61-.454-1-1.183-1-1.997v-.413a2.5 2.5 0 0 1 .049-.49l.335-1.68c.11-.546.465-1.012.964-1.261a.807.807 0 0 0 .381-.404l.792-1.848ZM3 10a1 1 0 1 0 0-2 1 1 0 0 0 0 2Zm10 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2ZM6 8a1 1 0 0 0 0 2h4a1 1 0 1 0 0-2H6ZM2.906 5.189a.51.51 0 0 0 .497.731c.91-.073 3.35-.17 4.597-.17 1.247 0 3.688.097 4.597.17a.51.51 0 0 0 .497-.731l-.956-1.913A.5.5 0 0 0 11.691 3H4.309a.5.5 0 0 0-.447.276L2.906 5.19Z" />
                    </svg>
                    <p style="color: white; font-weight: bold;">LACADO DE FAROS 15€/ud.</p>
                </div>
                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="30" fill="currentColor"
                         class="bi bi-arrow-repeat" viewBox="0 0 16 16">
                    <path style="background-color: white; color:white;"
                          d="M11.534 7h3.932a.25.25 0 0 1 .192.41l-1.966 2.36a.25.25 0 0 1-.384 0l-1.966-2.36a.25.25 0 0 1 .192-.41zm-11 2h3.932a.25.25 0 0 0 .192-.41L2.692 6.23a.25.25 0 0 0-.384 0L.342 8.59A.25.25 0 0 0 .534 9z" />
                    <path style="background-color: white; color:white;" fill-rule="evenodd"
                          d="M8 3c-1.552 0-2.94.707-3.857 1.818a.5.5 0 1 1-.771-.636A6.002 6.002 0 0 1 13.917 7H12.9A5.002 5.002 0 0 0 8 3zM3.1 9a5.002 5.002 0 0 0 8.757 2.182.5.5 0 1 1 .771.636A6.002 6.002 0 0 1 2.083 9H3.1z" />
                    </svg>
                    <p style="color: white; font-weight: bold;">SERVICIO DE NEUMÁTICOS</p>
                </div>
                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="30" fill="currentColor"
                         class="bi bi-droplet-fill" viewBox="0 0 16 16">
                    <path style="background-color: white; color:white;"
                          d="M8 16a6 6 0 0 0 6-6c0-1.655-1.122-2.904-2.432-4.362C10.254 4.176 8.75 2.503 8 0c0 0-6 5.686-6 10a6 6 0 0 0 6 6ZM6.646 4.646l.708.708c-.29.29-1.128 1.311-1.907 2.87l-.894-.448c.82-1.641 1.717-2.753 2.093-3.13Z" />
                    </svg>
                    <p style="color: white; font-weight: bold;">CAMBIO DE ACEITE Y FILTRO 10W40 POR SOLO 39,99€ <br /></p>
                </div>
            </div>
        </div>
        <!--/Fin ofertas-->

        <!-- Quienes Somos -->

        <section id="quienesSomos" class="about-section mb-5">
            <div class="container">
                <div class="row">                
                    <div class="content-column col-lg-6 col-md-12 col-sm-12 order-2">
                        <div class="inner-column">
                            <div class="sec-title">
                                <span class="title" style="color: #cc0000;"><strong>Sobre Nosotros</strong></span>
                                <h2 style="color: white;">Más de 20 años de trayectoria</h2>
                            </div>
                            <div class="text">Desde hace más de dos décadas, el taller <span style="color: #cc0000;"><strong>Naviauto</strong></span> ha sido un faro de excelencia y dedicación en la comunidad. Inaugurado en el albor de los años 2000, este taller ha demostrado un compromiso inquebrantable con la <span style="color:white;"><strong>calidad y la atención personalizada.</strong></span></div>
                            <div class="text">
                                Los clientes, tanto <span style="color:white;"><strong>habituales como nuevos</strong></span>, han encontrado un lugar de confianza donde los detalles y la meticulosidad son la norma. <span style="color:white;"><br/><strong>La solidez y la experiencia</strong></span> que ha acumulado a lo largo de estos años lo convierten en un referente indiscutido, siendo fuente de inspiración y modelo a seguir para las generaciones futuras de artesanos y emprendedores.
                            </div>
                            <div class="btn-box">
                                <a href="Contacto" class="theme-btn btn-danger">Contáctanos</a>
                            </div>
                        </div>
                    </div>

                    <!-- Image Column -->
                    <div class="image-column col-lg-6 col-md-12 col-sm-12" style="border: 0px;">
                        <div style="border: 0px;">
                            <figure class="image-1"><a href="PaginaInicio" class="lightbox-image" data-fancybox="images"><img class="imgQuienesSomos" title="Rahul Kumar Yadav" src="resources/img/slider5.jpg " alt=""></a></figure><br/>
                            <figure class="image-1"><a href="PaginaInicio" class="lightbox-image" data-fancybox="images"><img class="imgQuienesSomos" title="Rahul Kumar Yadav" src="resources/img/slider4.jpg " alt=""></a></figure>
                        </div>
                    </div>  
                </div>
        </section>

        <!-- Fin Quienes somos -->


        <!-- Banner -->
        <div style="background-color: #cc0000; opacity: 0.8; height: 30%; margin-bottom: 0px;" class="text-center w-100">
            <h3 style="padding: 5%; color: #fff; font-weight: bold;">
                LA EXIGENCIA Y LA CALIDAD DE NUESTRO SERVICIO ES LO QUE NOS CONVIERTEN EN EL TALLER DE REFERENCIA DE NUESTROS CLIENTES. OFRECIENDO PIEZAS DE REPUESTO DE ALTA CALIDAD, REPARACIONES A PRECIOS EXCLUSIVOS Y UN TRATO EXCELENTE POR PARTE DE NUESTROS PROFESIONALES.
                <br/><br/>
                PARA QUE SU VEHÍCULO ESTÉ EN PERFECTAS CONDICIONES LE OFRECEMOS, ADEMÁS DE REPARACIONES, REVISIONES Y MANTENIMIENTOS PARA TODAS LAS MARCAS.
            </h3>
        </div>
        <!-- Fin Banner -->


        <!--Import del footer -->
        <jsp:include page="footer.jsp" />


    </body>

</html>