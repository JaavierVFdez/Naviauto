<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Naviauto - Administrar Trabajadores</title>

        <!--Bootstrap-->
        <link rel="stylesheet" href="resources/bootstrap-5.0.2-dist/css/bootstrap.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
    <body>
        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div>   
                <div class="modal-content">
                    <form method="post" action="EditarTrabajador">
                        <div class="modal-header">						
                            <h4 class="modal-title">Editar Empleado</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>DNI <p id="errorDNI"></p></label>
                                <input type="text" id="dniTrabajadorE" name="dni" value="<c:out value="${dni}" />" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Teléfono <p id="errorTelefono"></p></label>
                                <input type="text" id="telefonoTrabajadorE" name="telefono" valuevalue="<c:out value="${telefono}" /> class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Email <p id="errorCorreo"></p></label>
                                <input type="text" id="emailTrabajadorE" name="email" value="value="<c:out value="${emails}" />" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Nombre <p id="errorNombre"></p></label>
                                <input type="text" id="nombreTrabajadorE" name="nombre" value="value="<c:out value="${nombre}" />" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Apellido <p id="errorApellido"></p></label>
                                <input type="text" id="apellidoTrabajadorE" name="apellido" value="value="<c:out value="${apellido}" />" class="form-control">
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
    </body>
</html>
