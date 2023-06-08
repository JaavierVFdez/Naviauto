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
public class Vehiculo extends Conexion{

    public String matricula;
    public String dni;
    public String modelo;
    public String marca;
    public String anyoVehiculo;
    public double kilometrajeActual;

    /**
     * ****************************************
     *
     * CONSTRUCTOR
     *
     *
     */
    public Vehiculo(String matricula, String dni, String modelo, String marca, String anyoVehiculo, double kilometrajeActual) {
        this.matricula = matricula;
        this.dni = dni;
        this.modelo = modelo;
        this.marca = marca;
        this.anyoVehiculo = anyoVehiculo;
        this.kilometrajeActual = kilometrajeActual;
    }

    /**
     * ****************************************
     *
     * GETTER & SETTER
     *
     *
     */
    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getAnyoVehiculo() {
        return anyoVehiculo;
    }

    public void setAnyoVehiculo(String anyoVehiculo) {
        this.anyoVehiculo = anyoVehiculo;
    }

    public double getKilometrajeActual() {
        return kilometrajeActual;
    }

    public void setKilometrajeActual(double kilometrajeActual) {
        this.kilometrajeActual = kilometrajeActual;
    }
}
