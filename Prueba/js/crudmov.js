$(document).ready(function () {
    $('#formuconsigna').submit(function (e) {
        e.preventDefault();
        validaciones(1);
    });

    $('#formuretira').submit(function (e) {
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
    console.log(accion);
    if (accion == 2) {
        let datos = { IdCliente: $('#nodocumentoretira').val(), Idcuenta: $('#nodocuentaretira').val(), valor: $('#valorretira').val(), tipomvto:'Retiro' };
        
        operacion(datos);
    } else {
        let datos = { IdCliente: $('#nodocumentoconsigna').val(), Idcuenta: $('#nodocuuentaconsigna').val(), valor: $('#valorconsigna').val(), tipomvto:'Consignacion' };
        operacion(datos);
    }
}


function Search(datos) {    
    $.ajax({
        url: "movimientos.aspx/Search",
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
                                        <td><p><a class="btn btn-info text-white" onclick="findmov(${dato.Identificacion});" role="button">Mvtos.</a> <a class="btn btn-success text-white" onclick="mostrarmodals('consignar',${datos[0].Identificacion},${datos[0].NumeroCuenta});" role="button">Consignar.</a> <a class="btn btn-danger text-white" onclick="mostrarmodals('retirar',${datos[0].Identificacion},${datos[0].NumeroCuenta});" role="button">Retirar.</a></p></td>
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
                                        <td><p><a class="btn btn-info text-white" onclick="findmov(${dato.Identificacion});" role="button">Mvtos.</a> <a class="btn btn-success text-white" onclick="mostrarmodals('consignar',${datos[0].Identificacion},${datos[0].NumeroCuenta});" role="button">Consignar.</a> <a class="btn btn-danger text-white" onclick="mostrarmodals('retirar',${datos[0].Identificacion},${datos[0].NumeroCuenta});" role="button">Retirar.</a></p></td>
                                    </tr>
                        `
                });
            }
            $('#listado').html(template);
        }
    });
}

function findmov(Id) {
    let datos = { IdCliente: Id };
    $('#exampleModalScrollable').modal('show');
    $.ajax({
        url: "movimientos.aspx/ReadMvto",
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
                template += `<div class="row">
                                    <div class="col">
                                        <label for="inputEmail4">Nombre</label>
                                        <input type="text" class="form-control" name="nombre" id="nombre" value="${datos[0].Nombre}" readonly>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-6">
                                        <label for="inputEmail4">No Documento</label>
                                        <input type="text" class="form-control" name="dcto" id="dcto" value="${datos[0].Identificacion}" readonly>
                                    </div>
                                    <div class="col-6">
                                        <label for="inputEmail4">No Cuenta</label>
                                        <input type="text" class="form-control" name="cuenta" id="cuenta" value="${datos[0].NumeroCuenta}" readonly>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-6">
                                        <button id="consignar" class="btn  btn-success" onclick="mostrarmodals('consignar',${datos[0].Identificacion},${datos[0].NumeroCuenta});">Consignar</button>
                                        <button id="retirar" class="btn  btn-danger" onclick="mostrarmodals('retirar',${datos[0].Identificacion},${datos[0].NumeroCuenta});">Retirar</button>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col">
                                        <table class="table text-center">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Nombre</th>
                                                    <th scope="col"># Dcto</th>
                                                    <th scope="col">No Cuenta</th>
                                                    <th scope="col">No Mvto</th>
                                                    <th scope="col">Mvto Origen</th>
                                                    <th scope="col">Valor Mvto</th>
                                                    <th scope="col">Fecha</th>
                                                </tr>
                                            </thead>
                                            <tbody>`
                datos.forEach(dato => {
                    template += `                                
                                    <tr>
                                        <td>${dato.Nombre}</td>
                                        <td>${dato.Identificacion}</td>
                                        <td>${dato.NumeroCuenta}</td>
                                        <td>${dato.IdMovimiento}</td>                                        
                                        <td>${dato.MovOrigen}</td>
                                        <td>${dato.MovValor}</td>
                                        <td>${dato.FECHA}</td>
                                    </tr>                        
                        `
                });
                template += `           </tbody>
                                        </table>
                                    </div>
                                </div>`
            } else {
                template += `<p class="text-danger">no se han encontrado resultados</p>`
            }
            $('#Mvto').html(template);
        }
    });
}

function mostrarmodals(action, id,idcuenta) {
    switch (true) {
        case (action == "consignar" && id != undefined && idcuenta != undefined):
            $('#Modalconsgina').modal('show');
            $('#nodocumentoconsigna').val(id);
            $('#nodocumentoconsigna').prop('readonly', true);
            $('#nodocuuentaconsigna').val(idcuenta);
            $('#nodocuuentaconsigna').prop('readonly', true);
            break;
        case (action == "retirar" && id != undefined && idcuenta != undefined):
            $('#Modalretira').modal('show');
            $('#nodocumentoretira').val(id);
            $('#nodocumentoretira').prop('readonly', true);
            $('#nodocuentaretira').val(idcuenta);
            $('#nodocuentaretira').prop('readonly', true);
            break;
        default:
            switch (action) {
                case "consignar":
                    $('#Modalconsgina').modal('show');
                    break;
                case "retirar":
                    $('#Modalretira').modal('show');
                    break;
            }
    }
    
}

function operacion(datos) {
    console.log(datos);
    $.ajax({
        url: "movimientos.aspx/operacion",
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
                        html: '<p class="text-success font-weight-bold">Movimiento exitoso.</p>',
                        showConfirmButton: false,
                        timer: 5000,
                        returnFocus: false
                    });
                    document.getElementById("formuconsigna").reset();
                    window.setTimeout(function () {
                        window.location.href = "/movimientos.aspx";
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
                    document.getElementById("formuconsigna").reset();
                    window.setTimeout(function () {
                        window.location.href = "/movimientos.aspx";
                    }, 8000)
                    break;
            }
        }
    });
}