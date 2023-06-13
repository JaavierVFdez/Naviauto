<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Añadimos el head -->
        <jsp:include page="../../head.jsp" />
    </head>
    <body>
        <!--Javascript-->
        <script src="resources/bootstrap-5.0.2-dist/js/bootstrap.bundle.js"></script>

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

        <!-- Contenido principal -->
        <div class="container bg-light rounded mt-5 mb-5 w-75 text-center">
            <a href="Pedidos" class="aMenu" style="text-decoration: none;">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-left" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
                <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
                </svg>
                Volver atrás
            </a>
            <h4 class="mb-5" style="padding-top: 0.8em;"><strong>Editar Pedido</strong></h4>
            <form method="post" action="PedidoEditado" class="text-center">
                <label>DNI :</label>
                <input class="form-control mb-1" value="${pedido.dni}" readonly type="text" name="dni" id="dni" autocomplete="off" style="width: 50%; text-align: center; display: block; margin: 1rem auto;"/><br/><br/>

                <label>Precio :</label>
                <input class="form-control mb-1" value="${pedido.precio_total}" readonly type="text" name="precio_total" id="precio_total" autocomplete="off" style="width: 50%; text-align: center; display: block; margin: 1rem auto;"/><br/><br/>

                <label>Dirección Envío :</label>
                <input class="form-control mb-1" value="${pedido.direccion_envio}" readonly type="text" name="direccion_envio" id="direccion_envio" autocomplete="off" style="width: 50%; text-align: center; display: block; margin: 1rem auto;"/><br/><br/>

                <label>Estado :</label>
                <select id="estado" name="estado" class="form-control mb-1" style="width: 50%; text-align: center; display: block; margin: 1rem auto;">
                    <option value="pendiente" ${pedido.estado == 'pendiente' ? 'selected' : ''}>Pendiente</option>
                    <option value="en progreso" ${pedido.estado == 'en progreso' ? 'selected' : ''}>En progreso</option>
                    <option value="completada" ${pedido.estado == 'completada' ? 'selected' : ''}>Completada</option>
                    <option value="cancelada" ${pedido.estado == 'cancelada' ? 'selected' : ''}>Cancelada</option>
                    <option value="entregada" ${pedido.estado == 'entregada' ? 'selected' : ''}>Entregada</option>
                </select><br/><br/>
                <input type="hidden" name="id_pedido" value="${pedido.id_pedido}"/>
                <input type="submit" class="btn btn-danger mb-4" name="editarPedido" value="Editar Pedido" id="editarPedido" />
            </form>
    </body>
</html>
