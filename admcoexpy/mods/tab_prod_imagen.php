<div class="box-header with-border">
    <!-- Botón para crear más cursos -->
    <div class="col-md-3 pull-left">
        <button id="btnAdd" type="button" class="btn btn-primary" data-toggle="modal" data-target="#AddModal" style="margin-bottom: 5px;">+ Nuevo</button>
    </div>
</div>

<!-- Corpo de Caja -->
<div class="box-body">
    <div class="box-body table-responsive">
        <table class="table table-striped table-bordered display nowra table-image" id="tabladatos">
            <thead>
                <tr>
                    <th>Orden</th>
                    <th>Imagen</th>
                    <th>URL</th>
                    <th>Activo</th>
                </tr>
            </thead>
            <tbody>
                <?php 
                    if ($imagenes != null) { 
                        foreach ($imagenes as $row) {
                ?>
                <tr data-toggle="modal" data-target="#AltModal" data-codigo="<?php echo $row['id'];?>" data-orden="<?php echo $row['orden'];?>" data-url="<?php echo $row['url'];?>" data-activo="<?php echo $row['activo'];?>">
                    <td><?php echo $row['orden'];?></td>
                    <td><img src="../img/productos/<?php echo $row['url'];?>" class="img-fluid img-thumbnail img-prod-table" alt="producto" style="max-width: 300px;"></td>
                    <td><?php echo $row['url'];?></td>
                    <td>
                    <?php
                        $circle_color = "";
                        if ($row['activo'] == 1) {
                            echo '<span style="color: white">S</span><i class="fa fa-check text-success"></i>';
                        } else {
                            echo '<span style="color: white">N</span><i class="fa fa-close text-danger"></i>';
                        }
                    ?>
                    </td>
                </tr>
                <?php 
                    }//FOR
                }//IF
                ?>
            </tbody>
        </table>
    </div>
</div> <!-- /.box-body -->

<!-- AddModal -->
<div class="modal fade" tabindex="-1" role="dialog" id="AddModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Nueva Imagen</h4>
            </div>
            <form action="" method="post" enctype="multipart/form-data" autocomplete="off">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6 text-center">
                            <img src="../img/productos/no-image.png" class="img-fluid img-thumbnail img-modal" alt="no-image" id="img">
                        </div>
                        <div class="col-md-3">
                            <label for="orden">Orden</label>
                            <input type="text" class="form-control" id="orden" name="orden" placeholder="0" maxlength="15" value="<?php echo $lastOrden['orden']+1;?>" required>
                        </div>
                        <div class="col-md-3">
                            <label for="activo">Activo</label>
                            <div class="row">
                                <div class="col-md-12">
                                    <input type="checkbox" name="activo" id="toggle" data-toggle="toggle" data-on="Sí" data-off="No" data-onstyle="success" data-offstyle="warning" data-width="100%" data-height="35" checked>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <input type="file" name="fileToUpload" id="fileToUpload">
                        </div>
                    </div>
                </div><!-- modal-body -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary" name="nuevo">Guardar</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- ./AddModal -->	

<!-- AltModal -->
<div class="modal fade" tabindex="-1" role="dialog" id="AltModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Alterar Imagen</h4>
            </div>
            <form action="" method="post" enctype="multipart/form-data" autocomplete="off">
                <div class="modal-body">
                    <input type="hidden" class="form-control" id="codigo" name="codigo" required>
                    <input type="hidden" class="form-control" id="imgurl" name="imgurl" required>
                    <div class="row">
                        <div class="col-md-6 text-center">
                            <img src="../img/productos/no-image.png" class="img-fluid img-thumbnail img-modal" alt="no-image" id="img-alt">
                        </div>
                        <div class="col-md-3">
                            <label for="orden">Orden</label>
                            <input type="text" class="form-control" id="orden" name="orden" placeholder="0" maxlength="15" required>
                        </div>
                        <div class="col-md-3">
                            <label for="activo">Activo</label>
                            <div class="row">
                                <div class="col-md-12">
                                    <input type="checkbox" name="activo" id="toggle-activo" data-toggle="toggle" data-on="Sí" data-off="No" data-onstyle="success" data-offstyle="warning" data-width="100%" data-height="35">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <input type="file" name="fileToUpload" id="fileToUpload">
                        </div>
                    </div> <!-- row -->
                </div> <!-- modal-body -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger pull-left" name="excluir" id="btn-confirmar">Excluir</button>
                    <button type="submit" class="btn" name="excluir" id="btn-excluir" style="display: none;">Submit Excluir</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary" name="guardar">Guardar</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- ./AltModal -->		

<!-- Confirmación Modal (para excluisiones) -->
<div class="modal fade" tabindex="-1" role="dialog" id="ExcModal">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title text-center" id="myModalLabel">¿Deseas eliminar la imagen?</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="excmodal-btn-si">Sí</button>
                <button type="button" class="btn btn-primary" id="excmodal-btn-no">No</button>
            </div>
        </div>
    </div>
</div>
<!-- Confirmación Modal (para excluisiones) -->