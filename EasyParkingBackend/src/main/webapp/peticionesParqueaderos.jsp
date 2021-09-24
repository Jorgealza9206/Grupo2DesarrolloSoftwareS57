<%-- 
    Document   : peticionesParqueaderos
    Created on : 23/09/2021, 03:15:49 PM
    Author     : CAMILO
--%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="logica.Parqueaderos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


Hola Mundo

<% 
    String respuesta =  "{";
    String proceso = request.getParameter("proceso");
    Parqueaderos c = new Parqueaderos(); //se piden los parámetros del contacto que se quiere guardar
    
    switch(proceso){
        case "guardarParqueaderos":
            System.out.println("Guardar Parqueadero");
            c.setIdParqueadero(Integer.parseInt(request.getParameter("idParqueadero")));
            c.setDireccion(request.getParameter("direccion"));
            c.setPlazasTotales(Integer.parseInt(request.getParameter("plazasTotales")));
            c.setPlazasCarro(Integer.parseInt(request.getParameter("plazasCarro")));
            c.setPlazasMoto(Integer.parseInt(request.getParameter("plazasMoto")));
            c.setPlazasBici(Integer.parseInt(request.getParameter("plazasBici")));
            c.setCarro(Integer.parseInt(request.getParameter("carro")));
            c.setMoto(Integer.parseInt(request.getParameter("moto")));
            c.setBici(Integer.parseInt(request.getParameter("bici")));
            c.setTarifaCarro(Float.parseFloat(request.getParameter("tarifaCarro")));
            c.setTarifaMoto(Float.parseFloat(request.getParameter("tarifaMoto")));
            c.setTarifaBici(Float.parseFloat(request.getParameter("tarifaBici")));

            if(c.guardarParqueaderos()){
                //si guarda bien el contacto, se concatena otros datos para el json
                respuesta += "\"" + proceso + "\": true";  // el \ se usa para concatenar en json indicando que se hizo el proceso (true)
            } else{
                respuesta += "\"" + proceso + "\": false";  // el \ se usa para concatenar en json indicando que NO se hizo el proceso (false)
            }

            break;
        case "actualizarParqueaderos":

            System.out.println("Actualizar Parqueaderos");
            c.setIdParqueadero(Integer.parseInt(request.getParameter("idParqueadero")));//a este hay que convertirlo de entero a string
            c.setDireccion(request.getParameter("direccion"));
            c.setPlazasTotales(Integer.parseInt(request.getParameter("PlazasTotales")));
            c.setPlazasCarro(Integer.parseInt(request.getParameter("PlazasCarro")));
            c.setPlazasMoto(Integer.parseInt(request.getParameter("PlazasMoto")));
            c.setPlazasBici(Integer.parseInt(request.getParameter("PlazasBici")));
            c.setCarro(Integer.parseInt(request.getParameter("carro")));
            c.setMoto(Integer.parseInt(request.getParameter("moto")));
            c.setBici(Integer.parseInt(request.getParameter("bici")));
            c.setTarifaCarro(Float.parseFloat(request.getParameter("tarifaCarro")));
            c.setTarifaMoto(Float.parseFloat(request.getParameter("tarifaMoto")));
            c.setTarifaBici(Float.parseFloat(request.getParameter("tarifaBici")));

            if(c.actualizarParqueaderos()){
                //si guarda bien el contacto, se concatena otros datos para el json
                respuesta += "\"" + proceso + "\": true";  // el \ se usa para concatenar en json indicando que se hizo el proceso (true)
            } else{
                respuesta += "\"" + proceso + "\": false";  // el \ se usa para concatenar en json indicando que NO se hizo el proceso (false)
            }



            break;
        case "eliminarParqueaderos":
            System.out.println("Eliminar contacto");
            int idParqueadero = Integer.parseInt(request.getParameter("idParqueadero"));
            if(c.borrarParqueaderos(idParqueadero)){
             respuesta += "\"" + proceso + "\": true";  // el \ se usa para concatenar en json indicando que se hizo el proceso (true)
            } else{
                respuesta += "\"" + proceso + "\": false";  // el \ se usa para concatenar en json indicando que NO se hizo el proceso (false)
            }

            break;
        case "listarParquederos":
            System.out.println("Listar Parquederos");
            List<Parqueaderos> listaParqueaderos = c.listarParqueaderos();
            if(listaParqueaderos.isEmpty()){
                respuesta += "\"" + proceso + "\": true,\"parqueadero\":[]"; //genera una lista vacía en el json
            } else{
                respuesta += "\"" + proceso + "\": true,\"parqueadero\":" + new Gson().toJson(listaParqueaderos); //guarda la lista en el json
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