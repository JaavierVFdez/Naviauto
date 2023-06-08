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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import modelo.entidad.Pieza;
import modelo.entidad.Reparacion;

/**
 *
 * @author javie
 */
public class PiezaDAO {

    private Connection conexion;

    public PiezaDAO() {
        this.conexion = new Conexion().getConexion();
    }

    /**
     * ********************************
     *
     * PUBLIC METHODS
     *
     */
    //Funcion para obtener la lista completa de las piezas registradas
    public List<Pieza> obtenerPiezas() {
        List<Pieza> piezas = new ArrayList();

        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM piezas;");
            ResultSet resultSet = ps.executeQuery();
            int codigo_pieza = 0;
            int codigo_reparacion = 0;
            String nombre = "";
            String fabricante = "";
            float precio = 0;

            while (resultSet.next()) {

                //Almacenamos los datos
                codigo_pieza = resultSet.getInt("codigo_pieza");
                codigo_reparacion = resultSet.getInt("codigo_reparacion");
                nombre = resultSet.getString("nombre");
                fabricante = resultSet.getString("fabricante");
                precio = resultSet.getFloat("precio");

                Pieza pieza = new Pieza(codigo_pieza, codigo_reparacion, nombre, fabricante, precio);
                piezas.add(pieza);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return piezas;
    }

    //Funcion para añadir una pieza
    public void addPieza(int codigo_reparacion, String nombre, String fabricante, float precio) {

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("INSERT into piezas (codigo_reparacion, nombre, fabricante,precio)"
                    + "VALUES(" + codigo_reparacion + ", '" + nombre + "' , '" + fabricante + "', " + precio + ");");

            int executeUpdate = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Funcion para editar una pieza
    public void editarPieza(int codigo_pieza, int codigo_reparacion, String nombre, String fabricante, float precio) {
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("UPDATE piezas SET codigo_reparacion = " + codigo_reparacion + ", nombre = '" + nombre + "', fabricante = '" + fabricante + "', precio = " + precio + " WHERE codigo_pieza = " + codigo_pieza + ";");

            int executeUpdate = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Funcion para elimnar una pieza
    public void eliminarPieza(int codigo_pieza) {
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("DELETE from piezas where codigo_pieza like " + codigo_pieza + ";");
            int rows = ps.executeUpdate();
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
