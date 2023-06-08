<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Naviauto - Panel Administrador</title>

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

        <!-- Panel -->
        <section style="margin-top: 0px;" class="section-services" id="servicios">
            <div class="container text-center">
                <div class="row justify-content-center text-center">
                    <div class="col-md-10 col-lg-8">
                        <div class="header-section">
                            <h2 class="title">Panel <span>Administrador</span></h2>
                        </div>
                    </div>
                </div>
                <div class="row">
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
                                <a href="AdministrarProductos" class="aService"><i class="fas fa-arrow-circle-right"></i>Acceder</a>
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
                                <a href="AdministrarPedidos" class="aService"><i class="fas fa-arrow-circle-right"></i>Acceder</a>
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
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chat-left-text-fill" viewBox="0 0 16 16">
                                <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H4.414a1 1 0 0 0-.707.293L.854 15.146A.5.5 0 0 1 0 14.793V2zm3.5 1a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9zm0 2.5a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9zm0 2.5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5z"/>
                                </svg>
                                <h3 class="title">Administrar Mensajes Soporte</h3>
                            </div>
                            <div class="part-2">
                                <p class="description">Administrar mensajes soporte enviadas por los usuarios.</p>
                                <a href="AdministrarPedidos" class="aService"><i class="fas fa-arrow-circle-right"></i>Acceder</a>
                            </div>
                        </div>
                    </div>
                    <!-- / Fin servicio -->
                </div>
            </div>
        </section>
        <!--Fin Seccion servicio-->
    </body>
</html>
