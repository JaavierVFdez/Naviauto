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
import java.util.List;
import modelo.entidad.Carrito;
import modelo.entidad.Producto;

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

        System.out.println(id_producto + "asdasuhfbaufjgadiasyda");
        System.out.println(dni + " askjhdbnaljshdbadbkshdb");

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("SELECT * from carrito "
                    + "where dni like '" + dni + "' and id_producto = " + id_producto + ";");

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
            PreparedStatement ps = conexion.prepareStatement("UPDATE carrito set cantidad = " + cantidad + ", precio = " + precio + " where dni = '" + dni + "' and id_producto = " + id_producto + ";");

            int executeUpdate = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Funcion para devolver la lista con el carrito del usuario
    public List<Carrito> getListaCarrito(String dni) {
        List<Carrito> carritos = new ArrayList();

        ProductoDAO productoDao = new ProductoDAO();

        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * from carrito where dni = '" + dni + "';");
            ResultSet resultSet = ps.executeQuery();

            int id_carrito = 0;
            int id_producto = 0;
            String nombreProducto = "";
            String url_producto = "";
            float precio = 0;
            int cantidad = 0;

            while (resultSet.next()) {

                //Almacenamos los datos
                id_carrito = resultSet.getInt("id_carrito");
                id_producto = resultSet.getInt("id_producto");
                nombreProducto = productoDao.obtenerNombreProducto(id_producto);
                url_producto = productoDao.obtenerUrlProducto(id_producto);
                precio = resultSet.getFloat("precio");
                cantidad = resultSet.getInt("cantidad");

                Carrito carrito = new Carrito(id_carrito, dni, id_producto, nombreProducto, url_producto, precio, cantidad);
                carritos.add(carrito);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return carritos;
    }

    //Funcion para vaciar la cesta del usuario cuando compre
    public void vaciarCesta(String dni_cliente) {
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("DELETE FROM Carrito WHERE dni = '"+dni_cliente+"';");

            int executeUpdate = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    //Funcion para comprobar si el producto esta en el carrito
    public boolean productoExiste(int id_producto) {
        boolean productoExiste = false;

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("SELECT * from Carrito where id_producto = "+id_producto+";");

            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                productoExiste = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productoExiste;
    }
    
    //Eliminar producto del carrito para admin
    public void adminEliminarProductoCarrito(int id_producto) {
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("DELETE FROM Carrito WHERE id_producto = "+id_producto+";");

            int executeUpdate = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    //Funcion para eliminar un producto del carrito
    public void eliminarProductoCarrito(String dni, int id_producto) {
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("DELETE FROM Carrito WHERE dni = '"+dni+"' and id_producto = "+id_producto+";");

            int executeUpdate = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void cerrarConexion() {
        try {
           conexion.close();
        }catch(SQLException e) {
            e.printStackTrace();
        }
    }
}
