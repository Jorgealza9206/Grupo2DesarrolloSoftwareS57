var app = angular.module('EasyParking', []);

app.controller('controladorParqueadero', function ($scope, $http) {
    var alertPlaceholder = document.getElementById('liveAlertPlaceholder');


    function alertBootstrap(message, type) {
        var wrapper = document.createElement('div')
        wrapper.innerHTML = '<div class="alert alert-' + type + ' alert-dismissible" role="alert">' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>'

        alertPlaceholder.append(wrapper)
    }

    $scope.guardarParqueadero = function () {
        let regexNumbers = /^[0-9]*$/;

        if ($scope.nombre_parqueadero === undefined) {
            alert('Todos los campos son obligatorios');
        } else {
            console.log('Entra a guardarParqueadero');
            let parqueadero = {
                proceso: 'guardarParqueadero',
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
                method: 'POST',
                url: 'peticionesParqueadero.jsp',
                params: parqueadero
            }).then(function (respuesta) {
                console.log(respuesta);
                if (respuesta.data.guardarParqueadero) {
                    alert('Guardado Exitoso');
                    $scope.listarParqueadero();
                } else {
                    alert('Error al guardar en la BD');
                }
            }).catch(function (error) {
                alert('Servicio no disponible, intente más tarde!');
                console.log(error);
            });
        }
    };
    
    $scope.crearParqueadero = function () {
        let regexNumbers = /^[0-9]*$/;

        if ($scope.nombre_parqueadero === undefined || $scope.direccion === undefined || $scope.plazasCarro === undefined
                || $scope.plazasMoto === undefined  || $scope.plazasBici === undefined || $scope.tarifaCarro === undefined
                || $scope.tarifaMoto === undefined  || $scope.tarifaBici === undefined) {
            
            alert('Todos los campos son obligatorios');
        
        } 
        else if (!regexNumbers.test($scope.plazasCarro) || !regexNumbers.test($scope.plazasMoto)  || !regexNumbers.test($scope.plazasBici)
                || !regexNumbers.test($scope.tarifaCarro) || !regexNumbers.test($scope.tarifaMoto)   || !regexNumbers.test($scope.tarifaBici )) {
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
        $scope.mostrarParqueaderoscreados = true;
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
            url: 'peticionesParqueaderos.jsp',
            params: params
        }).then(function (respuesta) {
            if (respuesta.data.actualizarParqueadero) {
                alert('Actualización exitosa');
                $scope.listarParqueadero();
            } else {
                alert('No se pudo actualizar');
            }
            console.log(respuesta);
        });
    };

    $scope.mostrarFormulario = function () {
        $scope.mostrarListaParqueadero = false;
        $scope.actualizar = false;
    };

    $scope.mostrarCrearParqueadero = function () {
        $scope.mostrarParqueaderoscreados = false;
    };

    $scope.abrirModal = function (id) {
        $scope.idParaEliminar = id;
        var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
            keyboard: false
        });
        myModal.show();
    };
});
