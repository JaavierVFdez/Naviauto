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
import modelo.entidad.Vehiculo;

/**
 *
 * @author javie
 */
public class VehiculoDAO {

    private Connection conexion;

    public VehiculoDAO() {
        this.conexion = new Conexion().getConexion();
    }

    /**
     * ********************************
     *
     * PUBLIC METHODS
     *
     */
    //Funcion para comprobar si la matricula existe
    public boolean matriculaExiste(String matricula) {
        boolean matriculaExiste = false;

        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM vehiculos WHERE matricula = '" + matricula + "';");
            ResultSet resultSet = ps.executeQuery();

            if (resultSet.next()) {
                matriculaExiste = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return matriculaExiste;
    }

    //Funcion para obtener la matricula del usuario
    public String obtenerMatriculaUsuario(String dni) {

        String matricula = "";

        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM vehiculos WHERE dni = '" + dni + "';");
            ResultSet resultSet = ps.executeQuery();

            if (resultSet.next()) {
                matricula = resultSet.getString("matricula");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return matricula;
    }

    //Funcion para añadir un nuevo vehiculo
    public void addVehiculo(String matricula, String dni, String modelo, String marca, String anyoVehiculo, double kilometrajeActual) {

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("INSERT into vehiculos (matricula, dni, modelo, marca, anyoVehiculo, kilometrajeActual)"
                    + "VALUES('" + matricula + "', '" + dni + "', '" + modelo + "', '" + marca + "', '" + anyoVehiculo + "', " + kilometrajeActual + ");");

            int executeUpdate = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Funcion para obtener la lista completa de los vehiculos de nuestros clientes
    public List<Vehiculo> obtenerVehiculos() {
        List<Vehiculo> vehiculos = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM Vehiculos");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String matricula = rs.getString("matricula");
                String dni = rs.getString("dni");
                String modelo = rs.getString("modelo");
                String marca = rs.getString("marca");
                Date anyoVehiculoDate = rs.getDate("anyoVehiculo");
                String anyoVehiculo = sdf.format(anyoVehiculoDate);
                int kilometrajeActual = rs.getInt("kilometrajeActual");

                Vehiculo vehiculo = new Vehiculo(matricula, dni, modelo, marca, anyoVehiculo, kilometrajeActual);
                vehiculos.add(vehiculo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return vehiculos;
    }

    //Funcion para editar un vehiculo
    public void editarVehiculo(String matricula, String dni, String modelo, String marca, String anyoVehiculo, double kilometrajeActual) {
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("UPDATE vehiculos SET dni = '" + dni + "', modelo = '" + modelo + "', marca = '" + marca + "', anyoVehiculo = '" + anyoVehiculo + "', kilometrajeActual = " + kilometrajeActual + " WHERE matricula = '" + matricula + "';");

            int executeUpdate = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Funcion para elminar un vehiculo
    public void eliminarVehiculo(String matricula) {
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("DELETE from vehiculos where matricula like '" + matricula + "';");
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
