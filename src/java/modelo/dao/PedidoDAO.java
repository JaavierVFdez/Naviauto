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
public class PedidoDAO {

    //Atributo conexion
    private Connection conexion;

    /**
     * ****************************************************
     *
     * CONSTRUCTOR
     *
     *
     */
    public PedidoDAO() {
        this.conexion = new Conexion().getConexion();
    }

    /**
     * ****************************************************
     *
     * METODOS PÚBLICOS
     *
     *
     */
    //Funcion para añadir un pedido
    public void addPedido(String dni, float precio_total, String direccion_envio, String estado) {        
        
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("INSERT into pedidos (dni, precio_total, direccion_envio, estado)"
                    + "VALUES('" + dni + "', " + precio_total + ", '"+direccion_envio+"', '" + estado + "');");

            int executeUpdate = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Funcion para obtener el id del pedido
    public int obtenerIdPedido(String dni) {
        int id_pedido = 0;
        
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("select * from pedidos where dni = '"+dni+"' order by id_pedido desc limit 1;");
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                id_pedido = rs.getInt("id_pedido");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return id_pedido;
    }
    
    public void cerrarConexion() {
        try {
           conexion.close();
        }catch(SQLException e) {
            e.printStackTrace();
        }
    }
}
