/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.entidad;

import java.io.Serializable;

/**
 *
 * @author javie
 */
public class Producto implements Serializable{
    
    private static final long serialVersionUID = 1L;

    public int id_producto;
    public String nombre;
    public String descripcion;
    public String categoria;
    public String url;
    public double precio;
    public int stock;

    /*
    *
    * CONSTRUCTOR
    *
    **/
    public Producto(int id_producto, String nombre, String descripcion, String categoria, String url, double precio, int stock) {
        this.id_producto = id_producto;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.categoria = categoria;
        this.url = url;
        this.precio = precio;
        this.stock = stock;
    }
    
    public Producto(String categoria) {
        this.categoria = categoria;
    }


    /*
    *
    * GETTER & SETTER
    *
    **/
    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

}
