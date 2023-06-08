/** ******************************************
 *
 * USUARIO DAO
 *
 */
package modelo.dao;

import bd.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.entidad.Usuario;

/**
 *
 * @author javie
 */
public class UsuarioDAO {

    //Atributo conexion
    private Connection conexion;

    /**
     * ****************************************************
     *
     * CONSTRUCTOR
     *
     *
     */
    public UsuarioDAO() {
        this.conexion = new Conexion().getConexion();
    }

    /**
     * ****************************************************
     *
     * METODOS PÚBLICOS
     *
     *
     */
    //Función para comprobar el tipo de usuario en cuestión
    public String tipoUsuario(String correo) {
        //Variable para almacenar el tipo de usuario
        String tipoUsuario = "";

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("SELECT tipoUsuario from usuarios where email like '" + correo + "';");
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                tipoUsuario = rs.getString("tipoUsuario");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println(tipoUsuario);

        return tipoUsuario;
    }

    //Función para comprobar las credenciales del usuario
    public boolean comprobarCredenciales(String correo, String password) {

        //Variable para almacenar si el usuario/contraseña es correcta
        boolean esCorrecto = false;

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("SELECT * from usuarios "
                    + "where email like '" + correo + "' and password like '" + password + "';");

            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                esCorrecto = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return esCorrecto;
    }

    //Comprobar si ya hay un usuario con ese email
    public boolean comprobarDNI(String dni) {
        boolean dniExiste = false;

        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM usuarios WHERE dni = '" + dni + "';");
            ResultSet resultSet = ps.executeQuery();

            if (resultSet.next()) {
                dniExiste = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println("dnidndindi:" + dniExiste);

        return dniExiste;
    }

    //Comprobar si ya hay un usuario con ese email
    public boolean comprobarEmail(String email) {
        boolean correoExiste = false;

        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM usuarios WHERE email = '" + email + "';");
            ResultSet resultSet = ps.executeQuery();

            if (resultSet.next()) {
                correoExiste = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println("coooreoeoreo:" + correoExiste);

        return correoExiste;
    }

    //Comprobar si ya hay un usuario con ese email
    public boolean comprobarTLF(String tlf) {
        boolean telefonoExiste = false;

        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM usuarios WHERE telefono = '" + tlf + "';");
            ResultSet resultSet = ps.executeQuery();

            if (resultSet.next()) {
                telefonoExiste = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return telefonoExiste;
    }

    //Función para añadir un nuevo usuario
    public boolean addUsuario(String dni, String telefono, String correo, String password, String nombre, String apellido, String tipoUsuario) {
        boolean usuarioAdded = false;

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("INSERT into Usuarios (dni, telefono, email, password, nombre, apellido, tipoUsuario)"
                    + "VALUES('" + dni + "'," + telefono + ",'" + correo + "','" + password + "','" + nombre + "','" + apellido + "','" + tipoUsuario + "');");

            int executeUpdate = ps.executeUpdate();
            usuarioAdded = true;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usuarioAdded;
    }

    //Función para obtener los empleados
    public List<Usuario> obtenerEmpleados() {
        List<Usuario> empleados = new ArrayList();
        String dni = "";
        String telefono = "";
        String email = "";
        String nombre = "";
        String apellido = "";
        String tipoUsuario = "";

        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM Usuarios;");
            ResultSet resultSet = ps.executeQuery();

            String categoria = "";

            while (resultSet.next()) {

                //Almacenamos los datos
                dni = resultSet.getString("dni");
                telefono = resultSet.getString("telefono");
                email = resultSet.getString("email");
                nombre = resultSet.getString("nombre");
                apellido = resultSet.getString("apellido");
                tipoUsuario = resultSet.getString("tipoUsuario");

                if (tipoUsuario.equals("jefe") || tipoUsuario.equals("admin")) {
                    Usuario empleado = new Usuario(dni, telefono, email, nombre, apellido, tipoUsuario);
                    empleados.add(empleado);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return empleados;
    }

    //Funcion para comprobar si el usuario tiene alguna direccion
    public boolean direccionExiste(String correo) {
        String direccion = "";
        boolean direccionExiste = false;

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("SELECT * from usuarios where email like '" + correo + "';");
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                direccion = rs.getString("direccion");
                
                if(!direccion.equals("")) {
                    direccionExiste = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return direccionExiste;
    }

    //Funcion para obtener los datos del usuario logado
    public String obtenerDNI(String correo) {

        String dni = "";

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("SELECT * from usuarios where email like '" + correo + "';");
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                dni = rs.getString("dni");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return dni;
    }

    public String obtenerTLF(String correo) {
        String dni = "";

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("SELECT * from usuarios where email like '" + correo + "';");
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                dni = rs.getString("telefono");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return dni;
    }

    public String obtenerNombre(String correo) {
        String nombre = "";

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("SELECT * from usuarios where email like '" + correo + "';");
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                nombre = rs.getString("nombre");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return nombre;
    }

    public String obtenerApellido(String correo) {
        String apellido = "";

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("SELECT * from usuarios where email like '" + correo + "';");
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                apellido = rs.getString("apellido");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return apellido;
    }

    public String obtenerTipoUsuario(String correo) {
        String tipoUsuario = "";

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("SELECT * from usuarios where email like '" + correo + "';");
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                tipoUsuario = rs.getString("tipoUsuario");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tipoUsuario;
    }

    public String obtenerDireccion(String correo) {
        String direccion = "";

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("SELECT * from usuarios where email like '" + correo + "';");
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                direccion = rs.getString("direccion");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return direccion;
    }
}
