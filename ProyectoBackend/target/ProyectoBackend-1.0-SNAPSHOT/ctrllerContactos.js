var app = angular.module('pruebaS57', []);

app.controller('controladorContactos', function ($scope, $http) {

    $scope.guardarContacto = function () {
        let regexNumbers = /^[0-9]*$/;

        if ($scope.identificacion === undefined || $scope.nombre === undefined) {
            alert('Todos los campos son obligatorios');
        } else if (!regexNumbers.test($scope.identificacion)) {
            alert('El número de identificación debe ser un número ');
        } else {
            console.log('Entra a guardarContacto');
            let contacto = {
                proceso: 'guardarContacto',
                identificacion: $scope.identificacion,
                nombre: $scope.nombre,
                apellido: $scope.apellido,
                genero: $scope.genero,
                tipoIdentificacion: $scope.tipoIdentificacion,
                telefono: $scope.telefono,
                direccion: $scope.direccion,
                correo: $scope.correo
            };

            $http({
                method: 'POST',
                url: 'peticionesContacto.jsp',
                params: contacto
            }).then(function (respuesta) {
                console.log(respuesta);
                if (respuesta.data.guardarContacto) {
                    alert('Guardado Exitoso');
                    $scope.listarContactos();
                } else {
                    alert('Error al guardar en la BD');
                }
            });
        }
    };

    $scope.listarContactos = function () {
        $scope.mostrarListaContactos = true;
        let params = {
            proceso: 'listarContactos'
        };

        $http({
            method: 'GET',
            url: 'peticionesContacto.jsp',
            params: params
        }).then(function (respuesta) {
            $scope.contactos = respuesta.data.Contactos;
            console.log($scope.contactos);
        });
    };

    $scope.eliminarContacto = function (identificacion) {
        let params = {
            proceso: 'eliminarContacto',
            identificacion: identificacion
        };
        $http({
            method: 'GET',
            url: 'peticionesContacto.jsp',
            params: params
        }).then(function (respuesta) {
            if (respuesta.data.eliminarContacto) {
                alert('Contacto eliminado exitosamente');
                $scope.listarContactos();
            } else {
                alert('Error al eliminar contacto');
            }

        });
    };

    $scope.mostrarFormulario = function () {
        $scope.mostrarListaContactos = false;
    };
});


