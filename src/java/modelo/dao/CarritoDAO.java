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

/**
 *
 * @author javie
 */
public class CarritoDAO {

    //Atributo conexion
    private Connection conexion;

    /**
     * ****************************************************
     *
     * CONSTRUCTOR
     *
     *
     */
    public CarritoDAO() {
        this.conexion = new Conexion().getConexion();
    }

    /**
     * ****************************************************
     *
     * METODOS PÚBLICOS
     *
     *
     */
    //Función para comprobar que el producto que se va a añadir en el carrito ya existe
    public boolean comprobarProductoCarrito(int id_producto, String dni) {

        boolean productoExiste = false;

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("SELECT * from Carrito "
                    + "where id_producto = " + id_producto + " and dni like '" + dni + "';");

            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                productoExiste = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productoExiste;
    }

    //Funcion para obtener la cantidad del producto en el carrito ya añadido
    public int obtenerCantidad(String dni, int id_producto) {

        int cantidad = 0;

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("SELECT * from Carrito "
                    + "where id_producto like " + id_producto + " and dni like '" + dni + "';");

            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                cantidad = resultSet.getInt("cantidad");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cantidad;
    }

    //Funcion para añadir los productos al carrito
    public void addProductoCarrito(String dni_cliente, int id_producto, int cantidad, float precio) {

        System.out.println(dni_cliente);
        System.out.println(id_producto);
        System.out.println(cantidad);
        System.out.println(precio);

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("INSERT into carrito (dni, id_producto, precio, cantidad)"
                    + "VALUES('" + dni_cliente + "', '" + id_producto + "', '" + precio + "', '" + cantidad + "');");

            int executeUpdate = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    //Funcion para actualizar los datos del producto del carrito
    public void actualizarStockProductoCarrito(String dni, int id_producto, int cantidad, float precio) {
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("UPDATE carrito set cantidad = "+cantidad+", precio = "+precio+" where dni = '"+dni+"' and id_producto = "+id_producto+";");

            int executeUpdate = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
