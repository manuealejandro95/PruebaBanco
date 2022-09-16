$(document).ready(function () {
    $('#formu').submit(function (e) {
        e.preventDefault();
        validaciones(1);
    });

    $('#formueditar').submit(function (e) {
        e.preventDefault();
        validaciones(2);
    });

    read();

    $("#search").keyup(function () {
        let datos = { Identifica: $('#search').val() }
        Search(datos);
    });
});
function validaciones(accion) {    

            if (accion == 2) {
                let datos = {
                    id: $('#nodocumento').val(), pnombre: $('#firstnombre').val(), snombre: $('#secondnombre').val(), papellido: $('#firstpostnombre').val(), sapellido: $('#secondpostnombre').val(), direccion: $('#addre').val(),
                    ciudad: $('#ciudad').val(), telefono: $('#celular').val(), email: $('#correo').val() };
                Update(datos);
            } else {
                let datos = {
                    id: $('#nodocument').val(), pnombre: $('#firstname').val(), snombre: $('#secondname').val(), papellido: $('#firstpostname').val(), sapellido: $('#secondpostname').val(), direccion: $('#address').val(),
                    ciudad: $('#city').val(), telefono: $('#phone').val(), email: $('#email').val()};
                inserta(datos);
            }
}


function inserta(datos) {
    $.ajax({
        url: "usuario.aspx/Insertar",
        method: "POST",
        data: JSON.stringify(datos),
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: true,
        success: function (respuesta) {            
            switch (respuesta.d) {
                case 1:
                    Swal.fire({
                        title: '<strong>Registro Exitoso</strong>',
                        icon: 'success',
                        html: '<p class="text-success font-weight-bold">Registro Exitoso.</p>',
                        showConfirmButton: false,
                        timer: 5000,
                        returnFocus: false
                    });
                    document.getElementById("formu").reset();
                    window.setTimeout(function () {
                        window.location.href = "/usuario.aspx";
                    }, 6000)
                    break;
                case 0:
                    Swal.fire({
                        title: '<strong>Información</strong>',
                        icon: 'info',
                        html: '<p class="text-danger font-weight-bold">Error al guardar. </p>',
                        showConfirmButton: false,
                        timer: 7000,
                        returnFocus: false
                    });
                    document.getElementById("formu").reset();
                    window.setTimeout(function () {
                        window.location.href = "/usuario.aspx";
                    }, 8000)
                    break;
            }
        }
    });
}

function Search(datos) {
    $.ajax({
        url: "consultas.aspx/Search",
        method: "POST",
        data: JSON.stringify(datos),
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: true,
        success: function (resultado) {
            let template = ``;
            let datos = JSON.parse(resultado.d);
            if (resultado.d != null) {
                datos.forEach(dato => {
                    template += `                                
                                    <tr>
                                        <td>${dato.Identificacion}</td>
                                        <td>${dato.Nombre1} ${dato.Nombre2} ${dato.Apellido1} ${dato.Apellido2}</td>
                                        <td>${dato.Direccion}</td>
                                        <td>${dato.Celular}</td>
                                        <td>${dato.Email}</td>
                                        <td>${dato.Ciudad}</td>
                                        <td>${dato.NumeroCuenta}</td>
                                        <td>${dato.FechaCreacion}</td>
                                        <td>${dato.SaldoActual}</td>
                                        <td>${dato.UsuarioCrea}</td>
                                        <td><p><a class="btn btn-danger text-white" onclick="Delete(${dato.Id});" role="button">Eliminar</a> <a class="btn btn-info text-white" onclick="findeditar(${dato.Identificacion});" role="button">Editar</a></p></td>
                                    </tr>
                        `
                });
            } else {
                template += `<p class="text-danger">no se han encontrado resultados</p>`
            }
            $('#listado').html(template);
        }
    });
}

function read() {
    $.ajax({
        url: "consultas.aspx/Read",
        method: "POST",
        data: null,
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: true,
        success: function (resultado) {
            let template = ``;
            let datos = JSON.parse(resultado.d);
            if (resultado.d != null) {
                datos.forEach(dato => {
                    template += `                                
                                    <tr>                                        
                                        <td>${dato.Identificacion}</td>
                                        <td>${dato.Nombre1} ${dato.Nombre2} ${dato.Apellido1} ${dato.Apellido2}</td>
                                        <td>${dato.Direccion}</td>
                                        <td>${dato.Celular}</td>
                                        <td>${dato.Email}</td>
                                        <td>${dato.Ciudad}</td>
                                        <td>${dato.NumeroCuenta}</td>
                                        <td>${dato.FechaCreacion}</td>
                                        <td>${dato.SaldoActual}</td>
                                        <td>${dato.UsuarioCrea}</td>
                                        <td><p><a class="btn btn-danger text-white" onclick="Delete(${dato.Identificacion});" role="button">Eliminar</a> <a class="btn btn-info text-white" onclick="findeditar(${dato.Identificacion});" role="button">Editar</a></p></td>
                                    </tr>                        
                        `
                });
            }
            $('#listado').html(template);
        }
    });
}

function findeditar(dato) {
    document.getElementById("formuproducto").reset();
    $('#exampleModalScrollable').modal('show');
    let datos = { Identifica: dato };
    console.log(datos);
    $.ajax({
        url: "consultas.aspx/SearchID",
        method: "POST",
        data: JSON.stringify(datos),
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: true,
        success: function (respuesta) {
            let datos = JSON.parse(respuesta.d);
            if (respuesta.d == null) {
            } else {
                datos.forEach(dato => {
                    $('#nodocumento').val(dato.Identificacion);
                    $('#firstnombre').val(dato.Nombre1);
                    $('#secondnombre').val(dato.Nombre2);
                    $('#firstpostnombre').val(dato.Apellido1);
                    $('#secondpostnombre').val(dato.Apellido2);
                    $('#addre').val(dato.Direccion);
                    $('#ciudad').val(dato.Ciudad);
                    $('#celular').val(dato.Celular);
                    $('#correo').val(dato.Email);
                });
            }
        }
    });
}

function Update(datos) {
    $.ajax({
        url: "consultas.aspx/Update",
        method: "POST",
        data: JSON.stringify(datos),
        cache: false,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: true,
        success: function (respuesta) {
            console.log(respuesta.d);
            switch (respuesta.d) {
                case 1:
                    Swal.fire({
                        title: '<strong>Actualizacion Exitoso</strong>',
                        icon: 'success',
                        html: '<p class="text-success font-weight-bold">Registro Exitoso.</p>',
                        showConfirmButton: false,
                        timer: 5000,
                        returnFocus: false
                    });
                    document.getElementById("formuproducto").reset();
                    window.setTimeout(function () {
                        window.location.href = "/consultas.aspx";
                    }, 6000)
                    break;
                case 0:
                    Swal.fire({
                        title: '<strong>Información</strong>',
                        icon: 'info',
                        html: '<p class="text-danger font-weight-bold">Error al guardar. </p>',
                        showConfirmButton: false,
                        timer: 7000,
                        returnFocus: false
                    });
                    document.getElementById("formuproducto").reset();
                    window.setTimeout(function () {
                        window.location.href = "/consultas.aspx";
                    }, 8000)
                    break;
            }
        }
    });
}

function Delete(dato) {
    Swal.fire({
        title: 'Esta seguro?',
        text: "Desea eliminar este producto! " + dato,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, Eliminar!'
    }).then((result) => {
        if (result.isConfirmed) {
            let datos = { id: dato }
            $.ajax({
                url: "consultas.aspx/Delete",
                method: "POST",
                data: JSON.stringify(datos),
                cache: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: true,
                success: function (respuesta) {
                    console.log(respuesta);
                    switch (respuesta.d) {
                        case 1:
                            Swal.fire({
                                title: '<strong>Registro Exitoso</strong>',
                                icon: 'success',
                                html: '<p class="text-success font-weight-bold">El registro ha sido eliminado.</p>',
                                showConfirmButton: false,
                                timer: 5000,
                                returnFocus: false
                            });
                            read();
                            window.setTimeout(function () {
                                window.location.href = "/consultas.aspx";
                            }, 6000)
                            break;
                        default:
                            Swal.fire({
                                title: '<strong>Error</strong>',
                                icon: 'error',
                                html: '<p class="text-danger font-weight-bold">No se pudo eliminar el registro.</p>',
                                showConfirmButton: false,
                                timer: 7000,
                                returnFocus: false
                            });
                    }
                }
            });
        }
    })
}
