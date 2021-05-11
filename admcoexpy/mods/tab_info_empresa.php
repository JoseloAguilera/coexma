<form action="" method="POST"  autocomplete="off">
    <div class="modal-body">
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="descripcion">Contenido de página</label>
                    <!-- <textarea class="form-control" rows="15" id="descripcion" name="descripcion" placeholder="Descripción del Producto" maxlength="200"><?php echo "producto['descripcion']";?></textarea> -->
                    <textarea id="edtempresa" name="edtempresa" rows="10" cols="80">
                        <?php echo $info_empresa['contenido'];?>
                    </textarea>
                </div>
            </div>
        </div> <!-- row -->
        <div class="row">
            <div class="pull-right">
                <button type="submit" class="btn btn-primary pull-right" name="guardarempresa">Guardar</button>
            </div>
        </div>
    </div> <!-- modal-body -->
</form>

<script>
  $(function () {
    // Replace the <textarea id="editor1"> with a CKEditor
    // instance, using default configuration.
    CKEDITOR.replace('edtempresa')
    //bootstrap WYSIHTML5 - text editor
    $('.textarea').wysihtml5()
  })
</script>