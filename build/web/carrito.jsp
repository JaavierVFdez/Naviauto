<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Naviauto - Carrito</title>

        <!-- Añadimos el head -->
        <jsp:include page="head.jsp" />
    </head>
    <body>
        <!--Javascript-->
        <script src="resources/bootstrap-5.0.2-dist/js/bootstrap.bundle.js"></script>

        <style>
            input::-webkit-inner-spin-button,
            input::-webkit-outer-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }

            input[type="number"] {
                -moz-appearance: textfield;
            }
        </style>

        <c:choose>
            <c:when test = "${comprado}">
                <script>
                    toastr["success"]("Compra realizada con éxito.\n\
                Puedes hacer un seguimiendo del pedido en Perfil > Mis pedidos.", {"closeButton": false,
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

        <!-- Contenido principal -->
        <section class="h-100 h-custom" style="background-color: #eee;">

            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <h3 class="text-center w-100 mb-5" style="color: #dc3545;"><strong>Carrito de compra</strong></h3>
                    <div class="col">
                        <div class="card">
                            <div class="card-body p-4">
                                <form method="post" action="HacerPedido">
                                    <div class="row">

                                        <div class="col-lg-6">
                                            <h5 class="mb-3">
                                                <strong>Productos</strong>
                                            </h5>
                                            <hr>

                                            <c:choose>
                                                <c:when test="${fn:length(carritos) > 0}">
                                                    <c:forEach items="${carritos}" var="carrito">
                                                        <div class="card mb-3">
                                                            <div class="card-body">
                                                                <div class="d-flex justify-content-between">
                                                                    <div class="d-flex flex-row align-items-center">
                                                                        <div style="margin-right: 1em;">
                                                                            <img
                                                                                src="<c:out value="${carrito.url_producto}"/>"
                                                                                class="img-fluid rounded-3" alt="Shopping item" style="width: 105px; height: 85px;">
                                                                        </div>
                                                                        <div class="ms-3">
                                                                            <h5><c:out value="${carrito.nombre_producto}"/></h5>
                                                                        </div>
                                                                    </div>
                                                                    <div class="d-flex flex-row align-items-center">
                                                                        <div style="width: 50px;">
                                                                            <h5 class="fw-normal mb-0"><c:out value="${carrito.cantidad}"/></h5>
                                                                        </div>
                                                                        <div style="width: 80px;">
                                                                            <h5 class="mb-0"><c:out value="${carrito.precio}"/>€</h5>
                                                                        </div>
                                                                        <a href="BorrarProductoCarrito">
                                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                                                            <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/>
                                                                            </svg>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <c:set var="precio_total" value="${precio_total + carrito.precio}" />
                                                    </c:forEach>
                                                    <c:set var="iva" value="${precio_total * 0.21}" />
                                                    <c:set var="precio_iva" value="${precio_total + iva}" />
                                                </div>

                                                <div class="col-lg-6">
                                                    <div class="card bg-dark text-white rounded-3 mb-4">
                                                        <div class="card-body">
                                                            <div class="d-flex justify-content-between align-items-center mb-4">
                                                                <h5 class="mb-0"><strong>Detalles de Facturación</strong></h5>
                                                            </div>

                                                            <div class="row mb-4">
                                                                <div class="col">
                                                                    <div class="form-outline">
                                                                        <input type="text" id="nombre_usuario" name="nombre_usuario" value="${nombre_usuario}" class="form-control" disabled/>
                                                                        <label class="form-label" for="form7Example1">Nombre <p style="display: inline-block" id="errorNombreUsuario"></p></label>
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <div class="form-outline">
                                                                        <input type="text" id="apellido_usuario" name="apellido_usuario" value="${apellido_usuario}" class="form-control" disabled/>
                                                                        <label class="form-label" for="form7Example2">Apellido <p style="display: inline-block" id="errorApellidoUsuario"></p></label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-outline mb-4">
                                                                <textarea type="text" id="direccion_usuario" name="direccion_usuario" value="${direccion_usuario}" placeholder="Especifique su domicilio" class="form-control" maxlength="254" required></textarea>
                                                                <label class="form-label" for="form7Example4">Dirección <p style="display: inline-block" id="errorDireccionUsuario"></p></label>
                                                            </div>
                                                            <div class="form-outline mb-4">
                                                                <input type="email" id="correo_usuario" name="correo_usuario" class="form-control" value="${correo_usuario}" disabled/>
                                                                <label class="form-label" for="form7Example5">Email <p style="display: inline-block" id="errorCorreoUsuario"></p></label>
                                                            </div>
                                                            <div class="form-outline mb-4">
                                                                <input type="number" id="telefono_usuario" name="telefono_usuario" class="form-control" value="${telefono_usuario}"disabled/>
                                                                <label class="form-label" for="form7Example6">Telefono <p style="display: inline-block" id="errorTelefonoUsuario"></p></label>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="card text-white rounded-3" style="background-color: #dc3545;">
                                                        <div class="card-body">
                                                            <div class="d-flex justify-content-between align-items-center mb-4">
                                                                <h5 class="mb-0"><strong>Detalles de la Tarjeta</strong></h5>
                                                            </div>

                                                            <a href="#!" type="submit" class="text-white"><i
                                                                    class="fab fa-cc-mastercard fa-2x me-2"></i></a>
                                                            <a href="#!" type="submit" class="text-white"><i
                                                                    class="fab fa-cc-visa fa-2x me-2"></i></a>
                                                            <a href="#!" type="submit" class="text-white"><i
                                                                    class="fab fa-cc-amex fa-2x me-2"></i></a>
                                                            <a href="#!" type="submit" class="text-white"><i class="fab fa-cc-paypal fa-2x"></i></a>


                                                            <div class="form-outline form-white mb-4">
                                                                <input type="text" id="nombre_titular" class="form-control form-control-lg" siez="17"
                                                                       placeholder="Titular de la tarjeta" autocomplete="off" pattern="[A-Za-z\s]+" required/>
                                                                <label class="form-label" for="nombre_titular">Nombre</label>
                                                            </div>

                                                            <div class="form-outline form-white mb-4">
                                                                <input type="number" id="numero_tarjeta" class="form-control form-control-lg" siez="17"
                                                                       placeholder="1234 5678 9012 3457" autocomplete="off" required/>
                                                                <label class="form-label" for="numero_tarjeta">Número tarjeta</label>
                                                            </div>

                                                            <div class="row mb-4">
                                                                <div class="col-md-6">
                                                                    <div class="form-outline form-white">
                                                                        <input type="date" id="fechaCaducidad" class="form-control form-control-lg"
                                                                               placeholder="MM/YYYY" size="7" id="exp" minlength="7" maxlength="7" autocomplete="off" required/>
                                                                        <label class="form-label" for="fechaCaducidad">Fecha de caducidad</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-outline form-white">
                                                                        <input type="password" id="cvv" class="form-control form-control-lg"
                                                                               placeholder="&#9679;&#9679;&#9679;" size="1" minlength="3" maxlength="3" autocomplete="off" required/>
                                                                        <label class="form-label" for="cvv">CVV</label>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <hr class="my-4">

                                                            <div class="d-flex justify-content-between">
                                                                <p class="mb-2">Total</p>
                                                                <p class="mb-2"><fmt:formatNumber value="${precio_total}" pattern="#.00"/>€</p>
                                                            </div>

                                                            <div class="d-flex justify-content-between">
                                                                <p class="mb-2">Envío</p>
                                                                <p class="mb-2">gratuito</p>
                                                            </div>

                                                            <div class="d-flex justify-content-between mb-4">
                                                                <p class="mb-2">IVA</p>
                                                                <p class="mb-2"><fmt:formatNumber value="${iva}" pattern="#.00"/>€</p>
                                                            </div>

                                                            <div class="d-flex justify-content-between mb-4">
                                                                <p class="mb-2">Total (IVA incluído)</p>
                                                                <p class="mb-2"><fmt:formatNumber value="${precio_iva}" pattern="#.00"/>€</p>
                                                            </div>

                                                            <fmt:setLocale value="en_US" />
                                                            <input type="hidden" name="precio_con_iva" value="<fmt:formatNumber value="${precio_iva}" pattern="#.00"/>"/>
                                                            <input type="submit" id="botonValidarPago" class="btn btn-dark btn-block btn-lg" value="PAGAR"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <h5>La cesta está vacía.</h5>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </form>
                            </div>
                        </div>  
                    </div>
                </div>
            </div>
        </section>
        <!-- Fin contenido principal -->

        <!--Import del footer -->
        <jsp:include page="footer.jsp" />

        <script src="resources/js/validarPago.js"></script>
    </body>
</html>
