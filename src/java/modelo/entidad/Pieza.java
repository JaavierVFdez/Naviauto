/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.entidad;

/**
 *
 * @author javie
 */
public class Pieza {

    int codigo_pieza;
    int codigo_reparacion;
    String nombre;
    String fabricante;
    float precio;

    /**
     * ****************************************
     *
     * CONSTRUCTOR
     *
     *
     */
    public Pieza(int codigo_pieza, int codigo_reparacion, String nombre, String fabricante, float precio) {
        this.codigo_pieza = codigo_pieza;
        this.codigo_reparacion = codigo_reparacion;
        this.nombre = nombre;
        this.fabricante = fabricante;
        this.precio = precio;
    }

    /**
     * ****************************************
     *
     * GETTER & SETTER
     *
     *
     */
    public int getCodigo_pieza() {
        return codigo_pieza;
    }

    public void setCodigo_pieza(int codigo_pieza) {
        this.codigo_pieza = codigo_pieza;
    }

    public int getCodigo_reparacion() {
        return codigo_reparacion;
    }

    public void setCodigo_reparacion(int codigo_reparacion) {
        this.codigo_reparacion = codigo_reparacion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFabricante() {
        return fabricante;
    }

    public void setFabricante(String fabricante) {
        this.fabricante = fabricante;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

}
