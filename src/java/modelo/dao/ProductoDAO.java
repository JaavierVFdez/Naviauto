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
import modelo.entidad.Producto;

/**
 *
 * @author javie
 */
public class ProductoDAO {

    private Connection conexion;

    public ProductoDAO() {
        this.conexion = new Conexion().getConexion();
    }

    /**
     * ********************************
     *
     * PUBLIC METHODS
     *
     */
    //Función para mostrar los productos existentes
    public List<Producto> getListaProducto() {
        List<Producto> productos = new ArrayList();

        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * from productos;");
            ResultSet resultSet = ps.executeQuery();

            int id_producto = 0;
            String nombre = "";
            String descripcion = "";
            String categoria = "";
            String url = "";
            double precio = 0.0;
            int stock = 0;

            while (resultSet.next()) {

                //Almacenamos los datos
                id_producto = resultSet.getInt("id_producto");
                nombre = resultSet.getString("nombre");
                descripcion = resultSet.getString("descripcion");
                categoria = resultSet.getString("categoria");
                url = resultSet.getString("url");
                precio = resultSet.getDouble("precio");
                stock = resultSet.getInt("stock");

                Producto producto = new Producto(id_producto, nombre, descripcion, categoria, url, precio, stock);
                productos.add(producto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productos;
    }

    //Funcion para añadir un producto
    public void addProducto(String nombre, String descripcion, String categoria, String url, double precio, int stock) {
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("INSERT into Productos (nombre, descripcion, categoria, url, precio, stock)"
                    + "VALUES('" + nombre + "', '" + descripcion + "', '" + categoria + "', '" + url + "', " + precio + ", " + stock + ");");

            int executeUpdate = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Funcion para actualizar un producto
    public void actualizarProducto(int id_producto, String nombre, String descripcion, String categoria, String url, float precio, int stock) {
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("UPDATE productos set nombre = '" + nombre + "', descripcion = '" + descripcion + "', categoria = '" + categoria + "', stock = " + stock + ", url = '"+url+"', precio = " + precio + " WHERE id_producto = " + id_producto + ";");

            int executeUpdate = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Funcion para comprobar el stock del producto
    public boolean comprobarStock(int id_producto, int cantidad) {
        boolean stockAgotado = false;

        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM Productos where id_producto = " + id_producto + " and stock <= " + cantidad + ";");
            ResultSet resultSet = ps.executeQuery();

            if (resultSet.next()) {
                stockAgotado = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return stockAgotado;
    }

    //Funcion para obtener el nombre del producto del carrito
    public String obtenerNombreProducto(int id_producto) {
        String nombreProducto = "";

        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM Productos where id_producto = " + id_producto + " ;");
            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                nombreProducto = resultSet.getString("nombre");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return nombreProducto;
    }

    //Funcion para obtener la url del producto del carrito
    public String obtenerUrlProducto(int id_producto) {
        String url_producto = "";

        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM Productos where id_producto = " + id_producto + " ;");
            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                url_producto = resultSet.getString("url");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return url_producto;
    }

    //Funcion para actualizar el stock de los productos comprados
    public void actualizarStock(int id_producto, int cantidad) {

        System.out.println(id_producto);
        System.out.println(cantidad);

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("UPDATE productos set stock =  stock - " + cantidad + " where id_producto = " + id_producto + ";");

            int executeUpdate = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Funcion para comprobar si la categoria existe
    public boolean existeCategoria(String nombre_categoria) {
        boolean categoriaExiste = false;
        
        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM Productos where categoria = '" + nombre_categoria + "' ;");
            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                categoriaExiste = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return categoriaExiste;
    }

    //Funcion para eliminar un producto
    public void eliminarProducto(int id_producto) {
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("DELETE from productos where id_producto like " + id_producto + ";");
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
