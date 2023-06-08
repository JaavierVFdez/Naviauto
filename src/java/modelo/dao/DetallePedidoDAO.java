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
    
    public void cerrarConexion() {
        try {
           conexion.close();
        }catch(SQLException e) {
            e.printStackTrace();
        }
    }
}
