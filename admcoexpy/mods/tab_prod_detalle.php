<form action="" method="POST"  autocomplete="off">

    <div class="modal-body">

        <div class="row">

            <input type="hidden" class="form-control" id="codigo" name="codigo" value="<?php echo $producto['id'];?>" required>

            <div class="col-md-2">

                <div class="form-group">

                    <label for="nombre">Referencia</label>

                    <input type="text" class="form-control" id="referencia" name="referencia" placeholder="Referencia" maxlength="20" value="<?php echo $producto['referencia'];?>">

                </div>

            </div>
            <div class="col-md-2">

<div class="form-group">

    <label for="nombre">Modelo Prov.</label>

    <input type="text" class="form-control" id="modelo" name="modelo" placeholder="modelo" maxlength="20" value="<?php echo $producto['modelo'];?>">

</div>

</div>

            <div class="col-md-3">

                <div class="form-group">

                    <label for="tipo">Categoría</label>

                    <select class="selectpicker show-tick" id="categoria" name="categoria[]" data-width="100%" data-live-search="true" multiple required>

                        <?php

                            if ($categorias != null) {

                                $selected = "";

                                $i = 0;

                                foreach ($categorias as $row) {	

                                    if ($row['id'] == $categoriasprod[$i]['id_categoria']) {

                                        $selected = " selected";

                                        $i++;

                                    } else {

                                        $selected = "";

                                    }

                        ?>

                            <option value="<?php echo $row['id'];?>" <?php echo $selected;?> style="font-weight: bold !important;"><?php echo $row['nombre'];?></option> 

                            <?php

                                    $subcategorias = getSubCategorias ($row['id']);

                                    $subcategoriasprod = getProdSubCategorias ($row['id'], $_GET['producto']);

                                if ($subcategorias != null) {

                                    $subselected = "";

                                    $j = 0;

                                    foreach ($subcategorias as $linea) {	

                                        if ($linea['id'] == $subcategoriasprod[$j]['id_categoria']) {

                                            $subselected = " selected";

                                            $j++;

                                        } else {

                                            $subselected = "";

                                        }

                            ?>

                                        <option value="<?php echo $linea['id'];?>" <?php echo $subselected;?>><?php echo $linea['nombre'];?></option> 

                                        <?php

                                            $subsubcategorias = getSubCategorias ($linea['id']);

                                            $subsubcategoriasprod = getProdSubCategorias ($linea['id'], $_GET['producto']);

                                            if ($subsubcategorias != null) {

                                                $subsubselected = "";

                                                $k = 0;

                                                foreach ($subsubcategorias as $line) {	

                                                    if ($line['id'] == $subsubcategoriasprod[$k]['id_categoria']) {

                                                        $subsubselected = " selected";

                                                        $k++;

                                                    } else {

                                                        $subsubselected = "";

                                                    }

                                        ?>

                                            <option value="<?php echo $line['id'];?>" <?php echo $subsubselected;?>>--<?php echo $line['nombre'];?></option> 

                                            <?php

                                                $subsubsubcategorias = getSubCategorias ($line['id']);

                                                $subsubsubcategoriasprod = getProdSubCategorias ($line['id'], $_GET['producto']);

                                                if ($subsubsubcategorias != null) {

                                                    $subsubsubselected = "";

                                                    $l = 0;

                                                    foreach ($subsubsubcategorias as $linha) {	

                                                        if ($linha['id'] == $subsubsubcategoriasprod[$l]['id_categoria']) {

                                                            $subsubsubselected = " selected";

                                                            $l++;

                                                        } else {

                                                            $subsubsubselected = "";

                                                        }

                                            ?>

                                                <option value="<?php echo $linha['id'];?>" <?php echo $subsubsubselected;?>>----<?php echo $linha['nombre'];?></option> 



                        <?php                           }//END FOREACH SUBSUBSUB

                                                    }//END IF SUBSUBSUB

                                                }//END FOREACH SUBSUB

                                            }// END IF SUBSUBs

                                        }//END FOREACH SUB

                                    }//END IF SUB

                                } //END FOREACH

                            } //END IF

                        ?>

                    </select>

                </div>

            </div>
            <div class="col-md-2">

<div class="form-group">

    <label for="tipo">Linea</label>

    <select class="selectpicker" id="linea" name="linea" data-width="100%" data-live-search="true">

        <?php

            if ($lineas != null) {

                $selected = "";

                foreach ($lineas as $row) {	

                    if ($row['id'] == $producto['id_linea']) {

                        $selected = " selected";

                    } else {

                        $selected = "";

                    }

        ?>

            <option value="<?php echo $row['id'];?>" <?php echo $selected;?>><?php echo $row['nombre'];?></option> 

        <?php 

                } //END FOREACH

            } //END IF

        ?>

    </select>

</div>

</div>



            <div class="col-md-3">

                <div class="form-group">

                    <label for="tipo">Marca</label>

                    <select class="selectpicker" id="marca" name="marca" data-width="100%" data-live-search="true">
                   

                        <?php


                            if ($marcas != null) {

                                $selected = "";

                                foreach ($marcas as $row) {	

                                    if ($row['id'] == $producto['id_marca']) {

                                        $selected = " selected";

                                    } else {

                                        $selected = "";

                                    }

                        ?>

                            <option value="<?php echo $row['id'];?>" <?php echo $selected;?>><?php echo $row['nombre'];?></option> 

                        <?php 

                                } //END FOREACH

                            } //END IF

                        ?>

                    </select>

                </div>

            </div>

            <div class="col-md-2">

                <?php 

                    if ($producto['precio'] > 0) {

                        $minorista = number_format($producto['precio'], 0, ',', '.');

                    } else {

                        $minorista = "";

                    }

                ?>

                <div class="form-group">

                    <label for="valorminorista">Precio</label>

                    <input type="text" class="form-control" id="precio" name="precio" placeholder="999.999.999.999" value="<?php echo $minorista;?>" onKeyUp="formatoMoneda(this, event)" maxlength="15">

                </div>

            </div>

            <div class="col-md-2">

                <?php 

                    if ($producto['valor_descuento'] > 0) {

                        $mayorista = number_format($producto['valor_descuento'], 0, ',', '.');

                    } else {

                        $mayorista = "";

                    }

                ?>

                <div class="form-group">

                    <label for="valormayorista">Valor Descuento</label>

                    <input type="text" class="form-control" id="descuento" name="descuento" placeholder="999.999.999.999" value="<?php echo $mayorista;?>" onKeyUp="formatoMoneda(this, event)" maxlength="15">

                </div>

            </div>

            <div class="col-md-7">

                <div class="form-group">

                    <label for="nombre">Nombre</label>

                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del Producto" maxlength="80" value="<?php echo $producto['nombre'];?>" required>

                </div>

            </div>

            <div class="col-md-3">

                <div class="form-group">

                    <label for="atributo">Atributos</label>

                    <select class="selectpicker" id="atributo" name="atributo[]" data-width="100%" data-live-search="true" multiple>

                        <?php

                            if ($atributos != null) {

                                $selected = "";

                                $i = 0;

                                foreach ($atributos as $row) {	

                                    if ($row['activo'] == 1) {

                                        if ($row['id'] == $atributosprod[$i]['id_atributo']) {

                                            $selected = " selected";

                                            $i++;

                                        } else {

                                            $selected = "";

                                        }

                        ?>

                            <option value="<?php echo $row['id'];?>" <?php echo $selected;?>><?php echo $row['nombre'];?></option> 

                        <?php 

                                    } //END IF

                                } //END FOREACH

                            } //END IF

                        ?>

                    </select>

                </div>

            </div>

            <div class="col-md-1">

                <div class="form-group">

                    <label for="descripcion">Destacado</label>

                    <?php

                        $destacado = "";

                        if ($producto['destaque'] == 0) {

                            $destacado = "";

                        } else {

                            $destacado = " checked";

                        }

                    ?>

                    <div class="row">

                        <div class="col-md-12">

                            <input type="checkbox" name="destacado" id="toggle-destacado" data-toggle="toggle" data-on="Sí" data-off="No" data-onstyle="success" data-offstyle="warning" data-width="100%" data-height="35" <?php echo $destacado;?>>

                        </div>

                    </div>

                </div>

            </div>

            <div class="col-md-1">

                <div class="form-group">

                    <label for="descripcion">Activo</label>

                    <?php

                        $activo = "";

                        if ($producto['activo'] == 0) {

                            $activo = "";

                        } else {

                            $activo = " checked";

                        }



                        if ($producto == null) {

                            $activo = " checked";

                        }

                    ?>

                    <div class="row">

                        <div class="col-md-12">

                            <input type="checkbox" name="activo" id="toggle" data-toggle="toggle" data-on="Sí" data-off="No" data-onstyle="success" data-offstyle="warning" data-width="100%" data-height="35" <?php echo $activo;?>>

                        </div>

                    </div>

                </div>

            </div>

            <div class="col-md-12">

                <div class="form-group">

                    <label for="descripcion">Descripción Corta</label>

                    <textarea class="form-control" rows="3" id="descripcion" name="descripcion" placeholder="Descripción del Producto" maxlength="200"><?php echo $producto['descripcion_corta'];?></textarea>

                </div>

            </div>

            <div class="col-md-12">

                <div class="form-group">

                    <label for="descripcion">Descripción Detallada</label>

                    <textarea class="form-control" rows="5" id="detallada" name="detallada" placeholder="Descripción Detallada del Producto" maxlength="200"><?php echo $producto['descripcion_detallada'];?></textarea>

                </div>

            </div>

        </div> <!-- row -->



        <div class="pull-right">

            <button type="button" class="btn btn-danger pull-left" name="excluir" id="btn-confirmarpr" style="margin-right: 10px;">Excluir</button>

            <button type="submit" class="btn" name="excluirpr" id="btn-excluirpr" style="display: none;">Submit Excluir</button>

            <button type="submit" class="btn btn-primary pull-right" name="guardarpr">Guardar</button>

        </div>

        <button type="button" class="btn btn-default" onclick="window.location.href = 'producto.php';">Cerrar</button>

    </div> <!-- modal-body -->

</form>



<!-- Confirmación Modal (para excluisiones) -->

<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="mi-modal">

    <div class="modal-dialog modal-sm">

        <div class="modal-content">

            <div class="modal-header">

                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                <h4 class="modal-title text-center" id="myModalLabel">¿Deseas eliminar el producto <?php echo $producto['id'];?>?</h4>

            </div>

            <div class="modal-footer">

                <button type="button" class="btn btn-default" id="modal-btn-si">Sí</button>

                <button type="button" class="btn btn-primary" id="modal-btn-no">No</button>

            </div>

        </div>

    </div>

</div>

<!-- Confirmación Modal (para excluisiones) -->





<script>

  $(function () {

    // Replace the <textarea id="editor1"> with a CKEditor

    // instance, using default configuration.

    CKEDITOR.replace('detallada')

    //bootstrap WYSIHTML5 - text editor

    // $('.textarea').wysihtml5()

  })

</script>