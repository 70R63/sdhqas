ACC.facturacion = {

	_autoload : ["bindBuscar"],

	
	bindBuscar : function(){
		$(document).on("click", ".facBuscar", function(){
			var imp = document.getElementById('impuesto').value;
			var tabpred = document.getElementById('table-predial');
			var tabveh = document.getElementById('table-vehiculos');
			var buscar = document.getElementById('aniograv').value;
			

			if (imp == '0001') {
				
				$("#tabPaginacion0 tr").find('td:eq(0)').each(function () {
					 
					
					  valor = $(this).html();
					  if(valor == buscar){
						  $("#tabPaginacion0 tr").show();
						  
					  }else{
						  $("#tabPaginacion0 tr").show();
					  }
					})
					 
				
				tabpred.style.display = 'block';
				tabveh.style.display = 'none';


		        
			} else if (imp == '0002') {
				$("#tabPaginacion1 tr").find('td:eq(0)').each(function () {
					 
					  valor = $(this).html();
					  if(valor == buscar && valor != " "){
						  $("#tabPaginacion1 tr").show();
						  
					  }else{
						  $("#tabPaginacion1 tr").show();
//						  $("#tabPaginacion1 tr").hide();
					  }
					})
				tabpred.style.display = 'none';
				tabveh.style.display = 'block';
			} else {
				tabpred.style.display = 'none';
				tabveh.style.display = 'none';
			}

			
		});
	},
	
	
	descargaFactura : function (anoGravable,numObjeto,tipoOperacion){
		ACC.spinner.show();
		if(ACC.facturacion.validarAntesSubmit(anoGravable,numObjeto)){
			var dataActual = {};	
		
			
			dataActual.anoGravable = anoGravable;
			dataActual.numObjeto = numObjeto;
			dataActual.tipoOperacion = tipoOperacion;
			
			
			$.ajax({
				url : ACC.descargaFacturaURL,
				data : dataActual,
				type : "GET",
				success : function(dataResponse) {
					ACC.spinner.close();
					ACC.facturacion.manejarRespuesta(dataResponse);
				}
			,
				error : function() {
					ACC.spinner.close();
					alert("Error procesar la solicitud de descarga de factura");	
				}
			});
		}
	 },
	 
	 
	 manejarRespuesta : function (dataResponse){
		var descargarFactura = false;
		var strMensajeError = "";
		if(dataResponse != null && dataResponse.errores != null ){
    		$.each(dataResponse.errores, function( index, value ) {
    			if(value.txt_msj.trim() != ""){
    				strMensajeError = strMensajeError + value.txt_msj+"<br>";
    			}
    		});
		}
		
		if(strMensajeError != ""){
			$("#dialogMensajes" ).dialog( "open" );
			$("#dialogMensajesContent").html(strMensajeError);
		}else{
			if(dataResponse.urlDownload!=null && dataResponse.urlDownload != ""){
    			$("#downloadHelper").attr("href",dataResponse.urlDownload);
    			
    			document.getElementById("downloadHelper").click();
			}
		}
	 },
	 
	 
	 validarAntesSubmit : function (anoGravable,numObjeto){
		 var flagValidacion = false;
		 
		 if(anoGravable!= null && numObjeto != null){
			 flagValidacion = true;
		 }
		 return flagValidacion;
	 }
	
};