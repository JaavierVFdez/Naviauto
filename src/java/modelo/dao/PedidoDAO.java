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
import modelo.entidad.Pedido;

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
                    + "VALUES('" + dni + "', " + precio_total + ", '" + direccion_envio + "', '" + estado + "');");

            int executeUpdate = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Funcion para obtener todos los pedidos
    public List<Pedido> obtenerPedidos() {
        List<Pedido> pedidos = new ArrayList();

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("select * from pedidos;");
            ResultSet rs = ps.executeQuery();

            int id_pedido = 0;
            String dni = "";
            float precio_total = 0;
            String direccion_envio = "";
            String estado = "";

            while (rs.next()) {
                id_pedido = rs.getInt("id_pedido");
                dni = rs.getString("dni");
                precio_total = rs.getFloat("precio_total");
                direccion_envio = rs.getString("direccion_envio");
                estado = rs.getString("estado");

                Pedido pedido = new Pedido(id_pedido, dni, precio_total, direccion_envio, estado);
                pedidos.add(pedido);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return pedidos;
    }

    //Funcion para obtener los pedidos del usuario
    public List<Pedido> obtenerPedidosUsuario(String dni) {
        List<Pedido> pedidos = new ArrayList();

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("select * from pedidos where dni like '" + dni + "';");
            ResultSet rs = ps.executeQuery();

            int id_pedido = 0;
            float precio_total = 0;
            String direccion_envio = "";
            String estado = "";

            while (rs.next()) {
                id_pedido = rs.getInt("id_pedido");
                precio_total = rs.getFloat("precio_total");
                direccion_envio = rs.getString("direccion_envio");
                estado = rs.getString("estado");

                System.out.println(id_pedido);
                System.out.println(dni);
                System.out.println(precio_total);
                System.out.println(direccion_envio);
                System.out.println(estado);

                Pedido pedido = new Pedido(id_pedido, dni, precio_total, direccion_envio, estado);
                pedidos.add(pedido);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return pedidos;
    }

    //Funcion para obtener el id del pedido
    public int obtenerIdPedido(String dni) {
        int id_pedido = 0;

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("select * from pedidos where dni = '" + dni + "' order by id_pedido desc limit 1;");
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                id_pedido = rs.getInt("id_pedido");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return id_pedido;
    }

    //Funcion para actualizar el pedido
    public void actualizarPedido(int id_pedido, String estado) {
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("UPDATE pedidos set estado = '"+estado+"' WHERE id_pedido = " + id_pedido + ";");

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
