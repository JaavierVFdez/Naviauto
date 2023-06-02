/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dao;

import bd.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
            PreparedStatement ps = conexion.prepareStatement("INSERT into Mensajes (nombre, apellido, correo, asunto, mensaje)"
                    + "VALUES('" + nombre + "','" + apellido + "','" + correo + "','" + asunto + "','" + mensaje + "');");

            int executeUpdate = ps.executeUpdate();
            mensajeAdded = true;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return mensajeAdded;
    }

}
