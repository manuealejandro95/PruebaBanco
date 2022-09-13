$(document).ready(function () {
    $('#formu').submit(function (e) {
        e.preventDefault();
        validaciones(1);
    });

    $('#formuproducto').submit(function (e) {
        e.preventDefault();
        validaciones(2);
    });

    read();
});
function validaciones(accion) {    

            if (accion == 2) {
                let datos = { id: $('#id').val(), nombre: $('#name').val(), fecha: $('#fechnac').val(), sexo: $('#sexo').val() };
                Update(datos);
            } else {
                let datos = {
                    id: $('#nodocument').val(), pnombre: $('#firstname').val(), snombre: $('#secondname').val(), papellido: $('#firstpostname').val(), sapellido: $('#secondpostname').val(), direccion: $('#address').val(),
                    ciudad: $('#city').val(), telefono: $('#phone').val(), email: $('#email').val()};
                inserta(datos);
            }
}


function inserta(datos) {
    console.log(datos);
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
                                        <td>${dato.Nombre1}</td>
                                        <td>${dato.Nombre2}</td>
                                        <td>${dato.Apellido1}</td>
                                        <td>${dato.Apellido2}</td>
                                        <td>${dato.Direccion}</td>
                                        <td>${dato.Celular}</td>
                                        <td>${dato.Email}</td>
                                        <td>${dato.NumeroCuenta}</td>
                                        <td>${dato.UsuarioCrea}</td>
                                        <td>${dato.SaldoActual}</td>
                                        <td><p><a class="btn btn-danger text-white" onclick="Delete(${dato.Id});" role="button">Eliminar</a> <a class="btn btn-info text-white" onclick="findeditar(${dato.Id});" role="button">Editar</a></p></td>
                                    </tr>                        
                        `
                });
            }
            $('#listado').html(template);
        }
    });
}

