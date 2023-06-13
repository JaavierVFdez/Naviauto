<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Naviauto - Panel Administrador Jefe</title>

        <!--Bootstrap-->
        <link rel="stylesheet" href="resources/bootstrap-5.0.2-dist/css/bootstrap.min.css">

        <!-- Estilo personal -->
        <link rel="stylesheet" href="resources/css/styles.css" />
    </head>
    <body>
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

        <!-- Panel -->
        <section style="margin-top: 0px;" class="section-services" id="servicios">
            <div class="container text-center">
                <div class="row justify-content-center text-center">
                    <div class="col-md-10 col-lg-8">
                        <div class="header-section">
                            <h2 class="title">Panel <span>Jefe</span></h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- Inicio servicio -->
                    <div class="col-md-6 col-lg-3">
                        <div class="single-service">
                            <div class="part-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
                                <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7Zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216ZM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z"/>
                                </svg>
                                <h3 class="title">Administrar Trabajadores</h3>
                            </div>
                            <div class="part-2">
                                <p class="description">Añadir, editar o eliminar trabajadores.</p>
                                <a href="AdministrarTrabajadores" class="aService"><i class="fas fa-arrow-circle-right"></i>Acceder</a>
                            </div>
                        </div>
                    </div>
                    <!-- / Fin servicio -->

                    <!-- Inicio servicio -->
                    <div class="col-md-6 col-lg-3">
                        <div class="single-service">
                            <div class="part-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-bag-fill" viewBox="0 0 16 16">
                                <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5z"/>
                                </svg>
                                <h3 class="title">Administrar Productos</h3>
                            </div>
                            <div class="part-2">
                                <p class="description">Añadir, editar o eliminar productos.</p>
                                <a href="Productos" class="aService"><i class="fas fa-arrow-circle-right"></i>Acceder</a>
                            </div>
                        </div>
                    </div>
                    <!-- / Fin servicio -->

                    <!-- Inicio servicio -->
                    <div class="col-md-6 col-lg-3">
                        <div class="single-service">
                            <div class="part-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-tags-fill" viewBox="0 0 16 16">
                                <path d="M2 2a1 1 0 0 1 1-1h4.586a1 1 0 0 1 .707.293l7 7a1 1 0 0 1 0 1.414l-4.586 4.586a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 2 6.586V2zm3.5 4a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
                                <path d="M1.293 7.793A1 1 0 0 1 1 7.086V2a1 1 0 0 0-1 1v4.586a1 1 0 0 0 .293.707l7 7a1 1 0 0 0 1.414 0l.043-.043-7.457-7.457z"/>
                                </svg>
                                <h3 class="title">Administrar Categorías</h3>
                            </div>
                            <div class="part-2">
                                <p class="description">Añadir, eliminar, editar categorías.</p>
                                <a href="Categorias" class="aService"><i class="fas fa-arrow-circle-right"></i>Acceder</a>
                            </div>
                        </div>
                    </div>
                    <!-- / Fin servicio -->

                    <!-- Inicio servicio -->
                    <div class="col-md-6 col-lg-3">
                        <div class="single-service">
                            <div class="part-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-file-earmark-spreadsheet-fill" viewBox="0 0 16 16">
                                <path d="M6 12v-2h3v2H6z"/>
                                <path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0zM9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1zM3 9h10v1h-3v2h3v1h-3v2H9v-2H6v2H5v-2H3v-1h2v-2H3V9z"/>
                                </svg>
                                <h3 class="title">Administrar Pedidos</h3>
                            </div>
                            <div class="part-2">
                                <p class="description">Administrar lista completa de pedidos realizado por los clientes.</p>
                                <a href="Pedidos" class="aService"><i class="fas fa-arrow-circle-right"></i>Acceder</a>
                            </div>
                        </div>
                    </div>
                    <!-- / Fin servicio -->

                    <!-- Inicio servicio -->
                    <div class="col-md-6 col-lg-3">
                        <div class="single-service">
                            <div class="part-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
                                     class="bi bi-tools" viewBox="0 0 16 16">
                                <path
                                    d="M1 0 0 1l2.2 3.081a1 1 0 0 0 .815.419h.07a1 1 0 0 1 .708.293l2.675 2.675-2.617 2.654A3.003 3.003 0 0 0 0 13a3 3 0 1 0 5.878-.851l2.654-2.617.968.968-.305.914a1 1 0 0 0 .242 1.023l3.27 3.27a.997.997 0 0 0 1.414 0l1.586-1.586a.997.997 0 0 0 0-1.414l-3.27-3.27a1 1 0 0 0-1.023-.242L10.5 9.5l-.96-.96 2.68-2.643A3.005 3.005 0 0 0 16 3c0-.269-.035-.53-.102-.777l-2.14 2.141L12 4l-.364-1.757L13.777.102a3 3 0 0 0-3.675 3.68L7.462 6.46 4.793 3.793a1 1 0 0 1-.293-.707v-.071a1 1 0 0 0-.419-.814L1 0Zm9.646 10.646a.5.5 0 0 1 .708 0l2.914 2.915a.5.5 0 0 1-.707.707l-2.915-2.914a.5.5 0 0 1 0-.708ZM3 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026L3 11Z" />
                                </svg>
                                <h3 class="title">Administrar Reparaciones</h3>
                            </div>
                            <div class="part-2">
                                <p class="description">Administrar lista completa de las reparaciones de los clientes.</p>
                                <a href="Reparaciones" class="aService"><i class="fas fa-arrow-circle-right"></i>Acceder</a>
                            </div>
                        </div>
                    </div>
                    <!-- / Fin servicio -->

                    <!-- Inicio servicio -->
                    <div class="col-md-6 col-lg-3">
                        <div class="single-service">
                            <div class="part-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-gear-wide-connected" viewBox="0 0 16 16">
                                <path d="M7.068.727c.243-.97 1.62-.97 1.864 0l.071.286a.96.96 0 0 0 1.622.434l.205-.211c.695-.719 1.888-.03 1.613.931l-.08.284a.96.96 0 0 0 1.187 1.187l.283-.081c.96-.275 1.65.918.931 1.613l-.211.205a.96.96 0 0 0 .434 1.622l.286.071c.97.243.97 1.62 0 1.864l-.286.071a.96.96 0 0 0-.434 1.622l.211.205c.719.695.03 1.888-.931 1.613l-.284-.08a.96.96 0 0 0-1.187 1.187l.081.283c.275.96-.918 1.65-1.613.931l-.205-.211a.96.96 0 0 0-1.622.434l-.071.286c-.243.97-1.62.97-1.864 0l-.071-.286a.96.96 0 0 0-1.622-.434l-.205.211c-.695.719-1.888.03-1.613-.931l.08-.284a.96.96 0 0 0-1.186-1.187l-.284.081c-.96.275-1.65-.918-.931-1.613l.211-.205a.96.96 0 0 0-.434-1.622l-.286-.071c-.97-.243-.97-1.62 0-1.864l.286-.071a.96.96 0 0 0 .434-1.622l-.211-.205c-.719-.695-.03-1.888.931-1.613l.284.08a.96.96 0 0 0 1.187-1.186l-.081-.284c-.275-.96.918-1.65 1.613-.931l.205.211a.96.96 0 0 0 1.622-.434l.071-.286zM12.973 8.5H8.25l-2.834 3.779A4.998 4.998 0 0 0 12.973 8.5zm0-1a4.998 4.998 0 0 0-7.557-3.779l2.834 3.78h4.723zM5.048 3.967c-.03.021-.058.043-.087.065l.087-.065zm-.431.355A4.984 4.984 0 0 0 3.002 8c0 1.455.622 2.765 1.615 3.678L7.375 8 4.617 4.322zm.344 7.646.087.065-.087-.065z"/>
                                </svg>
                                <h3 class="title">Administrar Piezas</h3>
                            </div>
                            <div class="part-2">
                                <p class="description">Administrar lista completa de las piezas.</p>
                                <a href="Piezas" class="aService"><i class="fas fa-arrow-circle-right"></i>Acceder</a>
                            </div>
                        </div>
                    </div>
                    <!-- / Fin servicio -->

                    <!-- Inicio servicio -->
                    <div class="col-md-6 col-lg-3">
                        <div class="single-service">
                            <div class="part-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-car-front-fill" viewBox="0 0 16 16">
                                <path d="M2.52 3.515A2.5 2.5 0 0 1 4.82 2h6.362c1 0 1.904.596 2.298 1.515l.792 1.848c.075.175.21.319.38.404.5.25.855.715.965 1.262l.335 1.679c.033.161.049.325.049.49v.413c0 .814-.39 1.543-1 1.997V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.338c-1.292.048-2.745.088-4 .088s-2.708-.04-4-.088V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.892c-.61-.454-1-1.183-1-1.997v-.413a2.5 2.5 0 0 1 .049-.49l.335-1.68c.11-.546.465-1.012.964-1.261a.807.807 0 0 0 .381-.404l.792-1.848ZM3 10a1 1 0 1 0 0-2 1 1 0 0 0 0 2Zm10 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2ZM6 8a1 1 0 0 0 0 2h4a1 1 0 1 0 0-2H6ZM2.906 5.189a.51.51 0 0 0 .497.731c.91-.073 3.35-.17 4.597-.17 1.247 0 3.688.097 4.597.17a.51.51 0 0 0 .497-.731l-.956-1.913A.5.5 0 0 0 11.691 3H4.309a.5.5 0 0 0-.447.276L2.906 5.19Z"/>
                                </svg>
                                <h3 class="title">Administrar Vehículos</h3>
                            </div>
                            <div class="part-2">
                                <p class="description">Administrar lista completa de los vehículos de los clientes.</p>
                                <a href="Vehiculos" class="aService"><i class="fas fa-arrow-circle-right"></i>Acceder</a>
                            </div>
                        </div>
                    </div>
                    <!-- / Fin servicio -->
                    <!-- Inicio servicio -->
                    <div class="col-md-6 col-lg-3">
                        <div class="single-service">
                            <div class="part-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chat-dots-fill" viewBox="0 0 16 16">
                                <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
                                </svg>
                                <h3 class="title">Administrar Soporte</h3>
                            </div>
                            <div class="part-2">
                                <p class="description">Administrar mensajes de soporte enviados por el cliente.</p>
                                <a href="Soporte" class="aService"><i class="fas fa-arrow-circle-right"></i>Acceder</a>
                            </div>
                        </div>
                    </div>
                    <!-- / Fin servicio -->
                </div>
            </div>
        </section>
        <!--Fin Seccion servicio-->
        <!-- -->
    </body>
</html>
