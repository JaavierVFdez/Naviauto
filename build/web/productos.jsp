<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Naviauto - Productos</title>

        <!-- Añadimos el head -->
        <jsp:include page="head.jsp" />
    </head>
    <body>
        <!--Javascript-->
        <script src="resources/bootstrap-5.0.2-dist/js/bootstrap.bundle.js"></script>

        <c:choose>
            <c:when test = "${productoAdded}">
                <script>
                    toastr["success"]("${mensajeCarrito}", {"closeButton": false,
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

            <c:when test = "${!productoAdded}">
                <script>
                    toastr["error"]("${mensajeCarrito}", {"closeButton": false,
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

            <c:when test = "${noLog != null}">
                <script>
                    toastr["error"]("${noLogado}", {"closeButton": false,
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
                <a href="index.jsp" id="a1" class="amenu">Inicio</a>
                <a href="#quienesSomos" id="a2" class="amenu">Quienes Somos</a>
                <a href="servicios.jsp" id="a3" class="amenu">Servicios</a>
                <a href="Productos" id="a3" class="amenu">Productos</a>
                <a href="contacto.jsp" id="a4" class="amenu">Contacto</a>
            </div>
        </nav>
        <!--Fin menu-->


        <!-- Contenido principal -->

        <section id="title_enroll">
            <div class="p-5 bg-primary text-white rounded" id="bannerProductos">

                <div class="container-fluid" id="bannerProductos2">
                    <h1 id="titutloBot"><strong></strong></h1>
                    <button class="btn btn-danger">Explorar</button>
                </div>
            </div>
        </section>

        <section>
            <div class="container text-center">
                <div class="row justify-content-center text-center">
                    <div class="col-md-10 col-lg-8">
                        <div class="header-section">
                            <h2 class="title">Nuestros <span>Productos</span></h2>
                        </div>  
                    </div>
                </div>

                <div id="contenedorProductos" class="d-flex justify-content-center flex-wrap gap-15 w-100 pb-4 mb-4">

                    <c:forEach items="${productos}" var="producto">
                        <form method="post" action="AddCarrito" style="text-align: center;">

                            <div class="card text-black" style="width: 15rem; margin-left: 1em; height: 29rem; margin-bottom: 1em; border: none;">
                                <img src="<c:out value="${producto.url}"/>" class="card-img" alt="..." height="200px">
                                <div class="card-body">
                                    <h5 class="card-title"><strong><c:out value="${producto.nombre}"/></strong></h5>
                                    <p class="card-text"><c:out value="${producto.descripcion}"/></p>

                                    <input type="hidden" name="codigoProducto" value="<c:out value="${producto.id_producto}"/>"/>
                                    <input type="hidden" name="nombreProducto" value="<c:out value="${producto.nombre}"/>"/>
                                    <input type="hidden" name="descripcionProducto" value="<c:out value="${producto.descripcion}"/>"/>
                                    <input type="hidden" name="categoria" value="<c:out value="${producto.categoria}"/>"/>
                                    <input type="hidden" name="url" value="<c:out value="${producto.url}"/>"/>
                                    <input type="hidden" name="precio" value="<c:out value="${producto.precio}"/>"/>
                                    <input type="hidden" name="stock" value="<c:out value="${producto.stock}"/>"/>
                                    <h5><strong><c:out value="${producto.precio}"/> €</strong></h5>
                                    <p class="card-text"><input class="btn btn-danger" type="submit" value="Añadir al carrito"></p>
                                </div>
                            </div>
                        </form>
                    </c:forEach>
                </div>
            </div>

            <div id="ambientador">
                <div class="header-section">
                    <h2 class="title">Nuestros <span>Productos</span></h2>
                </div>  
            </div>  
        </section>
        <!-- Fin Contenido principal -->


        <!--Import del footer -->
        <jsp:include page="footer.jsp" />
    </body>
</html>
