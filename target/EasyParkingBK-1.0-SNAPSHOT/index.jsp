<%-- 
    Document   : index
    Created on : 7 oct. 2021, 15:06:13
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
    <title>Easy Parking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous"/>
    <script src = "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"      rel="stylesheet">



    <!-- add icon link -->

    <link rel = "icon" type = "image/png" href = "https://img.icons8.com/external-wanicon-lineal-color-wanicon/64/000000/external-parking-hotel-wanicon-lineal-color-wanicon.png">
    <link rel="stylesheet" href="style.css" type="text/css"/>

    <!--<link rel="shortcut icon" href="https://img.icons8.com/external-wanicon-lineal-color-wanicon/64/000000/external-parking-hotel-wanicon-lineal-color-wanicon.png" type="image/x-icon">
    <link rel = "icon" href ="https://img.icons8.com/external-wanicon-lineal-color-wanicon/64/000000/external-parking-hotel-wanicon-lineal-color-wanicon.png"
          type = "image/x-icon">-->



    <body>
        <div class="container fluid" ng-app="EasyParking" ng-controller="controladorParqueadero">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">
                        <img src="https://img.icons8.com/external-wanicon-lineal-color-wanicon/64/000000/external-parking-hotel-wanicon-lineal-color-wanicon.png" alt="" width="50" height="50">
                    </a>
                    <a class="navbar-brand" href="#" ng-show="inicio">EasyParking</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">

                            <li class="nav-item">
                                <a class="nav-link" href="#" ng-click="mostrarCrearParqueadero()">Crear un Nuevo Parqueadero</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" ng-click="listarParqueadero()">Ver Listado de Parqueaderos</a>
                            </li>

                        </ul>
                    </div>
                </div>
            </nav>
            
            <div class="row auto mb-3" ng-show="inicio">
                <div class="row-auto"><h1 class="align-middle"></h1><h1></h1></div>
                <div class="row-auto"><h1></h1></div>
                <div class="col-auto"><h1>BIENVENIDO A EASYPARKING</h1>
                <div class="lead"><h2>Seleccione una de las opciones de la barra de navegación</h2></div>
                
                <img src="https://www.enter.co/wp-content/uploads/2019/07/spot-parking-1-768x432.jpg" class="img-thumbnail align-middle">
                </div>
                

            </div>

            <div class="container fluid" ng-show="creacion">
                <div class="row auto mb-3">

                </div>
                <div class="col-auto" style="text-align: center"><h1 style="text-align: center">Crear un Parqueadero</h1></div>
                <div class="row g-3 d-flex justify-content-center">

                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Nombre del Parqueadero *</label>
                        <input type="text" class="form-control" placeholder="Nombre del Parqueadero" ng-model="nombre_parqueadero">
                    </div>

                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Dirección del Parqueadero *</label>
                        <input type="text" class="form-control" placeholder="Carrera/Calle ## Calle/Carrea ## - ## Barrio Ciudad" ng-model="direccion">
                    </div>

                    <div class="mb-3">

                    </div>

                    <div class="col-auto mb-3"> 

                        <div class="row-auto mb-3">
                            <span class="material-icons md-48">drive_eta</span>
                        </div>

                        <div class="row-auto mb-3">
                            <span class="material-icons md-48">two_wheeler</span>
                        </div>

                        <div class="row-auto mb-3">
                            <span class="material-icons md-48">directions_bike</span>
                        </div>

                    </div>

                    <div class="col-auto mb-3">

                        <div class="row-auto mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Número de plazas para Autos * </label>
                        </div>

                        <div class="row-auto mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Número de plazas para Motocicletas * </label>
                        </div>

                        <div class="row-auto mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Número de plazas para Bicicletas * </label>
                        </div>

                    </div>

                    <div class="col-auto mb-3">

                        <div class="row-auto mb-3">
                            <input type="text" class="form-control justify-content-center" id="exampleFormControlInput1" value="0" ng-model="plazasCarro">
                        </div>

                        <div class="row-auto mb-3">
                            <input type="text" class="form-control" id="exampleFormControlInput1" value="0" ng-model="plazasMoto">
                        </div>

                        <div class="row-auto mb-3">
                            <input type="text" class="form-control" id="exampleFormControlInput1" value="0" ng-model="plazasBici">
                        </div>

                    </div>

                    <div class="col-auto mb-3"> 

                        <div class="row-auto mb-3">
                            <span class="material-icons md-48">euro_symbol</span>
                        </div>

                        <div class="row-auto mb-3">
                            <span class="material-icons md-48">euro_symbol</span>
                        </div>

                        <div class="row-auto mb-3">
                            <span class="material-icons md-48">euro_symbol</span>
                        </div>

                    </div>



                    <div class="col-auto mb-3">

                        <div class="row-auto mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Tarifa hora/fracción Automoviles * </label>
                        </div>

                        <div class="row-auto mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Tarifa hora/fracción Motocicletas * </label>
                        </div>

                        <div class="row-auto mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Tarifa hora/fracción Bicicletas * </label>
                        </div>

                    </div>

                    <div class="col-auto mb-3">

                        <div class="row-auto mb-3">
                            <input type="text" class="form-control" id="exampleFormControlInput1"  ng-model="tarifaCarro" value="0">
                        </div>

                        <div class="row-auto mb-3">
                            <input type="text" class="form-control" id="exampleFormControlInput1" value="0" ng-model="tarifaMoto">
                        </div>

                        <div class="row-auto mb-3">
                            <input type="text" class="form-control" id="exampleFormControlInput1" value="0" ng-model="tarifaBici">
                        </div>

                    </div>

                    <div class="d-grid gap-2 d-md-block">
                        <button class="btn btn-primary" type="button" ng-click="crearParqueadero()">CREAR UN PARQUEADERO</button>
                    </div>


                </div>

            </div>

            <div class="container fluid" ng-show="listado">

                <div class="col-auto" style="text-align: center"><h1 style="text-align: center">Lista de Parqueaderos creados</h1></div>
                <div class="row-auto" style="text-align: center"></div>
                <table class="table table-striped ">
                    <thead>
                        <tr class="table align-middle">
                            <th scope="col">Administrar</th>
                            <th scope="col">Nombre del Parqueadero</th>
                            <th scope="col">Dirección</th>
                            <th scope="col">Plazas Totales</th>
                            <th scope="col">Plazas para Autos</th>
                            <th scope="col">Plazas para Motos</th>
                            <th scope="col">Plazas para Bici</th>
                            <th scope="col">Autos estacionados</th>
                            <th scope="col">Motos estacionadas</th>
                            <th scope="col">Bicicletas estacionadas</th>
                            <th scope="col">Tarifa Autos</th>
                            <th scope="col">Tarifa Motocicletas</th>
                            <th scope="col">Tarifa Bicicletas</th>
                            <th scope="col">Borrar</th>
                            <th scope="col">Actualizar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="table align-middle" ng-repeat="parqueadero in parqueaderos">
                            <th scope="row" style="cursor: pointer" ng-click="AdministrarParqueadero(parqueadero.idParqueadero)"><span class="material-icons">settings</span></th>
                            <th>{{parqueadero.nombre_parqueadero}}</th>
                            <td>{{parqueadero.direccion}}</td>
                            <td>{{parqueadero.plazasTotales}}</td>
                            <td>{{parqueadero.plazasCarro}}</td>
                            <td>{{parqueadero.plazasMoto}}</td>
                            <td>{{parqueadero.plazasBici}}</td>
                            <td>{{parqueadero.carro}}</td>
                            <td>{{parqueadero.moto}}</td>
                            <td>{{parqueadero.bici}}</td>
                            <td>{{parqueadero.tarifaCarro}}</td> 
                            <td>{{parqueadero.tarifaMoto}}</td> 
                            <td>{{parqueadero.tarifaBici}}</td>
                            <th scope="row" style="cursor: pointer" ng-click="borrarParqueadero(parqueadero.idParqueadero)"><span class="material-icons">delete</span>
                            <th scope="row" style="cursor: pointer" ng-click="mostrarActualizar(parqueadero)"><span class="material-icons">update</span>
                    </tbody>
                </table>



            </div>

            <div class="container-fluid" ng-show="actualizar">

                <div class="container fluid" >
                    <div class="row auto mb-3">

                    </div>
                    <div class="col-auto" style="text-align: center"><h1 style="text-align: center">Actualizar información del Parqueadero</h1></div>
                    <div class="row g-3 d-flex justify-content-center">

                        <div class="mb-3">
                            <input type="text" class="form-control" placeholder="Nombre del Parqueadero" ng-model="idParqueadero" ng-hide="true">
                            <input type="text" class="form-control" placeholder="Nombre del Parqueadero" ng-model="carro" ng-hide="true">
                            <input type="text" class="form-control" placeholder="Nombre del Parqueadero" ng-model="moto" ng-hide="true">
                            <input type="text" class="form-control" placeholder="Nombre del Parqueadero" ng-model="bici" ng-hide="true">
                        </div>



                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label" >Nombre del Parqueadero *</label>
                            <input type="text" class="form-control" placeholder="Nombre del Parqueadero" ng-model="nombre_parqueadero">
                        </div>

                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Dirección del Parqueadero *</label>
                            <input type="text" class="form-control" placeholder="Carrera/Calle ## Calle/Carrea ## - ## Barrio Ciudad" ng-model="direccion">
                        </div>

                        <div class="mb-3">

                        </div>

                        <div class="col-auto mb-3"> 

                            <div class="row-auto mb-3">
                                <span class="material-icons md-48">drive_eta</span>
                            </div>

                            <div class="row-auto mb-3">
                                <span class="material-icons md-48">two_wheeler</span>
                            </div>

                            <div class="row-auto mb-3">
                                <span class="material-icons md-48">directions_bike</span>
                            </div>

                        </div>

                        <div class="col-auto mb-3">

                            <div class="row-auto mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Número de plazas para Autos * </label>
                            </div>

                            <div class="row-auto mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Número de plazas para Motocicletas * </label>
                            </div>

                            <div class="row-auto mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Número de plazas para Bicicletas * </label>
                            </div>

                        </div>

                        <div class="col-auto mb-3">

                            <div class="row-auto mb-3">
                                <input type="text" class="form-control justify-content-center" id="exampleFormControlInput1" value="0" ng-model="plazasCarro">
                            </div>

                            <div class="row-auto mb-3">
                                <input type="text" class="form-control" id="exampleFormControlInput1" value="0" ng-model="plazasMoto">
                            </div>

                            <div class="row-auto mb-3">
                                <input type="text" class="form-control" id="exampleFormControlInput1" value="0" ng-model="plazasBici">
                            </div>

                        </div>

                        <div class="col-auto mb-3"> 

                            <div class="row-auto mb-3">
                                <span class="material-icons md-48">euro_symbol</span>
                            </div>

                            <div class="row-auto mb-3">
                                <span class="material-icons md-48">euro_symbol</span>
                            </div>

                            <div class="row-auto mb-3">
                                <span class="material-icons md-48">euro_symbol</span>
                            </div>

                        </div>



                        <div class="col-auto mb-3">

                            <div class="row-auto mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Tarifa hora/fracción Automoviles * </label>
                            </div>

                            <div class="row-auto mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Tarifa hora/fracción Motocicletas * </label>
                            </div>

                            <div class="row-auto mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Tarifa hora/fracción Bicicletas * </label>
                            </div>

                        </div>

                        <div class="col-auto mb-3">

                            <div class="row-auto mb-3">
                                <input type="text" class="form-control" id="exampleFormControlInput1"  ng-model="tarifaCarro" value="0">
                            </div>

                            <div class="row-auto mb-3">
                                <input type="text" class="form-control" id="exampleFormControlInput1" value="0" ng-model="tarifaMoto">
                            </div>

                            <div class="row-auto mb-3">
                                <input type="text" class="form-control" id="exampleFormControlInput1" value="0" ng-model="tarifaBici">
                            </div>

                        </div>

                        <div class="d-grid gap-2 d-md-block">
                            <button class="btn btn-primary" type="button" ng-click="actualizarParqueadero()">Actualizar Datos</button>
                        </div>


                    </div>

                </div>


            </div>


            <div class="container-fluid" ng-repeat="parqueadero in Parqueadero" ng-show="administrar">

                <div class="container fluid" >
                    <div class="row auto mb-3">
                        <p>{{parqueadero.idParqueadero}}</p>

                    </div>

                    <div class="mb-3">
                        <input type="text" class="form-control" placeholder="Nombre del Parqueadero" ng-model="idParqueadero" ng-hide="true">
                    </div>
                    <div class="mb-3"></div>
                    <div class="col-auto" style="text-align: center"><h1 style="text-align: center">Administrando Parqueadero: {{parqueadero.nombre_parqueadero}}</h1></div>
                    <div class="row g-3 d-flex justify-content-center table-responsive">

                        <div class="mb-3"></div>

                        <div class="mb-3">
                            <h2>Dirección: {{parqueadero.direccion}}</h2>
                        </div>


                        <div class="mb-3"></div>


                        <table class="table table-sm table-striped">
                            <tbody>
                                <tr class="table align-middle">
                                    <th> <span class="material-icons md-48">drive_eta</span> </th>
                                    <td><h2>Plazas Ocupadas para Autos </h2></td>
                                    <td><h2>{{parqueadero.plazasCarro}}</h2></td>
                                    <td><span class="material-icons md-48">euro_symbol</span></td>
                                    <td><h2>Tarifa fracción/hora Autos:</h2></td>
                                    <td><h2>{{parqueadero.tarifaCarro}}</h2></td>
                                </tr>
                                <tr class="table align-middle">
                                    <th> <span class="material-icons md-48">two_wheeler</span> </th>
                                    <td><h2>Plazas Ocupadas para Motos:</h2></td>
                                    <td><h2>{{parqueadero.plazasMoto}}</h2></td>
                                    <td><span class="material-icons md-48">euro_symbol</span></td>
                                    <td><h2>Tarifa fracción/hora Motos:</h2></td>
                                    <td><h2>{{parqueadero.tarifaMoto}}</h2></td>
                                </tr>

                                <tr class="table align-middle">
                                    <th> <span class="material-icons md-48">directions_bike</span> </th>
                                    <td><h2>Plazas Ocupadas para Bicicletas:</h2></td>
                                    <td><h2>{{parqueadero.plazasBici}}</h2></td>
                                    <td><span class="material-icons md-48">euro_symbol</span></td>
                                    <td><h2>Tarifa fracción/hora Bicis:</h2></td>
                                    <td><h2>{{parqueadero.tarifaBici}}</h2></td>
                                </tr>

                            </tbody>
                        </table>

                        <table class="table">

                            <tbody>
                                <tr>
                                    <th scope="row">Número de plazas disponibles para Autos: </th>
                                    <td>{{parqueadero.carro}}</td>
                                    <td><button class="btn btn-primary" type="button" ng-click="agregarCarro(parqueadero.idParqueadero)">Entrada Carro</button></td>
                                    <td><button class="btn btn-primary" type="button" ng-click="borrarCarro(parqueadero.idParqueadero)">salida Carro</button></td>
                                </tr>

                                <tr>
                                    <th scope="row">Número de plazas disponibles para Motocicletas: </th>
                                    <td>{{parqueadero.moto}}</td>
                                    <td><button class="btn btn-primary" type="button" ng-click="agregarMoto(parqueadero.idParqueadero)">Entrada Motocicleta</button></td>
                                    <td><button class="btn btn-primary" type="button" ng-click="borrarMoto(parqueadero.idParqueadero)">salida Motocicleta</button></td>
                                </tr>

                                <tr>
                                    <th scope="row">Número de plazas disponibles para Bicicletas: </th>
                                    <td>{{parqueadero.bici}}</td>
                                    <td><button class="btn btn-primary" type="button" ng-click="agregarBici(parqueadero.idParqueadero)">Entrada Bici</button></td>
                                    <td><button class="btn btn-primary" type="button" ng-click="borrarBici(parqueadero.idParqueadero)">salida Bici</button></td>
                                </tr>



                            </tbody>
                        </table>


                    </div>

                </div>

            </div>


        </div>
    </body>
    <script src="controladorParqueadero.js"></script>
</html>