/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.entidad;

import bd.Conexion;

/**
 *
 * @author javie
 */
public class DetallePedido extends Conexion {

    public int id_detalle_pedido;
    public int id_pedido;
    public int id_producto;
    public int cantidad;
    public float precio;

    /**
     * ****************************************
     *
     * CONSTRUCTOR
     *
     *
     */
    public DetallePedido(int id_detalle_pedido, int id_pedido, int id_producto, int cantidad, float precio) {
        this.id_detalle_pedido = id_detalle_pedido;
        this.id_pedido = id_pedido;
        this.id_producto = id_producto;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    /**
     * ****************************************
     *
     * GETTER & SETTER
     *
     *
     */
    public int getId_detalle_pedido() {
        return id_detalle_pedido;
    }

    public void setId_detalle_pedido(int id_detalle_pedido) {
        this.id_detalle_pedido = id_detalle_pedido;
    }

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

}
