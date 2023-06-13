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
import modelo.entidad.DetallePedido;
import modelo.entidad.Reparacion;

/**
 *
 * @author javie
 */
public class DetallePedidoDAO {

    //Atributo conexion
    private Connection conexion;

    /**
     * ****************************************************
     *
     * CONSTRUCTOR
     *
     *
     */
    public DetallePedidoDAO() {
        this.conexion = new Conexion().getConexion();
    }

    /**
     * ****************************************************
     *
     * METODOS PÚBLICOS
     *
     *
     */
    //Funcion para añadir los detalles del pedido
    public void addDetallePedido(int id_pedido, int id_producto, int cantidad, float precio) {
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("INSERT INTO DetallesPedido (id_pedido, id_producto, cantidad, precio) VALUES ("+id_pedido+", "+id_producto+", "+cantidad+", "+precio+");");

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    //Funcion para obtener los detalles del pedido
    public List<DetallePedido> obtenerDetallesPedido(int id_pedido) {
        List<DetallePedido> detallesPedido = new ArrayList();
        
        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM detallespedido where id_pedido = "+id_pedido+";");
            ResultSet resultSet = ps.executeQuery();
            
            int id_detalle = 0;
            int id_producto = 0;
            int cantidad = 0;
            float precio = 0;
            
            while (resultSet.next()) {

                //Almacenamos los datos
               id_detalle = resultSet.getInt("id_detalle");
               id_producto = resultSet.getInt("id_producto");
               cantidad = resultSet.getInt("cantidad");
               precio = resultSet.getFloat("precio");
               
               DetallePedido detallePedido = new DetallePedido(id_detalle, id_pedido, id_producto, cantidad, precio);
               detallesPedido.add(detallePedido);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return detallesPedido;
    }
    
    public void cerrarConexion() {
        try {
           conexion.close();
        }catch(SQLException e) {
            e.printStackTrace();
        }
    }
}
