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

    //Comprobar si ya hay un usuario con ese dni
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

    //Funcion para comprobar si el correo del usuario es el mismo que el que tenia antes
    public String correoUsuario(String dni) {
        String correo = "";

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("SELECT * from usuarios where dni like '" + dni + "';");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                correo = rs.getString("email");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println(correo + " nkiasdnuaishdaudha");

        return correo;
    }

    //Funcion para comprobar si el telefono del usuario es el mismo que el que tenia antes
    public String telefonoUsuario(String dni) {
        String telefono = "";

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("SELECT * from usuarios where dni like '" + dni + "';");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                telefono = rs.getString("telefono");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println(telefono + " iasuhdbuayshda");

        return telefono;
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
    
    
    //Función para añadir un nuevo usuario
    public boolean addEmpleado(String dni, String telefono, String correo, String password, String nombre, String apellido, String tipoUsuario, String direccion) {
        boolean usuarioAdded = false;

        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("INSERT into Usuarios (dni, telefono, email, password, nombre, apellido, tipoUsuario, direccion)"
                    + "VALUES('" + dni + "'," + telefono + ",'" + correo + "','"+password+"','" + nombre + "','" + apellido + "','" + tipoUsuario + "', '"+direccion+"');");

            int executeUpdate = ps.executeUpdate();
            usuarioAdded = true;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usuarioAdded;
    }

    //Función para obtener los empleados
    public List<Usuario> getUsuarios() {
        List<Usuario> usuarios = new ArrayList();
        try {

            //Consulta
            PreparedStatement ps = conexion.prepareStatement("SELECT * from usuarios;");
            ResultSet rs = ps.executeQuery();

            // Iterar sobre los resultados
            while (rs.next()) {

                // Leer los datos de la fila actual del ResultSet
                String dni = rs.getString("dni");
                String correo = rs.getString("email");
                String telefono = rs.getString("telefono");
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String tipoUsuario = rs.getString("tipoUsuario");
                String direccion = rs.getString("direccion");

                // Añadir el usuario a la lista si cumple con las condiciones
                if (tipoUsuario.equals("jefe") || tipoUsuario.equals("admin")) {
                    Usuario usuario = new Usuario(dni, telefono, correo, "", nombre, apellido, tipoUsuario, direccion);
                    usuarios.add(usuario);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usuarios;
    }

    //Funcion para eliminar al usuario/empleado
    public void eliminarUsuario(String dni) {
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("DELETE from usuarios where dni like '" + dni + "';");
            int rows = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
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

                // Si la direccion no es null y no está vacía, entonces existe
                if (direccion != null && !direccion.equals("")) {
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

    //Funcion para actualizar los datos el usuario
    public void actualizarUsuario(String dni, String nombre, String apellido, String telefono, String correo, String direccion) {
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("UPDATE usuarios set telefono = '" + telefono + "', email = '" + correo + "', nombre = '" + nombre + "', apellido = '" + apellido + "', direccion = '" + direccion + "' where dni = '" + dni + "';");

            int executeUpdate = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    //Funcion para actualizar los datos el usuario
    public void actualizarEmpleado(String dni, String telefono, String correo, String password, String nombre, String apellido, String tipoUsuario, String direccion) {
        try {
            //Consulta
            PreparedStatement ps = conexion.prepareStatement("UPDATE usuarios set telefono = '" + telefono + "', email = '" + correo + "', password = '"+password+"', nombre = '" + nombre + "', apellido = '" + apellido + "', tipoUsuario = '"+tipoUsuario+"', direccion = '" + direccion + "' where dni = '" + dni + "';");

            int executeUpdate = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
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

    public void cerrarConexion() {
        try {
            conexion.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
