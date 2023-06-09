<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Naviauto - Consultar Pedido</title>
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
        <!-- Contenido principal -->
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2><a class="aMenu" style="color: white; text-decoration: none; margin-right: 1em;" href="Pedidos"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-90deg-left" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M1.146 4.854a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H12.5A2.5 2.5 0 0 1 15 6.5v8a.5.5 0 0 1-1 0v-8A1.5 1.5 0 0 0 12.5 5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4z"/>
                                        </svg></a><b>Detalles del pedido</b></h2>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover text-center">
                        <c:set var="totalPrecio" value="0" />

                        <c:forEach var="detallePedido" items="${detallesPedidos}" varStatus="loop">
                            <c:set var="producto" value="${productos[loop.index]}" />

                            <!-- Sumar el precio de este detalle al total -->
                            <c:set var="totalPrecio" value="${totalPrecio + (detallePedido.precio * detallePedido.cantidad)}" />

                            <tr>
                                <td style="width: 300px;"><img src="${producto.url}" class="img-fluid rounded-3" alt="Shopping item" style="width: 200px; height: 170px;"></td>
                                <td><h5>${producto.nombre}</h5></td>
                                <td><h5 class="fw-normal mb-0">${detallePedido.cantidad} ud/s.</h5></td>
                                <td><h5 class="mb-0">${detallePedido.precio}€</h5></td>
                            </tr>
                        </c:forEach>

                        <!-- Mostrar el precio total formateado con dos decimales -->
                        <tr>
                            <td colspan="3" style="text-align: right;"><h5><strong>Total:</strong></h5></td>
                            <td><h5><strong>${precio_total} €</strong></h5></td>
                        </tr>
                    </table>
                </div>
            </div>        
        </div>
        <!-- Fin contenido principal -->
    </body>
</html>
