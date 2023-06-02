<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Naviauto - Administrar Trabajadores</title>

        <!--Bootstrap-->
        <link rel="stylesheet" href="resources/bootstrap-5.0.2-dist/css/bootstrap.min.css">

        <!-- Estilo personal -->
        <link rel="stylesheet" href="resources/css/styles.css" />

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script src="../../resources/js/validarEditarTrabajador.js"></script>

    </head>
    <body id="bodyAdmin">
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

        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2><b>Administrar Empleados</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Añadir Empleado</span></a>						
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>DNI</th>
                                <th>TELEFONO</th>
                                <th>EMAIL</th>
                                <th>NOMBRE</th>
                                <th>APELLIDO</th>
                                <th>TIPO USUARIO</th>
                                <th>ACCIÓN</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${empleados}" var="empleado">

                                <tr>
                            <form method="post" action="EditarEmpleado">
                                <input type="hidden" name="dni" value="<c:out value="${empleado.dni}" />"/>
                                <input type="hidden" name="telefono" value="<c:out value="${empleado.telefono}" />"/>
                                <input type="hidden" name="email" value="<c:out value="${empleado.email}" />"/>
                                <input type="hidden" name="nombre" value="<c:out value="${empleado.nombre}" />"/>
                                <input type="hidden" name="apellido" value="<c:out value="${empleado.apellido}" />"/>
                                <input type="hidden" name="tipoUsuario" value="<c:out value="${empleado.tipoUsuario}" />"/>

                                <td><c:out value="${empleado.dni}" /></td>
                                <td><c:out value="${empleado.telefono}"/></td>
                                <td><c:out value="${empleado.email}" /></td>
                                <td><c:out value="${empleado.nombre}" /></td>
                                <td><c:out value="${empleado.apellido}" /></td>
                                <td><c:out value="${empleado.tipoUsuario}" /></td>
                                <td>
                                    <input type="submit" value="Editar" class="edit" style="width: 100%;">
                                    <input type="submit" value="Eliminar" class="edit" style="width: 100%;">
                                </td>
                            </form>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div>
                        <h6>
                            <a class="aMenu" style="color: black; text-decoration: none;" href="PanelJefe">Volver atrás</a>
                        </h6>
                    </div>
                </div>
            </div>        
        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="post" action="addEmpleado">
                        <div class="modal-header">						
                            <h4 class="modal-title">Añadir Empleado</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>DNI</label>
                                <input type="text" id="dniTrabajadorA" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Teléfono</label>
                                <input type="text" class="form-control" id="telefonoTrabajadorA" required>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="text" id="emailTrabajadorA" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Nombre</label>
                                <input type="text" id="nombreTrabajadorA" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Apellido</label>
                                <input type="email" id="apellidoTrabajadorA" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Tipo de Usuario</label>
                                <select required>
                                    <option disabled>--Seleccionar--</option>
                                    <option value="admin" selected>Administrador</option>
                                    <option value="jefe">Jefe</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                            <input type="submit" class="btn btn-success" value="Añadir">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="post" action="EditarTrabajador">
                        <div class="modal-header">						
                            <h4 class="modal-title">Editar Empleado</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>DNI <p id="errorDNI"></p></label>
                                <input type="text" id="dniTrabajadorE" name="dni" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Teléfono <p id="errorTelefono"></p></label>
                                <input type="text" id="telefonoTrabajadorE" name="telefono" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Email <p id="errorCorreo"></p></label>
                                <input type="text" id="emailTrabajadorE" name="email" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Nombre <p id="errorNombre"></p></label>
                                <input type="text" id="nombreTrabajadorE" name="nombre" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Apellido <p id="errorApellido"></p></label>
                                <input type="text" id="apellidoTrabajadorE" name="apellido" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Tipo de Usuario</label>
                                <select>
                                    <option disabled>--Seleccionar--</option>
                                    <option value="admin" selected>Administrador</option>
                                    <option value="jefe">Jefe</option>
                                </select>
                            </div>					
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" onclick="validarEditarTrabajador()" id="editarTrabajador" class="btn btn-info" value="Editar">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Delete Modal HTML -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Eliminar Empleado</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>aa</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>


    </body>
</html>
