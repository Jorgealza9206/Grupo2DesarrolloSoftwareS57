<%-- 
    Document   : peticionesContacto
    Created on : Sep 22, 2021, 7:13:31 PM
    Author     : JORGE, CAMILO Y FREIRE
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="logica.Parqueadero"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
String respuesta = "";
String proceso = request.getParameter("proceso"); //request HTTP 
//a los request se les puede pasar parámetros
//se va a validar el tipo de proceso
Parqueadero p = new Parqueadero(); //se piden los parámetros del contacto que se quiere guardar
switch(proceso){
    case "guardarParqueadero":
        System.out.println("Guardar Parqueadero");
        p.setIdParqueadero(Integer.parseInt(request.getParameter("idParqueadero"))); //a este hay que convertirlo de entero a string
        p.setDireccion(request.getParameter("direccion"));
        p.setPlazasTotales(Integer.parseInt(request.getParameter("plazasTotales"))); //a este hay que convertirlo de entero a string
        p.setPlazasCarro(Integer.parseInt(request.getParameter("plazasCarro"))); //a este hay que convertirlo de entero a string
        p.setPlazasMoto(Integer.parseInt(request.getParameter("plazasMoto"))); //a este hay que convertirlo de entero a string
        p.setPlazasBici(Integer.parseInt(request.getParameter("plazasBici"))); //a este hay que convertirlo de entero a string
        p.setCarro(Integer.parseInt(request.getParameter("carro"))); //a este hay que convertirlo de entero a string
        p.setMoto(Integer.parseInt(request.getParameter("moto"))); //a este hay que convertirlo de entero a string
        p.setBici(Integer.parseInt(request.getParameter("bici"))); //a este hay que convertirlo de entero a string
        p.setTarifaCarro(Float.parseFloat(request.getParameter("tarifaCarro"))); //a este hay que convertirlo de entero a string
        p.setTarifaMoto(Float.parseFloat(request.getParameter("tarifaMoto"))); //a este hay que convertirlo de entero a string
        p.setTarifaBici(Float.parseFloat(request.getParameter("tarifaBici"))); //a este hay que convertirlo de entero a string 


        if(p.guardarParqueadero()){
            //si guarda bien el contacto, se concatena otros datos para el json
            respuesta += "\"" + proceso + "\": true";  // el \ se usa para concatenar en json indicando que se hizo el proceso (true)
        } else{
            respuesta += "\"" + proceso + "\": false";  // el \ se usa para concatenar en json indicando que NO se hizo el proceso (false)
        }

        break;
    case "actualizarParqueadero":
        System.out.println("Actualizar Parqueadero");
        p.setIdParqueadero(Integer.parseInt(request.getParameter("idParqueadero"))); //a este hay que convertirlo de entero a string
        p.setDireccion(request.getParameter("direccion"));
        p.setPlazasTotales(Integer.parseInt(request.getParameter("plazasTotales"))); //a este hay que convertirlo de entero a string
        p.setPlazasCarro(Integer.parseInt(request.getParameter("plazasCarro"))); //a este hay que convertirlo de entero a string
        p.setPlazasMoto(Integer.parseInt(request.getParameter("plazasMoto"))); //a este hay que convertirlo de entero a string
        p.setPlazasBici(Integer.parseInt(request.getParameter("plazasBici"))); //a este hay que convertirlo de entero a string
        p.setCarro(Integer.parseInt(request.getParameter("carro"))); //a este hay que convertirlo de entero a string
        p.setMoto(Integer.parseInt(request.getParameter("moto"))); //a este hay que convertirlo de entero a string
        p.setBici(Integer.parseInt(request.getParameter("bici"))); //a este hay que convertirlo de entero a string
        p.setTarifaCarro(Float.parseFloat(request.getParameter("tarifaCarro"))); //a este hay que convertirlo de entero a string
        p.setTarifaMoto(Float.parseFloat(request.getParameter("tarifaMoto"))); //a este hay que convertirlo de entero a string
        p.setTarifaBici(Float.parseFloat(request.getParameter("tarifaBici"))); //a este hay que convertirlo de entero a string 
        if(p.actualizarParqueadero()){
            //si guarda bien el contacto, se concatena otros datos para el json
            respuesta += "\"" + proceso + "\": true";  // el \ se usa para concatenar en json indicando que se hizo el proceso (true)
        } else{
            respuesta += "\"" + proceso + "\": false";  // el \ se usa para concatenar en json indicando que NO se hizo el proceso (false)
        }


        
        break;
    case "borrarParqueadero":
        System.out.println("Borrar Parqueadero");
        int idParqueadero = Integer.parseInt(request.getParameter("idParqueadero"));
        if(p.borrarParqueadero(idParqueadero)){
         respuesta += "\"" + proceso + "\": true";  // el \ se usa para concatenar en json indicando que se hizo el proceso (true)
        } else{
            respuesta += "\"" + proceso + "\": false";  // el \ se usa para concatenar en json indicando que NO se hizo el proceso (false)
        }
        
        break;
    case "listarParqueadero":
        System.out.println("Listar  ");
        List<Parqueadero> listaParqueadero = p.listarParqueadero();
        if(listaParqueadero.isEmpty()){
            respuesta += "\"" + proceso + "\": true,\"Parqueadero\":[]"; //genera una lista vacía en el json
        } else{
            respuesta += "\"" + proceso + "\": true,\"Parqueadero\":" + new Gson().toJson(listaParqueadero); //guarda la lista en el json
        }
        
        break;
    //case "listarUnContacto":
    //    break;
        
    default:
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";

        
}

            // cierra la respuesta
respuesta += "}";
response.setContentType("application/json;charset=iso-8859-1");
out.print(respuesta);
        

%>