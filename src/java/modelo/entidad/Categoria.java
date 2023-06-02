/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.entidad;

/**
 *
 * @author javie
 */
public class Categoria {

    public String nombre_categoria;

    /**
     * ****************************************
     *
     * CONSTRUCTOR
     *
     *
     */
    public Categoria(String nombre_categoria) {
        this.nombre_categoria = nombre_categoria;
    }

    /**
     * ****************************************
     *
     * GETTER & SETTER
     *
     *
     */
    public String getNombre_categoria() {
        return nombre_categoria;
    }

    public void setNombre_categoria(String nombre_categoria) {
        this.nombre_categoria = nombre_categoria;
    }
}
