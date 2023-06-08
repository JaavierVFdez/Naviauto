/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dao;

import bd.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import modelo.entidad.Producto;
import modelo.entidad.Reparacion;

/**
 *
 * @author javie
 */
public class ReparacionDAO {

    private Connection conexion;

    public ReparacionDAO() {
        this.conexion = new Conexion().getConexion();
    }

    /**
     * ********************************
     *
     * PUBLIC METHODS
     *
     */
    //Funcion para obtener todas las reparaciones para el admin/jefe
    public List<Reparacion> obtenerReparaciones() {
        List<Reparacion> reparaciones = new ArrayList();

        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM reparaciones;");
            ResultSet resultSet = ps.executeQuery();
            int codigo_reparacion = 0;
            String matricula = "";
            String descripcion = "";
            Date fechaEntrada = null;
            Date fechaFinalizacion = null;
            String estado = "";
            float precio = 0;

            while (resultSet.next()) {

                //Almacenamos los datos
                codigo_reparacion = resultSet.getInt("codigo_reparacion");
                matricula = resultSet.getString("matricula");
                descripcion = resultSet.getString("descripcion");
                fechaEntrada = resultSet.getDate("fechaEntrada");
                fechaFinalizacion = resultSet.getDate("fechaFinalizacion");
                estado = resultSet.getString("estado");
                precio = resultSet.getFloat("precio");

                Reparacion reparacion = new Reparacion(codigo_reparacion, matricula, descripcion, fechaEntrada, fechaFinalizacion, estado, precio);
                reparaciones.add(reparacion);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reparaciones;
    }

    //Funcion para obtener las reparaciones del usuario en cuestion
    public List<Reparacion> obtenerReparacionesUsuario(String dni) {
        List<Reparacion> reparaciones = new ArrayList();
        VehiculoDAO vehiculoDao = new VehiculoDAO();

        String matriculaUsuario = vehiculoDao.obtenerMatriculaUsuario(dni);

        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM reparaciones where matricula = '" + matriculaUsuario + "';");
            ResultSet resultSet = ps.executeQuery();

            int codigo_reparacion = 0;
            String matricula = "";
            String descripcion = "";
            Date fechaEntrada = null;
            Date fechaFinalizacion = null;
            String estado = "";
            float precio = 0;

            while (resultSet.next()) {

                //Almacenamos los datos
                codigo_reparacion = resultSet.getInt("codigo_reparacion");
                matricula = resultSet.getString("matricula");
                descripcion = resultSet.getString("descripcion");
                fechaEntrada = resultSet.getDate("fechaEntrada");
                fechaFinalizacion = resultSet.getDate("fechaFinalizacion");
                estado = resultSet.getString("estado");
                precio = resultSet.getFloat("precio");

                Reparacion reparacion = new Reparacion(codigo_reparacion, matricula, descripcion, fechaEntrada, fechaFinalizacion, estado, precio);
                reparaciones.add(reparacion);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reparaciones;
    }

    //Funcion para añadir una nueva reparacion
    public void addReparacion(String matricula, String descripcion, String fechaEntrada, String estado, float precio) {

        System.out.println("asdhasudhasduayhsduyasd" + fechaEntrada);
        System.out.println("estado");

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("INSERT into reparaciones (matricula, descripcion, fechaEntrada, estado, precio)"
                    + "VALUES('" + matricula + "', '" + descripcion + "', '" + fechaEntrada + "' , '" + estado + "', " + precio + ");");

            int executeUpdate = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Funcion para añadir una nueva reparacion
    public void addReparacionConFechaFinalizacion(String matricula, String descripcion, String fechaEntrada, String fechaFinalizacion, String estado, float precio) {
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("INSERT into reparaciones (matricula, descripcion, fechaEntrada, fechaFinalizacion, estado, precio)"
                    + "VALUES('" + matricula + "', '" + descripcion + "', '" + fechaEntrada + "', '" + fechaFinalizacion + "', '" + estado + "', " + precio + ");");

            int executeUpdate = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Funcion para editar una reparacion
    public void editarReparacionConFechaFinalizacion(int codigo_reparacion, String matricula, String descripcion, String fechaEntrada, String fechaFinalizacion, String estado, float precio) {
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("UPDATE reparaciones SET matricula = '" + matricula + "', descripcion = '" + descripcion + "', fechaEntrada = '" + fechaEntrada + "', fechaFinalizacion = '" + fechaFinalizacion + "', estado = '" + estado + "', precio = " + precio + " WHERE codigo_reparacion = " + codigo_reparacion + ";");

            int executeUpdate = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Funcion para editar una reparacion
    public void editarReparacion(int codigo_reparacion, String matricula, String descripcion, String fechaEntrada, String estado, float precio) {

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("UPDATE reparaciones SET matricula = '" + matricula + "', descripcion = '" + descripcion + "', fechaEntrada = '" + fechaEntrada + "', estado = '" + estado + "', precio = " + precio + " WHERE codigo_reparacion = " + codigo_reparacion + ";");

            int executeUpdate = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Funcion para eliminar una reparacion
    public void eliminarReparacion(int codigo_reparacion) {
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("DELETE from reparaciones where codigo_reparacion like " + codigo_reparacion + ";");
            int rows = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Funcion para comprobar si el codigo de reparacion existe
    public boolean codigoReparacionExiste(int codigo_reparacion) {
        boolean reparacionExiste = false;

        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM reparaciones WHERE codigo_reparacion = " + codigo_reparacion + ";");
            ResultSet resultSet = ps.executeQuery();

            if (resultSet.next()) {
                reparacionExiste = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reparacionExiste;
    }

    public void cerrarConexion() {
        try {
            conexion.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
