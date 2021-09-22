/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;

/**
 *
 * @author Alex
 */
public class Contacto {
    private int identificacion;
    private String nombre;
    private String apellido;
    private String genero;
    private String tipoIdentificacion;
    private String telefono;
    private String direccion;
    private String correo;

    public Contacto() {
    }

    public int getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(int identificacion) {
        this.identificacion = identificacion;
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

    public String getTipoIdentificacion() {
        return tipoIdentificacion;
    }

    public void setTipoIdentificacion(String tipoIdentificacion) {
        this.tipoIdentificacion = tipoIdentificacion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }
    
    
    
    public boolean guardarContacto(){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "INSERT INTO contactos(identificacion, nombre, apellido, genero,tipodeidentificacion,telefono,direccion,correo)"
                +"VALUES('"+this.identificacion+"','"+this.nombre+"','"+this.apellido+"','"+ this.genero + "','" + this.tipoIdentificacion + "',"
                + "'" + this.telefono + "','" + this.direccion + "','" + this.correo +  "');  ";
        
        if(conexion.setAutoCommitBD(false)){
            if(conexion.insertarBD(sentencia)){
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            }else{
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }
        }else{
            conexion.closeConnection();
            return false;
        }

    }
    
    public boolean borrarContacto(int Identificacion){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "DELETE FROM contactos WHERE identificacion = '" + identificacion+"'";
        
        if(conexion.setAutoCommitBD(false)){
            if(conexion.borrarBD(sentencia)){
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            }else{
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }
        }else{
            conexion.closeConnection();
            return false;
        }
    }
    
    public boolean actualizarContacto(){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "UPDATE `contactos` SET nombre='" + this.nombre + "',apellido='" + this.apellido + "',genero='" + this.genero
                + "',tipoIdentificacion='" + this.tipoIdentificacion + "',telefono='" + this.telefono + "',direccion='" + this.direccion + "',correo='" + this.correo
                +  "' WHERE identificacion=" + this.identificacion + ";";
        
        if(conexion.setAutoCommitBD(false)){
            if(conexion.actualizarBD(sentencia)){
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            }else{
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }
        }else{
            conexion.closeConnection();
            return false;
        }
    }
    
    public List<Contacto> listarContacto() throws SQLException{
        ConexionBD conexion = new ConexionBD();
        String sentencia = "SELECT * FROM contactos ORDER BY identificacion ASC";
        List<Contacto> listaContactos = new ArrayList<>();
        ResultSet rs = conexion.consultarBD(sentencia);
        while(rs.next()){
            Contacto c = new Contacto();
            c.setIdentificacion(rs.getInt("identificacion"));
            c.setNombre(rs.getString("nombre"));
            c.setApellido(rs.getString("apellido"));
            c.setGenero(rs.getString("genero"));
            c.setTipoIdentificacion(rs.getString("tipoIdentificacion"));
            c.setTelefono(rs.getString("telefono"));
            c.setDireccion(rs.getString("direccion"));
            c.setCorreo(rs.getString("correo"));
            listaContactos.add(c);
        }
        conexion.closeConnection();
        return listaContactos;        
    }
    
    public Contacto obtenerContacto() throws SQLException{
        ConexionBD conexion = new ConexionBD();
        String sentencia = "SELECT * FROM contactos WHERE identificacion ='"+identificacion+"'";
        ResultSet rs = conexion.consultarBD(sentencia);
        if(rs.next()){
            Contacto c = new Contacto();
            c.setIdentificacion(rs.getInt("identificacion"));
            c.setNombre(rs.getString("nombre"));
            c.setApellido(rs.getString("apellido"));
            c.setGenero(rs.getString("genero"));
            c.setTipoIdentificacion(rs.getString("tipoIdentificacion"));
            c.setTelefono(rs.getString("telefono"));
            c.setDireccion(rs.getString("direccion"));
            c.setCorreo(rs.getString("correo"));
            conexion.closeConnection();
            return c;
        }else{
            conexion.closeConnection();
            return null;
        }
    }
}
