<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Naviauto - Administrar Vehiculos</title>
        <!--Bootstrap-->
        <link rel="stylesheet" href="resources/bootstrap-5.0.2-dist/css/bootstrap.min.css">

        <!-- Estilo personal -->
        <link rel="stylesheet" href="resources/css/styles.css" />
    </head>
    <body>
        <style>
            .dataTables_filter {
                float: right;
            }
        </style>
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
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2><a class="aMenu" style="color: white; text-decoration: none; margin-right: 1em;" href="PanelAdminJefe"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-90deg-left" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M1.146 4.854a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H12.5A2.5 2.5 0 0 1 15 6.5v8a.5.5 0 0 1-1 0v-8A1.5 1.5 0 0 0 12.5 5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4z"/>
                                        </svg></a><b>Administrar Vehículos</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <a href="NuevoVehiculo" class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>Añadir Vehículo</span></a>						
                            </div>
                        </div>
                    </div>
                    <table id="tabla" class="table table-striped table-hover text-center">
                        <thead>
                            <tr>
                                <th>MATRÍCULA</th>
                                <th>DNI CLIENTE</th>
                                <th>MODELO</th>
                                <th>MARCA</th>
                                <th>AÑO VEHÍCULO</th>
                                <th>KILOMETRAJE ACTUAL</th>
                                <th>ACCIÓN</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${vehiculos}" var="vehiculo">
                                <tr>
                                    <td><c:out value="${vehiculo.matricula}"/></td>
                                    <td><c:out value="${vehiculo.dni}"/></td>
                                    <td><c:out value="${vehiculo.modelo}" /></td>
                                    <td><c:out value="${vehiculo.marca}" /></td>
                                    <td><c:out value="${vehiculo.anyoVehiculo}" /></td>
                                    <td><c:out value="${vehiculo.kilometrajeActual}" /> km</td>
                                    <td class="d-flex flex-row" style="padding-top: 50%; padding-bottom: 50%;">
                                        <!-- Formulario de edición -->
                                        <form method="post" action="EditarVehiculo">
                                            <input type="hidden" name="matricula" value="<c:out value="${vehiculo.matricula}"/>" />
                                            <input type="hidden" name="dni" value="<c:out value="${vehiculo.dni}" />"/>
                                            <input type="hidden" name="modelo" value="<c:out value="${vehiculo.modelo}" />"/>
                                            <input type="hidden" name="marca" value="<c:out value="${vehiculo.marca}" />"/>
                                            <input type="hidden" name="anyoVehiculo" value="<c:out value="${vehiculo.anyoVehiculo}" />"/>
                                            <input type="hidden" name="kilometrajeActual" value="<c:out value="${vehiculo.kilometrajeActual}" />"/>
                                            <button type="submit" style="background-color: transparent; border:  0px solid black;"><svg style="color: black;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                                                <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
                                                </svg>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>        
        </div>
        <!-- Fin contenido principal -->

        <!-- Import JS -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>

        <script src="resources/js/dataTable.js"/></script>
</body>
</html>
