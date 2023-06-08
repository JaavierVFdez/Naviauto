/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dao;

import bd.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.entidad.Categoria;

/**
 *
 * @author javie
 */
public class CategoriaDAO {

    //Atributo conexion
    private Connection conexion;

    /**
     * ****************************************************
     *
     * CONSTRUCTOR
     *
     *
     */
    public CategoriaDAO() {
        this.conexion = new Conexion().getConexion();
    }

    /**
     * ****************************************************
     *
     * METODOS PÚBLICOS
     *
     *
     */
    //Funcion para comprobar si una categoria ya existe
    public boolean categoriaExiste(String nombre) {
        boolean categoriaExsite = false;

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("SELECT * from Categorias where nombre_categoria like '" + nombre + "';");
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                categoriaExsite = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categoriaExsite;
    }

    //Función para añadir una categoria
    public void addCategoria(String nombre, String nombreAntiguo) {
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("INSERT into Categorias (nombre_categoria)"
                    + "VALUES('" + nombre + "');");

            if (nombreAntiguo.equals(nombre) || !categoriaExiste(nombreAntiguo)) {
                int executeUpdate = ps.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Funcion para eliminar una categoria
    public void eliminarCategoria(String nombre) {
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("DELETE from Categorias where nombre_categoria = " + nombre + ";");
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Funcion para editar una categoria
    public boolean editarCategoria(String nombre, String nombreAntiguo) {
        boolean categoriaEditada = false;
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("UPDATE Categorias set nombre_categoria = '" + nombre + "' where nombre_categoria = '" + nombreAntiguo + "';");

            if (nombreAntiguo.equals(nombre) || !categoriaExiste(nombreAntiguo)) {
                ps.executeUpdate();
                categoriaEditada = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categoriaEditada;
    }

    //Funcion para mostrar las categorias
    public List<Categoria> mostrarCategorias() {
        List<Categoria> categorias = new ArrayList();

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("SELECT * from Categorias;");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String nombre = rs.getString("nombre_categoria");

                Categoria cat = new Categoria(nombre);
                categorias.add(cat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categorias;
    }
    
    public void cerrarConexion() {
        try {
           conexion.close();
        }catch(SQLException e) {
            e.printStackTrace();
        }
    }
}
