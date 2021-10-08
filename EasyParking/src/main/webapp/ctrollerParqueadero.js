var app = angular.module('easyParking', []);

app.controller('controladorParqueadero', function ($scope, $http) {
    var alertPlaceholder = document.getElementById('liveAlertPlaceholder');


    function alertBootstrap(message, type) {
        var wrapper = document.createElement('div')
        wrapper.innerHTML = '<div class="alert alert-' + type + ' alert-dismissible" role="alert">' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>'

        alertPlaceholder.append(wrapper)
    }

    $scope.guardarParqueadero = function () {
        let regexNumbers = /^[0-9]*$/;

        if ($scope.idParqueadero === undefined) {
            alert('Todos los campos son obligatorios');
        } else if (!regexNumbers.test($scope.idParqueadero)) {
            alert('El número de identificación debe ser un número ');
        } else {
            console.log('Entra a guardarParqueadero');
            let parqueadero = {
                proceso: 'guardarParqueadero',
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
                method: 'POST',
                url: 'peticionesParqueaderos.jsp',
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

    $scope.listarParqueadero = function () {
        $scope.mostrarListaParqueadero = true;
        let params = {
            proceso: 'listarParqueadero'
        };

        $http({
            method: 'GET',
            url: 'peticionesParqueaderos.jsp',
            params: params
        }).then(function (respuesta) {
            $scope.parqueadero = respuesta.data.parqueadero;
            console.log($scope.parqueadero);
        });
    };

    $scope.borrarParqueadero = function () {
        let params = {
            proceso: 'borrarParqueadero',
            idParqueadero: $scope.idParaEliminar
        };
        $http({
            method: 'GET',
            url: 'peticionesParqueaderos.jsp',
            params: params
        }).then(function (respuesta) {
            if (respuesta.data.borrarParqueadero) {
                alertBootstrap('Parqueadero eliminado exitosamente!', 'success');
                //alert("Parqueadero eliminado exitosamente");
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

    $scope.mostrarFormActualizar = function (p) {
        $scope.mostrarListaParqueadero = false;
        $scope.actualizar = true;
        $scope.idParqueadero = p.idParqueadero;
        $scope.direccion = p.direccion;
        $scope.plazasCarro = p.plazasCarro;
        $scope.plazasMoto = p.plazasMoto;
        $scope.plazasBici = p.plazasBici;
        $scope.carro = p.carro;
        $scope.moto = p.moto;
        $scope.bici = p.bici;
        $scope.direccion = p.direccion;
        $scope.tarifaCarro = p.tarifaCarro;
        $scope.tarifaMoto = p.tarifaMoto;
        $scope.tarifaBici = p.tarifaBici;

    };

    $scope.abrirModal = function (id) {
        $scope.idParaEliminar = id;
        var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
            keyboard: false
        });
        myModal.show();
    };
});


