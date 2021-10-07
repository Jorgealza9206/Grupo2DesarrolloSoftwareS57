var app = angular.module('pruebaS57', []);

app.controller('controladorContactos', function ($scope, $http) {
    var alertPlaceholder = document.getElementById('liveAlertPlaceholder');
    

    function alertBootstrap(message, type) {
        var wrapper = document.createElement('div')
        wrapper.innerHTML = '<div class="alert alert-' + type + ' alert-dismissible" role="alert">' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>'

        alertPlaceholder.append(wrapper)
    }

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
            }).catch(function (error) {
                alert('Servicio no disponible, intente más tarde!');
                console.log(error);
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

    $scope.borrarContacto = function () {
        let params = {
            proceso: 'borrarContacto',
            identificacion: $scope.idParaEliminar
        };
        $http({
            method: 'GET',
            url: 'peticionesContacto.jsp',
            params: params
        }).then(function (respuesta) {
            if (respuesta.data.eliminarContacto) {
                alertBootstrap('Contacto eliminado exitosamente!', 'success');
                $scope.listarContactos();
            } else {
                alert('Error al eliminar contacto');
            }

        });
    };

    $scope.actualizarContacto = function () {
        let params = {
            proceso: 'actualizarContacto',
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
            method: 'GET',
            url: 'peticionesContacto.jsp',
            params: params
        }).then(function (respuesta) {
            if (respuesta.data.actualizarContacto) {
                alert('Actualización exitosa');
                $scope.listarContactos();
            } else {
                alert('No se pudo actualizar');
            }
            console.log(respuesta);
        });
    };

    $scope.mostrarFormulario = function () {
        $scope.mostrarListaContactos = false;
        $scope.actualizar = false;
    };

    $scope.mostrarFormActualizar = function (contacto) {
        $scope.mostrarListaContactos = false;
        $scope.actualizar = true;
        $scope.identificacion = contacto.identificacion;
        $scope.nombre = contacto.nombre;
        $scope.apellido = contacto.apellido;
        $scope.genero = contacto.genero;
        $scope.tipoIdentificacion = contacto.tipoIdentificacion;
        $scope.telefono = contacto.telefono;
        $scope.direccion = contacto.direccion;
        $scope.correo = contacto.correo;
    };

    $scope.abrirModal = function (identificacion) {
        $scope.idParaEliminar = identificacion;
        var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
            keyboard: false
        });
        myModal.show();
    };
});


