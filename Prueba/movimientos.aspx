<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="movimientos.aspx.vb" Inherits="PruebaBanco.movimientos" %>

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
    <script src="js/crudmov.js"></script>
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
                <div class="row justify-content-center">
                    <div class="col-6 text-center">
                        <h2>Movimiento clientes</h2>
                    </div>
                    <div class="col-6 text-center">
                        <button id="consignar" class="btn  btn-success" onclick="mostrarmodals('consignar');">Consignar</button>
                        <button id="retirar" class="btn  btn-danger" onclick="mostrarmodals('retirar');">Retirar</button>
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
        <div class="row mt-4">
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
                    <div class="modal-dialog modal-xl modal-dialog-scrollable" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalScrollableTitle">Movimientos de Cliente</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body" id="Mvto">
                                
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="Modalconsgina" tabindex="-1" role="dialog" aria-labelledby="ModalconsginaTitle" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="ModalconsginaTitle">Consignar</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form method="POST" id="formuconsigna">
                                    <div class="form-row justify-content-center">
                                        <div class="form-row justify-content-center">
                                            <div class="form-group col-md-4">
                                                <label for="inputEmail4">No Documento</label>
                                                <input type="number" class="form-control" name="nodocumentoconsigna" id="nodocumentoconsigna" required>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label for="inputEmail4">No Cuenta</label>
                                                <input type="text" class="form-control" name="nodocuuentaconsigna" id="nodocuuentaconsigna" required>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label for="inputEmail4">Valor a Consignar</label>
                                                <input type="text" class="form-control" name="valorconsigna" id="valorconsigna" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row justify-content-center mb-3">
                                        <div class="col-6 col-sm-6 col-xl-6">
                                            <button id="consignarcli" class="btn btn-lg btn-block btn-success">Consignar</button>
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
                <div class="modal fade" id="Modalretira" tabindex="-1" role="dialog" aria-labelledby="ModalretiraTitle" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="ModalretiraTitle">Editar producto</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form method="POST" id="formuretira">
                                    <div class="form-row justify-content-center">
                                        <div class="form-row justify-content-center">
                                            <div class="form-group col-md-4">
                                                <label for="inputEmail4">No Documento</label>
                                                <input type="number" class="form-control" name="nodocumentoretira" id="nodocumentoretira" required>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label for="inputEmail4">Numero Cuenta</label>
                                                <input type="text" class="form-control" name="nodocuentaretira" id="nodocuentaretira" required>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label for="inputEmail4">Valor a Retirar</label>
                                                <input type="text" class="form-control" name="valorretira" id="valorretira" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row justify-content-center mb-3">
                                        <div class="col-6 col-sm-6 col-xl-6">
                                            <button id="retirarcli" class="btn btn-lg btn-block btn-danger">Retirar</button>
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

