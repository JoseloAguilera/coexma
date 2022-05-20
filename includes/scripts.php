
<script type="text/javascript" >
	
	var btn = $('#button');

	$(window).scroll(function() {
	if ($(window).scrollTop() > 300) {
		btn.addClass('show');
	} else {
		btn.removeClass('show');
	}
	});

	btn.on('click', function(e) {
	e.preventDefault();
	$('html, body').animate({scrollTop:0}, '300');
	});

</script>

<script>
         <!--
            function WriteCookie() {
               var now = new Date();
               var minutes = 30;
               now.setTime(now.getTime() + (minutes * 60 * 1000));
               cookievalue ="watsclickon";

               document.cookie="name=" + cookievalue;
               document.cookie = "expires=" + now.toUTCString() + ";"
               document.write ("Setting Cookies : " + "name=" + cookievalue );
            }
         //-->
      </script>


<script  type="text/javascript" >
function guardar(codvendedor, vendedor_whatsapp) {
  
var _nombre = document.getElementById("whats_nombre").value;
var _telefono = document.getElementById("whats_nro").value;
var _vendedor = codvendedor;
var currentLocation = window.location.href;
currentLocation = currentLocation.replace(/\s/g, '%20')
if (_nombre==""){
      		alert("Tiene que introducir tu Nombre.")
      		document.getElementById("whats_nombre").focus()
         
      		//return 0;
} else if (_telefono==""){
      		alert("Tiene que introducir tu Nro. de Telefono.")
      		document.getElementById("whats_nro").focus()
      		//return 0;
} else {
var datos = {
  "whats_nombre" : _nombre,
  "whats_nro" : _telefono,
  "whats_vendedor" : _vendedor,
  "full_url":  currentLocation
};

$("#vendedores").css("display", "none");
$("#loading-i").css("display", "block");

$.ajax({
  data:  datos,
  url:   'send_whatsapp.php',
  type:  'post',
  success:  function (response) {
	if(response==1)


	 
	  window.open('https://api.whatsapp.com/send?phone="'+vendedor_whatsapp+'&text=Hola, me llamo '+_nombre +', me gustaria conocer más sobre este producto: "'+currentLocation+'"', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=1,width=300,height=200,left = 390,top = 50');
  
    
	else
	  alert('Por favor intente de nuevo.')
  }
});


setTimeout("$('#whatsmodal').modal('hide');",5000);

$
}

//var i = 1; 
//contador para asignar id al boton que borrara la fila

//var fila = '<tr id="row' + i + '"><td>' + _planta + '</td><td>' + _solicitante + '</td><td>' + _codPT + '</td><td>' + _descPT + '</td><td>' + _lote + '</td><td>' + _ff + '</td><td>' + _fv + '</td><td>' + _vida + '</td><td>' + _codE + '</td><td>' + _descE + '</td><td>' + _cant + '</td><td><button type="button" name="remove" id="' + i + '" class="btn btn-danger btn_remove">Borrar</button></td></tr>'; 

//i++;

//var btn = document.createElement("TR");
//btn.innerHTML=fila;
//document.getElementById("mytable").appendChild(btn);

//document.getElementById("whats_nombre").value ="";
//document.getElementById("whats_nro").value = "";

//d//ocument.getElementById("whats_vendedor").value ="";

};
</script>


 
<script type="text/javascript" >

$("#loading-i").css("display", "none");
	$(document).ready(function(e){
	  $("#unidades").change(function(){
	 		var parametros= "id="+$("#unidades").val();
	 		$.ajax({
                data:  parametros,
                url:   'includes/vendedores.php',
                type:  'post',
                beforeSend: function () { },
                success:  function (response) {                	
                    $("#vendedores").html(response);
              
                },
                error:function(){
                	alert("error")
                }
            });
	 	});  
		
});

  </script>

  
<script>
    AOS.init();
    </script>








