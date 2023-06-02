package bd;

/**
 *
 * @author javie
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    private Connection conexion;

    public Conexion() {
        try {
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/naviauto", "root", "");

        } catch (SQLException e) {
            System.err.println("Error al establecer la conexión: " + e.getMessage());
        }
    }

    public Connection getConexion() {
        return conexion;
    }

    public void cerrarConexion() {
        try {
            conexion.close();
        } catch (SQLException e) {
            System.err.println("Error al cerrar la conexión: " + e.getMessage());
        }
    }
}
