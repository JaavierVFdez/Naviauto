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
public class Carrito extends Conexion{

    public int id_carrito;
    public String dni_cliente;
    public int id_producto;
    public float precio;
    public int cantidad;

    /**
     * ****************************************
     *
     * CONSTRUCTOR
     *
     *
     */
    public Carrito(int id_carrito, String dni_cliente, int id_producto, float precio, int cantidad) {
        this.id_carrito = id_carrito;
        this.dni_cliente = dni_cliente;
        this.id_producto = id_producto;
        this.precio = precio;
        this.cantidad = cantidad;
    }

    /**
     * ****************************************
     *
     * GETTER & SETTER
     *
     *
     */
    public int getId_carrito() {
        return id_carrito;
    }

    public void setId_carrito(int id_carrito) {
        this.id_carrito = id_carrito;
    }

    public String getDni_cliente() {
        return dni_cliente;
    }

    public void setDni_cliente(String dni_cliente) {
        this.dni_cliente = dni_cliente;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
}
