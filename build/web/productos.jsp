<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
            <c:when test = "${productoAdded && mensajeCarrito != null && !empty mensajeCarrito}">
                <script>
                    toastr["success"]("${mensajeCarrito}", {
                        "closeButton": false,
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

            <c:when test = "${!productoAdded && mensajeCarrito != null && !empty mensajeCarrito}">
                <script>
                    toastr["error"]("${mensajeCarrito}", {"closeButton": false,
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

            <c:when test = "${noLog != null && noLogado != null && !empty noLogado}">
                <script>
                    toastr["error"]("${noLogado}", {"closeButton": false,
                            "debug": false,
                            "newestOnTop": false,
                            "progressBar": false,
                            "positionClass": "toast-top-left",
                            "preventDuplicates": false,
                            "onclick": null,
                            "showDuration": "300",
                            "hideDuration": "1000",
                            "timeOut": "5000",
                            "extendedTimeOut": "1000",
                            "showEasing": "swing",
                            "hideEasing": "linear",
                            "showMethod": "fadeIn",
                            "hideMethod": "fadeOut")
                </script>
            </c:when>
        </c:choose>

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

        <!-- Filtro
        <div style="margin-left: 2em;" class="mt-4 mb-4 filtroProductos">
            <h4><strong>Filtros:</strong></h4>
        <c:forEach items="${categorias}" var="categoria">
            <form method="post" action="Productos">
                <input type="hidden" name="${categoria.nombre_categoria}" value="${categoria.nombre_categoria}">
                <input class="aMenu" style="border: 0px solid; background-color: transparent;" type="submit" value="${categoria.nombre_categoria}" />
            </form>
        </c:forEach>
    </div>
    Fin filtro -->
        <br/><br/><br/>
        <!-- Contenido principal -->
        <section class="mb-3 mt-4">
            <div class="container text-center mb">
                <div class="row justify-content-center text-center">
                    <div class="col-md-10 col-lg-8">
                        <div class="header-section">
                            <h2 class="title mb-5 mt-2"><strong>Nuestros</strong> <span style="color: #dc3545;"><strong>Productos</strong></span></h2>
                        </div>  
                    </div>
                </div>

                <div id="contenedorProductos" class="w-100 pb-4 mb-4">
                    <c:forEach items="${productos}" var="producto">
                        <form method="post" action="AddCarrito" style="text-align: center;">

                            <div class="card text-black" style="width: 15rem; background-color: #f8f9fa; margin-left: 4.5em; height: 30rem; margin-bottom: 7em; border: none;">
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
                                    <p class="card-text">
                                        <c:if test="${empty correo}">
                                            <p class="aMenu">Inicia sesión para comprar.</p>
                                        </c:if>
                                        <c:if test="${not empty correo != ''}">
                                            <input class="btn btn-danger" type="submit" value="Añadir al carrito">
                                        </c:if>
                                    </p>
                                </div>
                            </div>
                        </form>
                    </c:forEach>
                </div>
            </div>
        </section>
        <!-- Fin Contenido principal -->


        <!--Import del footer -->
        <jsp:include page="footer.jsp" />
    </body>
</html>
