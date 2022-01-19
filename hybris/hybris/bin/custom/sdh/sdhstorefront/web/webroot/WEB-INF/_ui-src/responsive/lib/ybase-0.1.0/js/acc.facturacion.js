ACC.facturacion = {

	_autoload : ["bindBuscar","bindPagarFacturaBtn"],

	
	bindBuscar : function(){
		$(document).on("click", ".facBuscar", function(){

			var imp = document.getElementById('impuesto').value;
			var tabpred = document.getElementById('table-predial');
			var tabveh = document.getElementById('table-vehiculos');
			var aniogravFiltro = document.getElementById('aniograv').value;
			var borrar = false;
			
			tabpred.style.display = 'none';
			tabveh.style.display = 'none';

			if(aniogravFiltro != ""){
				switch(imp){
				case "0001":
	//				ACC.facturacion.filtrarRegistros_aniograv("tabla_vehi","0",aniogravFiltro);
					tabpred.style.display = 'block';
					break;
				case "0002":
	//				ACC.facturacion.filtrarRegistros_aniograv("tabla_vehi","0",aniogravFiltro);
					tabveh.style.display = 'block';
					break;
					
				default:
					break;
				}
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
	
	
	descargaFactura : function (anoGravable,numObjeto,tipoOperacion,descargaFactura1){
		ACC.spinner.show();
		if(descargaFactura1 != undefined && descargaFactura1 != null){
			var objnew = descargaFactura1;
			
//			anoGravable = $.trim($(objnew).attr("data-anioGrav"));
			numObjeto = $.trim($(objnew).attr("data-numObjeto"));
		}
			
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


	refreshTablas : function(){
		var tabpred = document.getElementById('table-predial');
		var tabveh = document.getElementById('table-vehiculos');
		
		if(tabpred != null){
			tabpred.style.display = 'none';
		}
		if(tabveh != null){
			tabveh.style.display = 'none';
		}

	},
	 
	 
	 validarAntesSubmit : function (anoGravable,numObjeto){
		 var flagValidacion = false;
		 
		 if(anoGravable!= null && numObjeto != null){
			 flagValidacion = true;
		 }
		 return flagValidacion;
	 },

	copieied: function(text) {

	 $("#asmCopyHoldtext").val(text);
    $("#asmCopyHoldtext").show();
    $("#asmCopyHoldtext").select();
    try {
        return document.execCommand("copy");
    } catch (ex) {
        console.debug("Copy to clipboard failed.", ex);
        return false;
    } finally {
        $("#asmCopyHoldtext").hide();
    }

		

	},
	
	
	bindPagarFacturaBtn : function(){
		$(document).on("click", "#pagarFacturaBtn", function(e) {
			e.preventDefault();
			
			var impuesto = $(this).data("impuesto");
			var numbp = $(this).data("numbp");
			var numObjeto = $(this).data("numobjeto");
			var anioGravable = $(this).data("aniogravable");
			
			if(ACC.facturacion.validarAntesSubmitWSPagar(impuesto,anoGravable,numObjeto)){
				ACC.spinner.show();
				var dataActual = {};	
				
				dataActual.impuesto = impuesto;
				dataActual.numbp = numbp;
				dataActual.numObjeto = numObjeto;
				dataActual.anioGravable = anioGravable;
				$.ajax({
					url : ACC.facturacionPagosURL,
					data : dataActual,
					type : "GET",
					success : function(dataResponse) {
						ACC.spinner.close();
						ACC.facturacion.manejarRespuestaWSPagar(dataActual,dataResponse);
					},
					error : function() {
						ACC.spinner.close();
						alert("Error procesar la solicitud de proceso de pago");	
					}
				});
			}
			
			
		});
		
		
	},
	
	
	manejarRespuestaWSPagar : function(dataActual,dataResponse){
//		ACC.publicidadexterior.bindDataTable_ID_refresh("#example");
		ACC.facturacion.manejarRespuestaWSPagar_registrosTabla(dataActual,dataResponse);
		
		var tableImpuesto = document.getElementsByClassName("table pagarImpuesto");
//		tableImpuesto[0].setAttribute("id","example");
//		ACC.publicidadexterior.bindDataTable_id("#example");
		
		switch (dataActual.impuesto){
			case "0001":
				ACC.facturacion.visualizacionPopUpPagar (tableImpuesto[0],"Predial","0001");
			break;
			case "0002":
				ACC.facturacion.visualizacionPopUpPagar (tableImpuesto[0],"Vehicular","0001");
			break;
		}

		
	},
	
	
	manejarRespuestaWSPagar_registrosTabla : function(dataActual,dataResponse){
		var claveCSSTabla = ".pagarImpuesto";
		
		var valueS = {};
		var valueC = {};
		var value = {};
		if(dataResponse != null){
			switch (dataActual.impuesto){
				case "0001":
					if(dataResponse.responsePredial != null){
						value.impuesto = "5101";
						value.periodo = "";
						value.cdu = "";
						value.placa = "";
						value.facilidad = "";
						value.montoFacilidad = "";
						value.anoGravable = dataResponse.responsePredial.anoGravable;
						value.chip = dataResponse.responsePredial.CHIP;
						value.numObjeto = dataResponse.responsePredial.CHIP;
						value.fechaVenc = dataResponse.responsePredial.fechaVencimiento;
						value.numRef = dataResponse.responsePredial.numReferencia;
						valueS = Object.assign({}, value);
						valueC = Object.assign({}, value);
						valueS.montoAporte = dataResponse.responsePredial.totalPagar;
						valueS.pagoVoluntario = "0.00";
						valueC.montoAporte = dataResponse.responsePredial.totalConVoluntario;
						valueC.pagoVoluntario = dataResponse.responsePredial.pagoVoluntario;
					}
					break;
				
				case "0002":
					if(dataResponse.responseVehicular != null){
						value.impuesto = "5103";
						value.periodo = "";
						value.chip = "";
						value.cdu = "";
						value.facilidad = "";
						value.montoFacilidad = "";
						value.anoGravable = dataResponse.responseVehicular.anoGravable;
						value.placa = dataResponse.responseVehicular.placa;
						value.numObjeto = dataResponse.responseVehicular.placa;
						value.fechaVenc = dataResponse.responseVehicular.fechaVencimiento;
						value.numRef = dataResponse.responseVehicular.numReferencia;
						valueS = Object.assign({}, value);
						valueC = Object.assign({}, value);
						valueS.montoAporte = dataResponse.responseVehicular.totalPagar;
						valueS.pagoVoluntario = "0.00";
						valueC.montoAporte = dataResponse.responseVehicular.totalConVoluntario;
						valueC.pagoVoluntario = dataResponse.responseVehicular.pagoVoluntario;
					}
					break;
				default:
					break;
			}
		}
		
		
		if( claveCSSTabla != null){
			$(claveCSSTabla+" tbody tr").remove();
			$(claveCSSTabla+" tbody").append(ACC.facturacion.generarRegistroTablaPagar("Pago sin aporte voluntario",valueS));
			$(claveCSSTabla+" tbody").append(ACC.facturacion.generarRegistroTablaPagar("Pago con aporte voluntario",valueC));
		}

		
	},
	
	
	generarRegistroTablaPagar : function(tituloTD,value){
		return '<tr>'+
			'<td>'+ tituloTD  + '</td>' +
			'<td>'+ value.numRef + '</td>' +
			'<td>'+ value.montoAporte + '</td>' +
			'<td><label class="control-label" style="visibility: visible !important; width: 100%; text-transform: capitalize; color: #0358d8 !important; text-align: center " id="Detalle" '+ 
			'onclick="pagarEnLinea('
				+ '\'' + value.impuesto + '\','
				+ '\'' + value.anoGravable + '\','
				+ '\'' + value.periodo + '\','
				+ '\'' + value.numObjeto + '\','
				+ '\'' + value.chip + '\','
				+ '\'' + value.fechaVenc + '\','
				+ '\'' + value.numRef + '\','
				+ '\'' + value.montoAporte + '\','
				+ '\'' + value.cdu + '\','
				+ '\'' + value.placa + '\','
				+ '\'' + value.facilidad + '\','
				+ '\'' + value.montoFacilidad + '\','
				+ '\'' + value.pagoVoluntario + '\''	
				+')" ' +			
			'>Pagar</label></td>'+
			'</tr>'
	},
	
	
	llamarPago : function(boton){
		var concepto = $(boton).data("concepto");
		var numReferencia = $(boton).data("numreferencia");
		var monto = $(boton).data("monto");
		
		alert("aca se realiza el llamado para pagar concepto: " + concepto + " numReferencia: " + numReferencia + " monto: " + monto);	
	},
	
	
	
	validarAntesSubmitWSPagar : function(impuesto,anoGravable,numObjeto){
		var validacion = true;
		
		return validacion;
	},
	
	
	visualizacionPopUpPagar : function(tabla, tituloTabla, impuesto){

        ACC.colorbox.open(tituloTabla, {
            href: ".js-"+ impuesto +"-facet",
            inline: true,
            width: "90%",
            onComplete: function () {
                $(document).on("click", ".js-"+ impuesto +"-facet .js-facet-name-" + impuesto, function (e) {
                    e.preventDefault();
                    $(".js-"+ impuesto +"-facet  .js-facet-" + impuesto).removeClass("active");
                    $(this).parents(".js-facet-" + impuesto).addClass("active");
                    $.colorbox.resize()
                })
            },
            onClosed: function () {
                $(document).off("click", ".js-"+ impuesto +"-facet .js-facet-name-" + impuesto );
            }
        });
		
		
	}
	
	
};