ACC.facturacion = {

	_autoload : ["bindBuscar"],

	
	bindBuscar : function(){
		$(document).on("click", ".facBuscar", function(){

			var imp = document.getElementById('impuesto').value;
			var tabpred = document.getElementById('table-predial');
			var tabveh = document.getElementById('table-vehiculos');
			var aniogravFiltro = document.getElementById('aniograv').value;
			var borrar = false;
			
			tabpred.style.display = 'none';
			tabveh.style.display = 'none';

			
			switch(imp){
			case "0001":
				ACC.facturacion.filtrarRegistros_aniograv("tabPaginacion0","0",aniogravFiltro);
				tabpred.style.display = 'block';
				break;
			case "0002":
				ACC.facturacion.filtrarRegistros_aniograv("tabPaginacion1","0",aniogravFiltro);
				tabveh.style.display = 'block';
				break;
				
			default:
				break;
			}
			
		}
		);
	},
	
	
	filtrarRegistros_aniograv : function(nombreTabla,indiceFiltro,aniogravFiltro){
		
		$("#"+nombreTabla+" tbody tr").each(function(index){
			var borrar = false;
			
			$(this).find('td:eq('+indiceFiltro+')').each(function (index){
				var valor = $(this).html();
				if(valor != aniogravFiltro && valor != "No se encontraron registros"){
					borrar = true;
				}
			});
			if(borrar == true){
				$(this).hide();
			}else{
				$(this).show();
			}
		}
		);
		
	},
	
	establecerCat_aniograv : function(){
		var aniograv = new Date().getFullYear();
		
		$("#aniograv").empty();
		$("#aniograv").append('<option value="">Seleccionar</option>');
		$("#aniograv").append('<option value="'+ aniograv + '">'+ aniograv + '</option>');
		
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
					debugger;
					ACC.spinner.close();
					ACC.facturacion.manejarRespuesta(dataResponse);
					
				}
			,
				error : function() {
					debugger;
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