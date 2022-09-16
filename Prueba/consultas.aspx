<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="consultas.aspx.vb" Inherits="PruebaBanco.consultas" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="Expires" content="0" />
    <meta http-equiv="Last-Modified" content="0" />
    <meta http-equiv="Cache-Control" content="no-cache, mustrevalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <title>Prueba</title>

    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/crud.js"></script>
    <script src="js/sweetalert2.all.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="usuario.aspx">Registrar CLiente</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="usuario.aspx">Movimiento CLiente</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row mt-4">
            <div class="col">
                    <div class="row p-1">
                        <div class="col-12 text-center">
                            <h2>lista de usuarios</h2>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="inputEmail4">Buscar Cliente</label>
                            <input type="text" class="form-control" name="search" id="search" placeholder="Escirbir No. Documento">
                        </div>
                    </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <table class="table text-center">
                    <thead>
                        <tr>
                            <th scope="col"># Dcto</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Direccion</th>
                            <th scope="col">Celular</th>
                            <th scope="col">Email</th>
                            <th scope="col">Ciudad</th>
                            <th scope="col">No Cuenta</th>
                            <th scope="col">Fecha</th>
                            <th scope="col">Saldo</th>
                            <th scope="col">Usuario</th>
                            <th scope="col">ACCION</th>
                        </tr>
                    </thead>
                    <tbody id="listado">

                    </tbody>
                </table>
                <div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalScrollableTitle">Editar Cliente</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form method="POST" id="formueditar">
                                    <div class="form-row justify-content-center">
                                        <div class="form-row justify-content-center">
                                            <div class="form-group col-md-4">
                                                <label for="inputEmail4">No Documento</label>
                                                <input type="number" class="form-control" name="nodocumento" id="nodocumento" required>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label for="inputEmail4">Primer Nombre</label>
                                                <input type="text" class="form-control" name="firstnombre" id="firstnombre" required>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label for="inputEmail4">Segundo Nombre</label>
                                                <input type="text" class="form-control" name="secondnombre" id="secondnombre" required>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label for="inputEmail4">Primer Nombre</label>
                                                <input type="text" class="form-control" name="firstpostnombre" id="firstpostnombre" required>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label for="inputEmail4">Segundo Nombre</label>
                                                <input type="text" class="form-control" name="secondpostnombre" id="secondpostnombre" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail4">Direccion</label>
                                                <input type="text" class="form-control" name="addre" id="addre" required>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="inputEmail4">Ciudad</label>
                                                <input type="text" class="form-control" name="ciudad" id="ciudad" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail4">Telefono</label>
                                                <input type="text" class="form-control" name="celular" id="celular" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail4">Correo Electronico</label>
                                                <input type="email" class="form-control" name="correo" id="correo" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row justify-content-center mb-3">
                                        <div class="col-6 col-sm-6 col-xl-6">
                                            <button id="editar" class="btn btn-lg btn-block btn-primary">Actualizar</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
