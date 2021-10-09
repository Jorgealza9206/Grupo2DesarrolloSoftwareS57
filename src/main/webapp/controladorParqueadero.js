var app = angular.module('EasyParking', []);

app.controller('controladorParqueadero', function ($scope, $http) {
$scope.inicio=true;
    $scope.crearParqueadero = function () {

        let regexNumbers = /^[0-9]*$/;

        if ($scope.nombre_parqueadero === undefined || $scope.direccion === undefined || $scope.plazasCarro === undefined
                || $scope.plazasMoto === undefined || $scope.plazasBici === undefined || $scope.tarifaCarro === undefined
                || $scope.tarifaMoto === undefined || $scope.tarifaBici === undefined) {

            alert('Todos los campos son obligatorios');

        } else if (!regexNumbers.test($scope.plazasCarro) || !regexNumbers.test($scope.plazasMoto) || !regexNumbers.test($scope.plazasBici)
                || !regexNumbers.test($scope.tarifaCarro) || !regexNumbers.test($scope.tarifaMoto) || !regexNumbers.test($scope.tarifaBici)) {
            alert('Solo números para las plazas y tarifas');
        } else {

            console.log('Entra a crear un Parqueadero');
            let parqueadero = {
                proceso: 'crearParqueadero',
                nombre_parqueadero: $scope.nombre_parqueadero,
                direccion: $scope.direccion,
                plazasCarro: $scope.plazasCarro,
                plazasMoto: $scope.plazasMoto,
                plazasBici: $scope.plazasBici,
                tarifaCarro: $scope.tarifaCarro,
                tarifaMoto: $scope.tarifaMoto,
                tarifaBici: $scope.tarifaBici
            };

            $http({
                method: 'POST',
                url: 'peticionesParqueadero.jsp',
                params: parqueadero
            }).then(function (respuesta) {
                console.log(respuesta);
                if (respuesta.data.crearParqueadero) {
                    alert('Guardado Exitoso');
                    $scope.listarParqueadero();
                } else {
                    alert('Error al guardar en la BD');
                }
            }).catch(function (error) {
                alert('Servicio no disponible, intente más tarde!');
                alert('Revise que alguno de los datos no este vacio o con espacios');
                console.log(error);
            });
        }
    };

    $scope.listarParqueadero = function () {
        $scope.listado = true;
        $scope.creacion = false;
        $scope.administrar = false;
        $scope.actualizar = false;
        $scope.inicio = false;

        let params = {
            proceso: 'listarParqueaderosCompleto'
        };

        $http({
            method: 'GET',
            url: 'peticionesParqueadero.jsp',
            params: params
        }).then(function (respuesta) {
            console.log(respuesta);
            $scope.parqueaderos = respuesta.data.Parqueadero;
            console.log($scope.parqueaderos);
        });
    };

    $scope.AdministrarParqueadero = function (idParqueadero) {
        $scope.listado = false;
        $scope.inicio = false;
        $scope.administrar = true;
        $scope.actualizar = false;
        $scope.creacion = false;
        let params = {
            proceso: 'AdministrarParqueadero',
            idParqueadero: idParqueadero 
        };

        $http({
            method: 'GET',
            url: 'peticionesParqueadero.jsp',
            params: params
        }).then(function (respuesta) {
            $scope.Parqueadero = respuesta.data.Parqueadero;
            console.log(Parqueadero);           
        });
        
        
    };

    $scope.mostrarActualizar = function (Parqueadero) {
        $scope.listado = false;
        $scope.administrar = false;
        $scope.actualizar = true;
        $scope.creacion = false;
        $scope.inicio = false;
        $scope.idParqueadero = Parqueadero.idParqueadero;
        $scope.nombre_parqueadero = Parqueadero.nombre_parqueadero;
        $scope.direccion = Parqueadero.direccion;
        $scope.plazasCarro = Parqueadero.plazasCarro;
        $scope.plazasMoto = Parqueadero.plazasMoto;
        $scope.plazasBici = Parqueadero.plazasBici;
        $scope.carro = Parqueadero.carro;
        $scope.moto = Parqueadero.moto;
        $scope.bici = Parqueadero.bici;
        $scope.tarifaCarro = Parqueadero.tarifaCarro;
        $scope.tarifaMoto = Parqueadero.tarifaMoto;
        $scope.tarifaBici = Parqueadero.tarifaBici;
    };

    $scope.borrarParqueadero = function (idParqueadero) {
        let params = {
            proceso: 'borrarParqueadero',
            idParqueadero: idParqueadero
        };
        $http({
            method: 'GET',
            url: 'peticionesParqueadero.jsp',
            params: params
        }).then(function (respuesta) {
            if (respuesta.data.borrarParqueadero) {
                alert('Parqueadero eliminado exitosamente!');
                $scope.listarParqueadero();
            } else {
                alert('Error al eliminar parqueadero');
            }

        });
    };

    $scope.actualizarParqueadero = function () {
        let params = {
            proceso: 'actualizarParqueadero',
            idParqueadero: $scope.idParqueadero,
            nombre_parqueadero: $scope.nombre_parqueadero,
            direccion: $scope.direccion,
            plazasCarro: $scope.plazasCarro,
            plazasMoto: $scope.plazasMoto,
            plazasBici: $scope.plazasBici,
            carro: $scope.carro,
            moto: $scope.moto,
            bici: $scope.bici,
            tarifaCarro: $scope.tarifaCarro,
            tarifaMoto: $scope.tarifaMoto,
            tarifaBici: $scope.tarifaBici
        };

        $http({
            method: 'GET',
            url: 'peticionesParqueadero.jsp',
            params: params
        }).then(function (respuesta) {
            if (respuesta.data.actualizarParqueadero) {
                alert('Actualización exitosa');
                //$scope.listarParqueadero();
            } else {
                alert('No se pudo actualizar');
            }
            console.log(respuesta);
        });
    };

    $scope.agregarCarro = function (idParqueadero) {
        
        let params = {
            proceso: 'agregarCarro',
            idParqueadero: idParqueadero
        };

        $http({
            method: 'GET',
            url: 'peticionesParqueadero.jsp',
            params: params
        }).then(function (respuesta) {
            if (respuesta.data.agregarCarro) {
                alert('Carro añadido con exito');
                console.log(respuesta.data.agregarCarro)
                $scope.AdministrarParqueadero(idParqueadero);
            } else {
                alert('No se pudo añadir');
            }
            console.log(respuesta);
        });
    };

    $scope.agregarMoto = function (idParqueadero) {
        
        let params = {
            proceso: 'agregarMoto',
            idParqueadero: idParqueadero
        };

        $http({
            method: 'GET',
            url: 'peticionesParqueadero.jsp',
            params: params
        }).then(function (respuesta) {
            if (respuesta.data.agregarMoto) {
                alert('Moto añadida con exito');
                $scope.AdministrarParqueadero(idParqueadero);
            } else {
                alert('No se pudo añadir');
            }
            console.log(respuesta);
        });
    };

    $scope.agregarBici = function (idParqueadero) {
        
        let params = {
            proceso: 'agregarBici',
            idParqueadero: idParqueadero
        };

        $http({
            method: 'GET',
            url: 'peticionesParqueadero.jsp',
            params: params
        }).then(function (respuesta) {
            if (respuesta.data.agregarBici) {
                alert('Bici añadida con exito');
                $scope.AdministrarParqueadero(idParqueadero);
            } else {
                alert('No se pudo añadir');
            }
            console.log(respuesta);
        });
    };


    $scope.borrarCarro = function (idParqueadero) {
        
        let params = {
            proceso: 'borrarCarro',
            idParqueadero: idParqueadero
        };

        $http({
            method: 'GET',
            url: 'peticionesParqueadero.jsp',
            params: params
        }).then(function (respuesta) {
            if (respuesta.data.borrarCarro) {
                alert('Carro eliminado con exito');
                $scope.AdministrarParqueadero(idParqueadero);
            } else {
                alert('No se pudo añadir');
            }
            console.log(respuesta);
        });
    };

    $scope.borrarMoto = function (idParqueadero) {
        
        let params = {
            proceso: 'borrarMoto',
            idParqueadero: idParqueadero
        };

        $http({
            method: 'GET',
            url: 'peticionesParqueadero.jsp',
            params: params
        }).then(function (respuesta) {
            if (respuesta.data.borrarMoto) {
                alert('Moto eliminada con exito');
                $scope.AdministrarParqueadero(idParqueadero);
            } else {
                alert('No se pudo añadir');
            }
            console.log(respuesta);
        });
    };

    $scope.borrarBici = function (idParqueadero) {
        
        let params = {
            proceso: 'borrarBici',
            idParqueadero: idParqueadero
        };

        $http({
            method: 'GET',
            url: 'peticionesParqueadero.jsp',
            params: params
        }).then(function (respuesta) {
            if (respuesta.data.borrarBici) {
                alert('Bici eliminada con exito');
                $scope.AdministrarParqueadero(idParqueadero);
            } else {
                alert('No se pudo añadir');
            }
            console.log(respuesta);
        });
    };


    $scope.mostrarCrearParqueadero = function () {
        $scope.listado = false;
        $scope.creacion = true;
        $scope.administrar = false;
        $scope.actualizar = false;
        $scope.inicio = false;
    };


});
