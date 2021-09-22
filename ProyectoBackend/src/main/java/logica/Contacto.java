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
    private int idParqueadero;
    private String direccion;
    private int plazasTotales;
    private int plazasCarro;
    private int plazasMoto;
    private int plazasBici;
    private int carro;
    private int moto;
    private int bici;
    private float tarifaCarro;
    private float tarifaMoto;
    private float tarifaBici;

    public Contacto() {
    }

    public int getIdParqueadero() {
        return idParqueadero;
    }

    public void setIdParqueadero(int idParqueadero) {
        this.idParqueadero = idParqueadero;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getPlazasTotales() {
        return plazasTotales;
    }

    public void setPlazasTotales(int plazasTotales) {
        this.plazasTotales = plazasTotales;
    }

    public int getPlazasCarro() {
        return plazasCarro;
    }

    public void setPlazasCarro(int plazasCarro) {
        this.plazasCarro = plazasCarro;
    }

    public int getPlazasMoto() {
        return plazasMoto;
    }

    public void setPlazasMoto(int plazasMoto) {
        this.plazasMoto = plazasMoto;
    }

    public int getPlazasBici() {
        return plazasBici;
    }

    public void setPlazasBici(int plazasBici) {
        this.plazasBici = plazasBici;
    }

    public int getCarro() {
        return carro;
    }

    public void setCarro(int carro) {
        this.carro = carro;
    }

    public int getMoto() {
        return moto;
    }

    public void setMoto(int moto) {
        this.moto = moto;
    }

    public int getBici() {
        return bici;
    }

    public void setBici(int bici) {
        this.bici = bici;
    }

    public float getTarifaCarro() {
        return tarifaCarro;
    }

    public void setTarifaCarro(float tarifaCarro) {
        this.tarifaCarro = tarifaCarro;
    }

    public float getTarifaMoto() {
        return tarifaMoto;
    }

    public void setTarifaMoto(float tarifaMoto) {
        this.tarifaMoto = tarifaMoto;
    }

    public float getTarifaBici() {
        return tarifaBici;
    }

    public void setTarifaBici(float tarifaBici) {
        this.tarifaBici = tarifaBici;
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
