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
public class Pedido extends Conexion {

    public int id_pedido;
    public String dni;
    public float precio_total;
    public String direccion_envio;
    public String estado;

    /**
     * ****************************************
     *
     * CONSTRUCTOR
     *
     *
     */
    public Pedido(int id_pedido, String dni, float precio_total, String direccion_envio, String estado) {
        this.id_pedido = id_pedido;
        this.dni = dni;
        this.precio_total = precio_total;
        this.direccion_envio = direccion_envio;
        this.estado = estado;
    }

    /**
     * ****************************************
     *
     * GETTER & SETTER
     *
     *
     */
    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public float getPrecio_total() {
        return precio_total;
    }

    public void setPrecio_total(float precio_total) {
        this.precio_total = precio_total;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getDireccion_envio() {
        return direccion_envio;
    }

    public void setDireccion_envio(String direccion_envio) {
        this.direccion_envio = direccion_envio;
    }
}
