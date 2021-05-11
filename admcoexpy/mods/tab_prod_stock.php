<div class="box-header with-border">
    <div class="col-md-3 pull-left">
        <button id="btnAdd" type="button" class="btn btn-primary" data-toggle="modal" data-target="#AddAtributo" style="margin-bottom: 5px;">+ Nuevo</button>
    </div>
    <div class="col-md-3 pull-right">
        <h3 class="box-title pull-right" style="font-size:1.6em; margin-top:5px;"><b>Atributos del Producto</b></h3>
    </div>
</div>

<!-- Corpo de Caja -->
<div class="box-body">
    <div class="box-body table-responsive">
        <table class="table table-striped table-bordered display nowra" id="tabladatos1">
            <thead>
                <tr>
                    <th>Atributo</th>
                    <th>Valor</th>
                    <th>Activo</th>
                </tr>
            </thead>
            <tbody>
                <?php 
                    if ($prodAtributos != null) { 
                        foreach ($prodAtributos as $row) {
                            $valores = getProdAtributosValores($row['id']);
                            $tableVlr = "";
                            if ($valores != null) {
                                foreach ($valores as $linea) {
                                    if ($tableVlr == "") {
                                        $tableVlr = $linea['id'].";".$linea['valor'].";".$linea['activo'];
                                    } else {
                                        $tableVlr = $tableVlr."*".$linea['id'].";".$linea['valor'].";".$linea['activo'];
                                    }
                                }
                            } 
                            $nuevoValor = getAtributosValores($row['id_atributo']);
                            $nuevos = "";
                            if ($nuevoValor != null) {
                                foreach ($nuevoValor as $linha) {
                                    $show = 1;
                                    if ($valores != null) { 
                                        foreach ($valores as $lin) {
                                            if ($lin['id_atr_valor'] == $linha['id']) {
                                                $show = 0;  
                                            }
                                        }
                                    }
                                    if ($show == 1){
                                        if ($nuevos == "") {
                                            $nuevos = $linha['id'].".".$linha['nombre'];
                                        } else {
                                            $nuevos = $nuevos.";".$linha['id'].".".$linha['nombre'];
                                        }                                            
                                    }
                                }
                            } 
                ?>
                <tr data-toggle="modal" data-target="#AltAtributoModal" data-codigo="<?php echo $row['id'];?>" data-nombre="<?php echo $row['atributo'];?>" data-newval="<?php echo $nuevos;?>" data-atributo="<?php echo $row['id_atributo'];?>" data-activo="<?php echo $row['activo'];?>" data-valores="<?php echo $tableVlr;?>">
                    <td><?php echo $row['atributo'];?></td>
                    <td>
                    <?php 
                        $valores = getProdAtributosValores($row['id']);
                        if ($valores != null) {
                            foreach ($valores as $linea) {
                                echo $linea['valor']."<br>";
                            }
                        }
                    ?>
                    </td>
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
                    <!-- <td>0</td> -->
                </tr>
                <?php }}?>
            </tbody>
        </table>
    </div>
</div> <!-- /.box-body -->

<!-- AddModal -->
<div class="modal fade" tabindex="-1" role="dialog" id="AddAtributo">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Nuevo Atributo</h4>
            </div>
            <form action="" method="POST" autocomplete="off">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="atributo">Atributo</label>
                                <select class="selectpicker" id="atributo" name="atributo" data-width="100%" data-live-search="true">
                                    <?php
                                        if ($atributos != null) {
                                            $selected = "";
                                            foreach ($atributos as $row) {	
                                                $show = 1;
                                                if ($prodAtributos != null) { 
                                                    foreach ($prodAtributos as $lin) {
                                                        if ($lin['id_atributo'] == $row['id']) {
                                                            $show = 0;  
                                                        }
                                                    }
                                                }
                                                if ($show == 1){
                                    ?>
                                        <option value="<?php echo $row['id'];?>"><?php echo $row['nombre'];?></option> 
                                    <?php 
                                                } //END IF SHOW
                                            } //END FOREACH
                                        } //END IF
                                    ?>
                                </select>

                                <!-- <label for="nombre">Nombre</label> -->
                                <!-- <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del Atributo" maxlength="80" required> -->
                            </div>
                        </div>
                    </div> <!-- row -->
                </div> <!-- modal-body -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary" name="nuevoatributo">Guardar</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- ./AddModal -->	

<!-- AltModal -->
<div class="modal fade" tabindex="-1" role="dialog" id="AltAtributoModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Alteración Atributo</h4>
            </div>
            <form action="" method="POST" autocomplete="off">
                <div class="modal-body">
                    <div class="row">
                        <input type="hidden" class="form-control" id="codigo" name="codigo" required>
                        <div class="col-md-9">
                            <div class="form-group">
                                <label for="atributo">Atributo</label>
                                <select class="selectpicker" id="atributo" name="atributo" data-width="100%" data-live-search="true" disabled>
                                    <?php
                                        if ($atributos != null) {
                                            $selected = "";
                                            foreach ($atributos as $row) {	
                                    ?>
                                        <option value="<?php echo $row['id'];?>"><?php echo $row['nombre'];?></option> 
                                    <?php 
                                            } //END FOREACH
                                        } //END IF
                                    ?>
                                </select>
                                <!-- <label for="nombre">Nombre</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del Atributo" maxlength="80" required> -->
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label for="activo">Activo</label>
                            <div class="row">
                                <div class="col-md-12">
                                    <input type="checkbox" name="activo" id="activo" data-toggle="toggle" data-on="Sí" data-off="No" data-onstyle="success" data-offstyle="warning" data-width="100%" data-height="35" checked>
                                </div>
                            </div>
                        </div>
                    </div><!-- row -->
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <h4><b>Valores</b></h4>		
                        </div> <!-- col-md-12 -->
                        <div class="col-md-12">
                            <table class="table table-striped" id="tbvalores">
                                <thead>
                                    <tr class="active">
                                        <th>Nombre</th>
                                        <th>Activo</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div> <!-- col-md-12 -->
                        <div class="col-md-12 text-center">
                            <button type="button" class="btn btn-primary" id="nuevovlr" data-toggle="modal" data-target="#AddValorModal" data-codigo="">Nuevo Valor</button>
                        </div>
                    </div> <!-- row -->
                </div> <!-- modal-body -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger pull-left" id="btn-confirmar-atributo">Excluir</button>
                    <button type="submit" class="btn" name="excluiratributo" id="btn-excluir-atributo" style="display: none;">Submit Excluir</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary" name="guardaratributo">Guardar</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- ./AltModal -->	

<!-- Confirmación Modal (para excluisiones) -->
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="DelAtributoModal">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">¿Deseas eliminar este registro?</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="atributo-btn-si">Sí</button>
                <button type="button" class="btn btn-primary" id="atributo-btn-no">No</button>
            </div>
        </div>
    </div>
</div>
<!-- Confirmación Modal (para excluisiones) -->

<!-- AddValorModal -->
<div class="modal fade" tabindex="-1" role="dialog" id="AddValorModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Nuevo Valor</h4>
            </div>
            <form action="" method="POST" autocomplete="off">
                <input type="hidden" class="form-control" id="codigo" name="codigo" required>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="valor">Valor</label>
                                <select class="selectpicker" id="valor" name="valor" data-width="100%" data-live-search="true">
                                </select>
                            </div>
                        </div>
                    </div> <!-- row -->
                </div> <!-- modal-body -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary" name="nuevovlr">Guardar</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- ./AddValorModal -->

<!-- AltModal -->
<div class="modal fade" tabindex="-1" role="dialog" id="AltValorModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Alteración Valor</h4>
            </div>
            <form action="" method="POST" autocomplete="off">
                <div class="modal-body">
                    <div class="row">
                        <input type="hidden" class="form-control" id="codigo" name="codigo" required>
                        <div class="col-md-9">
                            <div class="form-group">
                                <label for="nombre">Nombre</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del Atributo" maxlength="80" readonly>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label for="activo">Activo</label>
                            <div class="row">
                                <div class="col-md-12">
                                    <input type="checkbox" name="activo" id="activo" data-toggle="toggle" data-on="Sí" data-off="No" data-onstyle="success" data-offstyle="warning" data-width="100%" data-height="35" checked>
                                </div>
                            </div>
                        </div>
                    </div><!-- row -->
                </div> <!-- modal-body -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger pull-left" name="excluir" id="btn-confirmar-vlr">Excluir</button>
                    <button type="submit" class="btn" name="excluirvlr" id="btn-excluir-vlr" style="display: none;">Submit Excluir</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary" name="guardarvlr">Guardar</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- ./AltModal -->	

<!-- Confirmación Modal (para excluisiones) -->
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="mi-modal-vlr">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">¿Deseas eliminar este registro?</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="modal-btn-si-vlr">Sí</button>
                <button type="button" class="btn btn-primary" id="modal-btn-no-vlr">No</button>
            </div>
        </div>
    </div>
</div>
<!-- Confirmación Modal (para excluisiones) -->


<div class="box-header with-border">
    <div class="col-md-3 pull-left">
        <button id="btnAdd" type="button" class="btn btn-primary" data-toggle="modal" data-target="#AddStockModal" style="margin-bottom: 5px;">+ Nuevo</button>
    </div>
    <div class="col-md-3 pull-right">
        <h3 class="box-title pull-right" style="font-size:1.6em; margin-top:5px;"><b>Stock del Producto</b></h3>
    </div>
</div>

<!-- Corpo de Caja -->
<div class="box-body">
    <div class="box-body table-responsive">
        <table class="table table-striped table-bordered display nowra table-image" id="tabladatos2">
            <thead>
                <tr>
                    <th>Combinación</th>
                    <th>Stock</th>
                    <th>Precio</th>
                    <th>Valor Descuento</th>
                    <th>Activo</th>
                </tr>
            </thead>
            <tbody>
                <?php 
                    // var_dump($stock);
                    if ($stock != null) { 
                        foreach ($stock as $row) {
                            if ($row['id_combinacion'] == "") {
                                $valorProd = "";
                            } else {
                                $valores = getProdAtributosValoresByStock ($row['id_combinacion']);
                                $valorProd = "";
                                if ($valores != null) {  
                                    // var_dump($valores);                                        
                                    foreach ($valores as $valor) {
                                        if ($valorProd == "") {
                                            $valorProd = $valor['id_atributo'].":".$valor['id_producto_atr_valor'];
                                        } else {
                                            $valorProd = $valorProd.";".$valor['id_atributo'].":".$valor['id_producto_atr_valor'];
                                        }
                                    }
                                }    
                            }
                ?>
                <tr data-toggle="modal" data-target="#AltStockModal" data-codigo="<?php echo $row['id'];?>" data-valores="<?php echo $valorProd;?>" data-stock="<?php echo $row['stock'];?>" data-precio="<?php echo number_format($row['precio'], 0, ',', '.');?>" data-descuento="<?php echo number_format($row['valor_descuento'], 0, ',', '.');?>">
                    <td>
                        <?php 
                            if ($row['id_combinacion'] == "") {
                                echo 'UNICO';
                            } else {
                                $valores = getProdAtributosValoresByStock ($row['id_combinacion']);
                                if ($valores != null) { 
                                    foreach ($valores as $linea) {
                                        echo '<span class="label label-primary" style="font-size:10pt;">'.$linea['valor'].'</span> ';
                                    }
                                } else {
                                    echo 'UNICO';
                                }
                            }
                        ?>
                    </td>
                    <td><?php echo $row['stock'];?></td>
                    <td>
                    <?php 
                        if ($row['precio'] > 0) {
                            $minorista = number_format($row['precio'], 0, ',', '.');
                        } else {
                            $minorista = "";
                        }
                        echo $minorista;
                    ?>
                    </td>
                    <td>
                    <?php 
                        if ($row['valor_descuento'] > 0) {
                            $mayorista = number_format($row['valor_descuento'], 0, ',', '.');
                        } else {
                            $mayorista = "";
                        }
                        echo $mayorista;
                    ?>
                    </td>
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
<div class="modal fade" tabindex="-1" role="dialog" id="AddStockModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Nuevo Arreglo</h4>
            </div>
            <form action="" method="POST" autocomplete="off">
                <div class="modal-body">
                    <div class="row">
                        <?php
                            if ($prodAtributos != null) {
                                $tam = sizeof($prodAtributos);
                                if ($tam == 1) {
                                    $col = "col-md-12";
                                } else if ($tam % 2) {
                                    $col = "col-md-4";
                                } else {
                                    $col = "col-md-6";
                                }
                                foreach ($prodAtributos as $row) {	
                        ?>
                        <div class="<?php echo $col;?>">
                            <div class="form-group">
                                <label for="atributo"><?php echo $row['atributo'];?></label>
                                <select class="selectpicker" id="atributo" name="valores[]" data-width="100%" data-live-search="true">
                                    <?php
                                        $valoresProd = "";
                                        $valores = getProdAtributosValores($row['id']);
                                        if ($valores != null) {                                            
                                            foreach ($valores as $valor) {	
                                    ?>
                                        <option value="<?php echo $valor['id'];?>"><?php echo $valor['valor'];?></option> 
                                    <?php 
                                            } //END FOREACH
                                        } //END IF
                                    ?>
                                </select>
                            </div>
                        </div>
                        <?php 
                                } //END FOREACH
                            } //END IF
                        ?>
                    </div> <!-- row -->
                    <div class="row">
                        <div class="col-md-4">
                            <label for="orden">Stock</label>
                            <input type="text" class="form-control" id="stock" name="stock" placeholder="0" maxlength="15" value="1" required>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="valorminorista">Precio</label>
                                <input type="text" class="form-control" id="precio" name="precio" value="<?php echo number_format($producto['precio'], 0, ',', '.');?>" placeholder="999.999.999.999" onKeyUp="formatoMoneda(this, event)" maxlength="15">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="valormayorista">Valor Descuento</label>
                                <input type="text" class="form-control" id="descuento" name="descuento" value="<?php echo number_format($producto['valor_descuento'], 0, ',', '.');?>" placeholder="999.999.999.999" onKeyUp="formatoMoneda(this, event)" maxlength="15">
                            </div>
                        </div>
                    </div>
                </div> <!-- modal-body -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary" name="nuevostock">Guardar</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- ./AddModal -->	

<!-- AltModal -->
<div class="modal fade" tabindex="-1" role="dialog" id="AltStockModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Alteración Stock</h4>
            </div>
            <form action="" method="POST" autocomplete="off">
                <div class="modal-body">
                    <input type="hidden" class="form-control" id="codigo" name="codigo" required>
                    <div class="row">
                        <?php
                            if ($prodAtributos != null) {
                                $tam = sizeof($prodAtributos);
                                if ($tam == 1) {
                                    $col = "col-md-12";
                                } else if ($tam % 2) {
                                    $col = "col-md-4";
                                } else {
                                    $col = "col-md-6";
                                }
                                foreach ($prodAtributos as $row) {	
                                    $id_atributo = "sel-".$row['id'];//var_dump($prodAtributos);
                                    // var_dump( $id_atributo );
                        ?>
                        <div class="<?php echo $col;?>">
                            <div class="form-group">
                                <label for="atributo"><?php echo $row['atributo'];?></label>
                                <select class="selectpicker" id="<?php echo $id_atributo;?>" name="valores[]" data-width="100%" data-live-search="true" disabled>
                                    <?php
                                        $valoresProd = "";
                                        $valores = getProdAtributosValores($row['id']);
                                        if ($valores != null) {                                            
                                            foreach ($valores as $valor) {	
                                    ?>
                                        <option value="<?php echo $valor['id'];?>"><?php echo $valor['valor'];?></option> 
                                    <?php 
                                            } //END FOREACH
                                        } //END IF
                                    ?>
                                </select>
                            </div>
                        </div>
                        <?php 
                                } //END FOREACH
                            } //END IF
                        ?>
                    </div> <!-- row -->
                    <div class="row">
                        <div class="col-md-4">
                            <label for="orden">Stock</label>
                            <input type="text" class="form-control" id="stock" name="stock" placeholder="0" maxlength="15" value="1" required>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="valorminorista">Precio</label>
                                <input type="text" class="form-control" id="precio" name="precio" value="" placeholder="999.999.999.999" onKeyUp="formatoMoneda(this, event)" maxlength="15">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="valormayorista">Valor Descuento</label>
                                <input type="text" class="form-control" id="descuento" name="descuento" value="" placeholder="999.999.999.999" onKeyUp="formatoMoneda(this, event)" maxlength="15">
                            </div>
                        </div>
                    </div>
                </div> <!-- modal-body -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger pull-left" name="excluir" id="btn-confirmar-stock">Excluir</button>
                    <button type="submit" class="btn" name="excluirstock" id="btn-excluir-stock" style="display: none;">Submit Excluir</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary" name="guardarstock">Guardar</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- ./AltModal -->	

<!-- Confirmación Modal (para excluisiones) -->
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="DelStockModal">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">¿Deseas eliminar este registro?</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="modal-btn-si-stock">Sí</button>
                <button type="button" class="btn btn-primary" id="modal-btn-no-stock">No</button>
            </div>
        </div>
    </div>
</div>
<!-- Confirmación Modal (para excluisiones) -->