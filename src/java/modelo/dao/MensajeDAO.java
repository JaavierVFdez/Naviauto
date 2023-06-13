/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dao;

import bd.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.entidad.Mensaje;

/**
 *
 * @author javie
 */
public class MensajeDAO {

    private Connection conexion;

    public MensajeDAO() {
        this.conexion = new Conexion().getConexion();
    }

    /**
     * ********************************
     *
     * PUBLIC METHODS
     *
     */
    //Método para almacenar los mensajes de los usuarios
    public boolean addMensaje(String nombre, String apellido, String correo, String asunto, String mensaje) {
        boolean mensajeAdded = false;

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("INSERT into Mensajes (nombre, apellido, correo, asunto, mensaje, estado)"
                    + "VALUES('" + nombre + "','" + apellido + "','" + correo + "','" + asunto + "','" + mensaje + "', 'pendiente');");

            int executeUpdate = ps.executeUpdate();
            mensajeAdded = true;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return mensajeAdded;
    }

    //Funcion para obtener los mensajes
    public List<Mensaje> obtenerMensajes() {
        List<Mensaje> mensajes = new ArrayList();

        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * from mensajes;");
            ResultSet rs = ps.executeQuery();

            int codigo_mensaje = 0;
            String nombre = "";
            String apellido = "";
            String correo = "";
            String asunto = "";
            String mensaje = "";
            String respuesta = "";
            String estado = "";

            while (rs.next()) {

                //Almacenamos los datos
                codigo_mensaje = rs.getInt("codigo_mensaje");
                nombre = rs.getString("nombre");
                apellido = rs.getString("apellido");
                correo = rs.getString("correo");
                asunto = rs.getString("asunto");
                mensaje = rs.getString("mensaje");
                respuesta = rs.getString("respuesta");
                estado = rs.getString("estado");

                Mensaje mens = new Mensaje(codigo_mensaje, nombre, apellido, correo, asunto, mensaje, respuesta, estado);
                mensajes.add(mens);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return mensajes;
    }

    //Funcion para actualizar la respuesta del usuario
    public void actualizarRepuesta(int codigo_mensaje, String respuesta) {
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("UPDATE mensajes set estado = 'resuelto', respuesta = '" + respuesta + "' WHERE codigo_mensaje = " + codigo_mensaje + ";");

            int executeUpdate = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void cerrarConexion() {
        try {
            conexion.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
