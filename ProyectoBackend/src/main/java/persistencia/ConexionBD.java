/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import java.sql.*;

/**
 *
 * @author Alex
 */
public class ConexionBD {

    private String DB_driver = "";
    private String url = "";
    private String host = "";
    private String username = "";
    private String password = "";
    public Connection conexion = null;
    private ResultSet resultset = null;
    private String db = "";
    private Statement stmt = null;

    public ConexionBD() {
        DB_driver = "com.mysql.jdbc.Driver";
        host = "localhost:3306";
        db = "ejemplos";
        url = "jdbc:mysql://" + host + "/" + db;
        username = "root";
        password = "guatavita2017";

        try {
            //Asignación driver
            Class.forName(DB_driver);
        } catch (ClassNotFoundException ex) {
            System.out.println("Error de asignación del driver");
        }

        try {
            conexion = DriverManager.getConnection(url, username, password);
            System.out.println("Conexión exitosa");
        } catch (SQLException ex) {
            System.out.println("Error de asignación del driver");
        }
    }

    //Retornar conexión
    public Connection getConnection() {
        return conexion;
    }

    //Cerrar conexión
    public void closeConnection() {
        if (conexion != null) {
            try {
                conexion.close();
            } catch (SQLException ex) {
                System.out.println("Error al cerrar la conexión");
            }
        }
    }

    //Consultar BD
    public ResultSet consultarBD(String sentencia) {
        try {
            stmt = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            resultset = stmt.executeQuery(sentencia);
        } catch (SQLException ex) {
            System.out.println("Error al consultar BD");
        }

        return resultset;
    }

    public boolean insertarBD(String sentencia) {
        try {
            stmt = conexion.createStatement();
            stmt.execute(sentencia);
            return true;
        } catch (SQLException ex) {
            System.out.println("Error al insertar BD");
            return false;
        }

    }

    public boolean borrarBD(String sentencia) {
        try {
            stmt = conexion.createStatement();
            stmt.execute(sentencia);
            return true;
        } catch (SQLException ex) {
            System.out.println("Error al borrar BD");
            return false;
        }
    }

    public boolean actualizarBD(String sentencia) {
        try {
            stmt = conexion.createStatement();
            stmt.execute(sentencia);
            return true;
        } catch (SQLException ex) {
            System.out.println("Error al actualizar BD");
            return false;
        }
    }

    public boolean setAutoCommitBD(boolean commit) {
        try {
            conexion.setAutoCommit(commit);
            return true;
        } catch (SQLException ex) {
            System.out.println("Error al setAutoCommit BD");
            return false;
        }
    }

    public boolean commitBD() {
        try {
            conexion.commit();
            return true;
        } catch (SQLException ex) {
            System.out.println("Error al hacer commit BD");
            return false;
        }
    }

    public boolean rollbackBD() {
        try {
            conexion.rollback();
            return true;
        } catch (SQLException ex) {
            System.out.println("Error al hacer commit BD");
            return false;
        }
    }
}
