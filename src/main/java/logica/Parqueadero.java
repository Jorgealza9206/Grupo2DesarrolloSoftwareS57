/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author JORGE, CAMILO Y FREIRE
 */
public class Parqueadero {
    
    private int idParqueadero;
    private String nombre_parqueadero;
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
    
    public Parqueadero(){
    }

    public int getIdParqueadero() {
        return idParqueadero;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getNombre_parqueadero() {
        return nombre_parqueadero;
    }

    public void setNombre_parqueadero(String nombre_parqueadero) {
        this.nombre_parqueadero = nombre_parqueadero;
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

    public int getPlazasMoto() {
        return plazasMoto;
    }

    public int getPlazasBici() {
        return plazasBici;
    }

    public int getCarro() {
        return carro;
    }

    public int getMoto() {
        return moto;
    }

    public int getBici() {
        return bici;
    }

    public float getTarifaCarro() {
        return tarifaCarro;
    }

    public float getTarifaMoto() {
        return tarifaMoto;
    }

    public float getTarifaBici() {
        return tarifaBici;
    }

    public void setIdParqueadero(int idParqueadero) {
        this.idParqueadero = idParqueadero;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }


    
    public void setPlazasCarro(int plazasCarro) {
        this.plazasCarro = plazasCarro;
    }

    public void setPlazasMoto(int plazasMoto) {
        this.plazasMoto = plazasMoto;
    }

    public void setPlazasBici(int plazasBici) {
        this.plazasBici = plazasBici;
    }

    public void setCarro(int carro) {
        this.carro = carro;
    }

    public void setMoto(int moto) {
        this.moto = moto;
    }

    public void setBici(int bici) {
        this.bici = bici;
    }

    public void setTarifaCarro(float tarifaCarro) {
        this.tarifaCarro = tarifaCarro;
    }

    public void setTarifaMoto(float tarifaMoto) {
        this.tarifaMoto = tarifaMoto;
    }

    public void setTarifaBici(float tarifaBici) {
        this.tarifaBici = tarifaBici;
    }
    
    //metodos para el CRUD de Contacto
    
    public boolean guardarParqueadero(){
        ConexionBD conexion = new ConexionBD();
        this.plazasTotales = this.plazasCarro + this.plazasMoto + this.plazasBici;
        String sentencia = "INSERT INTO parqueadero(idParqueadero, nombre_parqueadero, direccion, plazasTotales, plazasCarro, plazasMoto, plazasBici, carro, moto, bici, tarifaCarro, tarifaMoto, tarifaBici)"
                + " VALUES ('" + this.idParqueadero + "','"+ this.nombre_parqueadero + "','" + this.direccion + "',"
                + "'" + this.plazasTotales + "','" + this.plazasCarro + "','" + this.plazasMoto + "',"
                + "'" + this.plazasBici + "','" + this.carro + "','" + this.moto + "','" + this.bici + "',"
                + "'" + this.tarifaCarro + "','" + this.tarifaMoto + "','" + this.tarifaBici + "');  ";
        //Vamos a configurar el setAutocommit de la conexionBD a falso
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.insertarBD(sentencia)) {
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else { //si no logro insertar en la BD
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }
        } else {
            conexion.closeConnection();
            return false;
        }
    }
    
    public boolean borrarParqueadero(int idParqueadero){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "DELETE FROM parqueadero WHERE idParqueadero = '" + idParqueadero + "'";
        if(conexion.setAutoCommitBD(false)){
            if(conexion.borrarBD(sentencia)){
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else{
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }
        } else {
            conexion.closeConnection();
            return false;
        }
    }
    
    public boolean actualizarParqueadero(){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "UPDATE parqueadero SET nombre_parqueadero='" + this.nombre_parqueadero + "',direccion='" + this.direccion + "',plazasTotales='" + (this.plazasCarro+this.plazasMoto+this.plazasBici) + "',plazasCarro='" + this.plazasCarro
                + "',plazasMoto='" + this.plazasMoto + "',plazasBici='" + this.plazasBici + "',carro='" + this.carro + "',moto='" + this.moto
                + "',bici='" + this.bici + "',tarifaCarro='" + this.tarifaCarro + "',tarifaMoto='" + this.tarifaMoto + "',tarifaBici='" + this.tarifaBici
                +  "' WHERE idParqueadero=" + this.idParqueadero + ";";

        if(conexion.setAutoCommitBD(false)){
            if(conexion.actualizarBD(sentencia)){
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else{
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }
           
        } else{
            conexion.closeConnection();
            return false;
        }
    }

    public boolean agregarCarro() {
        ConexionBD conexion = new ConexionBD();
        String sentencia = "UPDATE parqueadero SET carro=carro+1 WHERE idParqueadero=" + this.idParqueadero + " AND plazasCarro>carro;";

        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sentencia)) {
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }

        } else {
            conexion.closeConnection();
            return false;
        }
    }

    public boolean agregarMoto() {
        ConexionBD conexion = new ConexionBD();
        String sentencia = "UPDATE parqueadero SET moto=moto+1 WHERE idParqueadero=" + this.idParqueadero + " AND plazasMoto>moto;";

        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sentencia)) {
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }

        } else {
            conexion.closeConnection();
            return false;
        }
    }

    public boolean agregarBici() {
        ConexionBD conexion = new ConexionBD();
        String sentencia = "UPDATE parqueadero SET bici=bici+1 WHERE idParqueadero=" + this.idParqueadero + " AND plazasBici>bici;";

        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sentencia)) {
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }

        } else {
            conexion.closeConnection();
            return false;
        }
    }

    public boolean borrarCarro() {
        ConexionBD conexion = new ConexionBD();
        String sentencia = "UPDATE parqueadero SET carro=carro-1 WHERE idParqueadero=" + this.idParqueadero + " AND carro>'0';";

        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sentencia)) {
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }

        } else {
            conexion.closeConnection();
            return false;
        }
    }

    public boolean borrarMoto() {
        ConexionBD conexion = new ConexionBD();
        String sentencia = "UPDATE parqueadero SET moto=moto-1 WHERE idParqueadero=" + this.idParqueadero + " AND moto>'0';";

        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sentencia)) {
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }

        } else {
            conexion.closeConnection();
            return false;
        }
    }

    public boolean borrarBici() {
        ConexionBD conexion = new ConexionBD();
        String sentencia = "UPDATE parqueadero SET bici=bici-1 WHERE idParqueadero=" + this.idParqueadero + " AND bici>'0';";

        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sentencia)) {
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }

        } else {
            conexion.closeConnection();
            return false;
        }
    }

    public List<Parqueadero> listarParqueaderoCompleto() throws SQLException{
        ConexionBD conexion = new ConexionBD();
        String sentencia = "SELECT * FROM parqueadero ORDER BY idParqueadero ASC;";
        List<Parqueadero> listaParqueaderos = new ArrayList<>();
        ResultSet datos = conexion.consultarBD(sentencia);
        
        Parqueadero parqueadero;
        while (datos.next()) {
            parqueadero = new Parqueadero();
            parqueadero.setIdParqueadero(datos.getInt("idParqueadero"));
            parqueadero.setNombre_parqueadero(datos.getString("nombre_parqueadero"));
            parqueadero.setDireccion(datos.getString("direccion"));
            parqueadero.setPlazasTotales(datos.getInt("plazasTotales"));
            parqueadero.setPlazasCarro(datos.getInt("plazasCarro"));
            parqueadero.setPlazasMoto(datos.getInt("plazasMoto"));
            parqueadero.setPlazasBici(datos.getInt("plazasBici"));
            parqueadero.setCarro(datos.getInt("carro"));
            parqueadero.setMoto(datos.getInt("moto"));
            parqueadero.setBici(datos.getInt("bici"));
            parqueadero.setTarifaCarro(datos.getFloat("tarifaCarro"));
            parqueadero.setTarifaMoto(datos.getFloat("tarifaMoto"));
            parqueadero.setTarifaBici(datos.getFloat("tarifaBici"));
            
            listaParqueaderos.add(parqueadero);
            
        }
        conexion.closeConnection();
        return listaParqueaderos;
    }

    public List<Parqueadero> obtenerParqueadero(int idParqueadero) throws SQLException {
        ConexionBD conexion = new ConexionBD();
        String sentencia = "SELECT * FROM parqueadero WHERE idParqueadero='" + idParqueadero + "';";
        List<Parqueadero> listaParqueaderos = new ArrayList<>();
        ResultSet datos = conexion.consultarBD(sentencia);

        Parqueadero parqueadero;
        while (datos.next()) {
            parqueadero = new Parqueadero();
            parqueadero.setIdParqueadero(datos.getInt("idParqueadero"));
            parqueadero.setNombre_parqueadero(datos.getString("nombre_parqueadero"));
            parqueadero.setDireccion(datos.getString("direccion"));
            parqueadero.setPlazasTotales(datos.getInt("plazasTotales"));
            parqueadero.setPlazasCarro(datos.getInt("plazasCarro"));
            parqueadero.setPlazasMoto(datos.getInt("plazasMoto"));
            parqueadero.setPlazasBici(datos.getInt("plazasBici"));
            parqueadero.setCarro(datos.getInt("carro"));
            parqueadero.setMoto(datos.getInt("moto"));
            parqueadero.setBici(datos.getInt("bici"));
            parqueadero.setTarifaCarro(datos.getFloat("tarifaCarro"));
            parqueadero.setTarifaMoto(datos.getFloat("tarifaMoto"));
            parqueadero.setTarifaBici(datos.getFloat("tarifaBici"));

            listaParqueaderos.add(parqueadero);

        }
        conexion.closeConnection();
        return listaParqueaderos;
    }
 
    public Parqueadero obtenerParqueadero2(int idParqueadero) throws SQLException{
        ConexionBD conexion = new ConexionBD();
        String sentencia = "SELECT * FROM parqueadero WHERE idParqueadero='" + idParqueadero + "';";
        ResultSet datos = conexion.consultarBD(sentencia);
        if(datos.next()){
            Parqueadero parqueadero = new Parqueadero();
            parqueadero.setIdParqueadero(datos.getInt("idParqueadero"));
            parqueadero.setNombre_parqueadero(datos.getString("nombre_parqueadero"));
            
            parqueadero.setDireccion(datos.getString("direccion"));
            parqueadero.setPlazasTotales(datos.getInt("plazasTotales"));
            parqueadero.setPlazasCarro(datos.getInt("plazasCarro"));
            parqueadero.setPlazasMoto(datos.getInt("plazasMoto"));
            parqueadero.setPlazasBici(datos.getInt("plazasBici"));
            parqueadero.setCarro(datos.getInt("carro"));
            parqueadero.setMoto(datos.getInt("moto"));
            parqueadero.setBici(datos.getInt("bici"));
            parqueadero.setTarifaCarro(datos.getFloat("tarifaCarro"));
            parqueadero.setTarifaMoto(datos.getFloat("tarifaMoto"));
            parqueadero.setTarifaBici(datos.getFloat("tarifaBici"));
            return parqueadero;
        } else{
            conexion.closeConnection();
            return null; //no había contacto
        }
    
    }
}
