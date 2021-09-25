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
public class Parqueadero {
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

    public Parqueadero() {
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

    public void setPlazasTotales(int plazasCarro, int plazasMoto, int plazasBici) {
        this.plazasTotales = plazasCarro+plazasMoto+plazasBici;
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
    
    
    public boolean guardarParqueadero(){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "INSERT INTO parqueadero(idParqueadero, direccion, plazasTotales, plazasCarro,plazasMoto,plazasBici,"
                +"carro,moto,bici,tarifaCarro,tarifaMoto,tarifaBici)"
                +"VALUES('"+this.idParqueadero+"','"+this.direccion+"','"+ this.plazasTotales +"','"+this.plazasCarro+"','"+ this.plazasMoto + "','" + this.plazasBici
                + "',"+ "'" + this.carro + "','" + this.moto + "','" + this.bici + "','" + this.tarifaCarro + "','" 
                + this.tarifaMoto + "','" + this.tarifaBici + "');  ";
        
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
    
    public boolean borrarParqueadero(int idParqueadero){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "DELETE FROM parqueadero WHERE idParqueadero = '" + this.idParqueadero+"'";
        
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
    
    public boolean actualizarParqueadero(){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "UPDATE `parqueadero` SET direccion='" + this.direccion + "',plazasTotales='" + this.plazasTotales
                + "',plazasCarro='" + this.plazasCarro + "',plazasMoto='" + this.plazasMoto + "',plazasBici='" + this.plazasBici + "',carro='" + this.carro
                + "',moto='" + this.moto + "',bici='" + this.bici + "',tarifaCarro='" + this.tarifaCarro + "',tarifaMoto='" + this.tarifaMoto + "',tarifaBici='" + this.tarifaBici
                +  "' WHERE idParqueadero=" + this.idParqueadero + ";";
        
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
    
    public List<Parqueadero> listarParqueadero() throws SQLException{
        ConexionBD conexion = new ConexionBD();
        String sentencia = "SELECT * FROM parqueadero ORDER BY idParqueadero ASC";
        List<Parqueadero> listaParqueadero = new ArrayList<>();
        ResultSet rs = conexion.consultarBD(sentencia);
        while(rs.next()){
            Parqueadero p = new Parqueadero();
            p.setIdParqueadero(rs.getInt("idParqueadero"));
            p.setDireccion(rs.getString("direccion"));
            p.setPlazasTotales(rs.getInt("plazasCarro"),rs.getInt("plazasMoto"),rs.getInt("plazasBici"));
            p.setPlazasCarro(rs.getInt("plazasCarro"));
            p.setPlazasMoto(rs.getInt("plazasMoto"));
            p.setPlazasBici(rs.getInt("plazasBici"));
            p.setCarro(rs.getInt("carro"));
            p.setMoto(rs.getInt("moto"));
            p.setBici(rs.getInt("bici"));
            p.setTarifaCarro(rs.getInt("tarifaCarro"));
            p.setTarifaMoto(rs.getInt("tarifaMoto"));
            p.setTarifaBici(rs.getInt("tarifaBici"));
            listaParqueadero.add(p);
        }
        conexion.closeConnection();
        return listaParqueadero;        
    }
    
    public Parqueadero obtenerParqueadero() throws SQLException{
        ConexionBD conexion = new ConexionBD();
        String sentencia = "SELECT * FROM parqueadero WHERE idParqueadero ='"+idParqueadero+"'";
        ResultSet rs = conexion.consultarBD(sentencia);
        if(rs.next()){
            Parqueadero p = new Parqueadero();
            p.setIdParqueadero(rs.getInt("idParqueadero"));
            p.setDireccion(rs.getString("direccion"));
            p.setPlazasTotales(rs.getInt("plazasCarro"),rs.getInt("plazasMoto"),rs.getInt("plazasBici"));
            p.setPlazasCarro(rs.getInt("plazasCarro"));
            p.setPlazasMoto(rs.getInt("plazasMoto"));
            p.setPlazasBici(rs.getInt("plazasBici"));
            p.setCarro(rs.getInt("carro"));
            p.setMoto(rs.getInt("moto"));
            p.setBici(rs.getInt("bici"));
            p.setTarifaCarro(rs.getInt("tarifaCarro"));
            p.setTarifaMoto(rs.getInt("tarifaMoto"));
            p.setTarifaBici(rs.getInt("tarifaBici"));
            conexion.closeConnection();
            return p;
        }else{
            conexion.closeConnection();
            return null;
        }
    }
    
}
