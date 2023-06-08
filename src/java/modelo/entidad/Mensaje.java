/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.entidad;

/**
 *
 * @author javie
 */
public class Mensaje {

    public int codigo_mensaje;
    public String nombre;
    public String apellido;
    public String correo;
    public String asunto;
    public String mensaje;

    /**
     * **************************************
     *
     * CONSTRUCTOR
     *
     *
     */
    public Mensaje(int codigo_mensaje, String nombre, String apellido, String correo, String asunto, String mensaje) {
        this.codigo_mensaje = codigo_mensaje;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.asunto = asunto;
        this.mensaje = mensaje;
    }

    /**
     * **************************************
     *
     * GETTER & SETTER
     *
     *
     */
    public int getCodigo_mensaje() {
        return codigo_mensaje;
    }

    public void setCodigo_mensaje(int codigo_mensaje) {
        this.codigo_mensaje = codigo_mensaje;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }
}
