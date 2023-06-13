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
public class Usuario extends Conexion {

    public String dni;
    public String telefono;
    public String email;
    public String correo;
    public String password;
    public String nombre;
    public String apellido;
    public String tipoUsuario;
    public String direccion;

    /**
     * ****************************************
     *
     * CONSTRUCTOR
     *
     *
     */
    public Usuario(String dni, String email, String password, String nombre, String apellido) {
        this.dni = dni;
        this.email = email;
        this.password = password;
        this.nombre = nombre;
        this.apellido = apellido;
    }

    public Usuario(String dni, String email, String password, String nombre, String apellido, String tipoUsuario, String direccion) {
        this.dni = dni;
        this.email = email;
        this.password = password;
        this.nombre = nombre;
        this.apellido = apellido;
        this.tipoUsuario = tipoUsuario;
        this.direccion = direccion;
    }

    public Usuario(String dni, String telefono, String email, String nombre, String apellido, String tipoUsuario) {
        this.dni = dni;
        this.telefono = telefono;
        this.email = email;
        this.nombre = nombre;
        this.apellido = apellido;
        this.tipoUsuario = tipoUsuario;
    }
    
    
    
    

    /**
     * ****************************************
     *
     * GETTER & SETTER
     *
     *
     */
    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
    

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getTipoUsuario() {
        return tipoUsuario;
    }

    public void setTipoUsuario(String tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    
}
