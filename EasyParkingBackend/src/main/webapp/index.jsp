<%-- 
    Document   : index
    Created on : 17-sep-2021, 20:43:03
    Author     : tserrano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <script src = "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>
        <style>
            #liveAlertPlaceholder{
                width: 90%;
                margin: 20px auto;
            }
        </style>
    </head>
    <body>
        <div ng-app="easyParking" ng-controller="controladorParqueadero">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" ng-click="mostrarFormulario()">Guardar Parqueadero</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" ng-click="listarParqueadero()">Listar Parqueaderos</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div id="liveAlertPlaceholder"></div>
            <div class="container-fluid" ng-show="!mostrarListaParqueadero">
                <div class="row d-flex justify-content-center">
                    <div class="col-6" style="text-align: center" ng-show="!actualizar"><h1>Crear parqueadero</h1></div>
                    <div class="col-6" style="text-align: center" ng-show="actualizar"><h1>Actualizar parqueadero</h1></div>

                </div>
                <div class="row d-flex justify-content-center">
                    <div class="col-6">
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">IdParqueadero*</label>
                            <input type="text" class="form-control" placeholder="ID" ng-model="idParqueadero" ng-disabled="actualizar">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Dirección*</label>
                            <input type="text" class="form-control" placeholder="Escriba la dirección del parqueadero" ng-model="direccion">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Plazas para Carro*</label>
                            <input type="text" class="form-control" placeholder="Escriba las plazas para carro" ng-model="plazasCarro">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Plazas para moto*</label>
                            <input type="text" class="form-control" placeholder="Escriba las plazas para moto" ng-model="plazasMoto">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Plazas para Bicicleta*</label>
                            <input type="text" class="form-control" placeholder="Escriba las plazas para bicicletas" ng-model="plazasBici">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Cantidad de carros*</label>
                            <input type="text" class="form-control" placeholder="Escriba la cantidad de carros" ng-model="carro">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Cantidad de motos*</label>
                            <input type="tect" class="form-control" placeholder="Escriba la cantidad de motos" ng-model="moto">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Cantidad de bicicletas*</label>
                            <input type="text" class="form-control" placeholder="Escriba la cantidad de bicicletas" ng-model="bici">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Tarifa para carros*</label>
                            <input type="text" class="form-control" placeholder="Escriba la tarifa para carros" ng-model="tarifaCarro">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Tarifa para motos*</label>
                            <input type="text" class="form-control" placeholder="Escriba la tarifa para motos" ng-model="tarifaMoto">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Tarifa para bicicletas*</label>
                            <input type="text" class="form-control" placeholder="Escriba la tarifa para bicicletas" ng-model="tarifaBici">
                        </div>
                        <button type="button" class="btn btn-success" ng-click="guardarParqueadero()" ng-show="!actualizar">Guardar</button>
                        <button type="button" class="btn btn-success" ng-click="actualizarParqueadero()" ng-show="actualizar">Actualizar</button>

                    </div>
                </div>
            </div>
            <div class="container-fluid" ng-show="mostrarListaParqueadero">
                <div class="row d-flex justify-content-center">
                    <div class="col-6" style="text-align: center"><h1>Lista de Parqueaderos</h1></div>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Dirección</th>
                            <th scope="col">Plazas</th>
                            <th scope="col">P. Carro</th>
                            <th scope="col">P. Moto</th>
                            <th scope="col">P. Bici</th>
                            <th scope="col">Carros</th>
                            <th scope="col">Motos</th>
                            <th scope="col">Bicicletas</th>
                            <th scope="col">T. Carro</th>
                            <th scope="col">T. Moto</th>
                            <th scope="col">T. Bici</th>
                            <th scope="col">Actualizar</th>
                            <th scope="col">Borrar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="p in parqueadero">
                            <th scope="row">{{p.idParqueadero}}</th>
                            <td>{{p.direccion}}</td>
                            <td>{{p.plazasTotales}}</td>
                            <td>{{p.plazasCarro}}</td>
                            <td>{{p.plazasMoto}}</td>
                            <td>{{p.plazasBici}}</td>
                            <td>{{p.carro}}</td>
                            <td>{{p.moto}}</td>
                            <td>{{p.bici}}</td>
                            <td>{{p.tarifaCarro}}</td>
                            <td>{{p.tarifaMoto}}</td>
                            <td>{{p.tarifaBici}}</td>
                            <td style="cursor: pointer" ng-click="mostrarFormActualizar(p)">actualizar</td>
                            <td style="cursor: pointer" ng-click="abrirModal(p.idParqueadero)">borrar</td>
                        </tr>
                    </tbody>
                </table>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Borrar parqueadero</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Está seguro que desea eliminar el parqueadero?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal" ng-click="borrarParqueadero()">Eliminar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="ctrollerParqueadero.js"></script>
</html>
