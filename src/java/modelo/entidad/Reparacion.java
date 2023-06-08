/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.entidad;

import bd.Conexion;
import java.util.Date;

/**
 *
 * @author javie
 */
public class Reparacion extends Conexion {

    public int codigo_reparacion;
    public String matricula;
    public String descripcion;
    public Date fechaEntrada;
    public Date fechaFinalizacion;
    public String fechaE;
    public String fechaF;
    public String estado;
    public float precio;

    /**
     * ****************************************
     *
     * CONSTRUCTOR
     *
     *
     */
    public Reparacion(int codigo_reparacion, String matricula, String descripcion, Date fechaEntrada, Date fechaFinalizacion, String estado, float precio) {
        this.codigo_reparacion = codigo_reparacion;
        this.matricula = matricula;
        this.descripcion = descripcion;
        this.fechaEntrada = fechaEntrada;
        this.fechaFinalizacion = fechaFinalizacion;
        this.estado = estado;
        this.precio = precio;
    }

    public Reparacion(int codigo_reparacion, String matricula, String descripcion, String fechaE, String fechaF, String estado, float precio) {
        this.codigo_reparacion = codigo_reparacion;
        this.matricula = matricula;
        this.descripcion = descripcion;
        this.fechaE = fechaE;
        this.fechaF = fechaF;
        this.estado = estado;
        this.precio = precio;
    }

    /**
     * ****************************************
     *
     * GETTER & SETTER
     *
     *
     */
    public int getCodigo_reparacion() {
        return codigo_reparacion;
    }

    public void setCodigo_reparacion(int codigo_reparacion) {
        this.codigo_reparacion = codigo_reparacion;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFechaEntrada() {
        return fechaEntrada;
    }

    public void setFechaEntrada(Date fechaEntrada) {
        this.fechaEntrada = fechaEntrada;
    }

    public Date getFechaFinalizacion() {
        return fechaFinalizacion;
    }

    public void setFechaFinalizacion(Date fechaFinalizacion) {
        this.fechaFinalizacion = fechaFinalizacion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public String getFechaE() {
        return fechaE;
    }

    public void setFechaE(String fechaE) {
        this.fechaE = fechaE;
    }

    public String getFechaF() {
        return fechaF;
    }

    public void setFechaF(String fechaF) {
        this.fechaF = fechaF;
    }

}
