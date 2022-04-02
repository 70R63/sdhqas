<%@ tag body-content="empty" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="formElement"
	tagdir="/WEB-INF/tags/addons/sdhpsaddon/responsive/formElement"%>




<spring:url value="/impuestos/preparaPagoPSE" var="pagarURL"
	htmlEscape="false" />

<div class="container">
	<div class="row">
		<sf:form action="${pagarURL}" method="POST" modelAttribute="infoPreviaPSE" id="infoPreviaPSE">
			<div class="col-md-2">
				<sf:hidden path="tipoImpuesto" id="pagarEnLinea_tipoImpuesto"/>
				<sf:hidden path="numBP" id="pagarEnLinea_numBP"/>
				<sf:hidden path="numDoc" id="pagarEnLinea_numDoc"/>
				<sf:hidden path="tipoDoc" id="pagarEnLinea_tipoDoc"/>
				<sf:hidden path="anoGravable" id="pagarEnLinea_anoGravable"/>
				<sf:hidden path="periodo" id="pagarEnLinea_periodo"/>
				<sf:hidden path="clavePeriodo" id="pagarEnLinea_clavePeriodo"/>
				<sf:hidden path="dv" id="pagarEnLinea_dv"/>
				<sf:hidden path="numObjeto" id="pagarEnLinea_numObjeto"/>
				<sf:hidden path="chip" id="pagarEnLinea_chip"/>
				<sf:hidden path="fechaVenc" id="pagarEnLinea_fechaVenc"/>
				<sf:hidden path="numRef" id="pagarEnLinea_numRef"/>
				<sf:hidden path="totalPagar" id="pagarEnLinea_totalPagar"/>
				<sf:hidden path="cdu" id="pagarEnLinea_cdu"/>
				<sf:hidden path="placa" id="pagarEnLinea_placa"/>
				<sf:hidden path="pagoVoluntario" id="pagarEnLinea_pagoVoluntario"/>				
			</div>
		</sf:form>
	</div>
</div>	

<spring:htmlEscape defaultHtmlEscape="true" />

<div class="container_new_page">
	<div class="row">
		<div class="headline">
			<h2 align="center">
				<span><spring:theme code="Facturaci�n" /></span>
			</h2>
		</div>
	</div>


	<div class="row">
		<div class="col-md-4 col-xs-12 mb-20 no-marginright">
			<span class="paso--uno pasos color-sr1">1</span>
			<h2 class="titulo-caja--ser-rel color-sr1 ">DESCARGA DE FACTURA</h2>
			<p class="pasoClase1 metrophobic">Selecciona el impuesto que deseas consultar.</p>
			<div class="caja--ser-rel color-sr1">
				<select class="new_alto form-control !important" id="impuesto" onchange="refreshTablas();">
					<option value="00">Seleccionar</option>
					<c:if test="${ not empty facturacionForm.predial}">
						<option value="0001">Predial Unificado</option>
					</c:if>
					<c:if test="${ not empty facturacionForm.vehicular}">
						<option value="0002">Impuesto sobre Veh�culos Automotores</option>
					</c:if>
				</select>
			</div>
		</div>




		<div class="col-md-4 col-xs-12 mb-20 no-margincol">
			<span class="paso--dos pasos color-sr2">2</span>
			<h2 class="titulo-caja--ser-rel color-sr2 ">
				<span class="paso2">A�O GRAVABLE</span>
			</h2>
			<p class="pasoClase2 metrophobic">Selecciona el a�o gravable.</p>
			<div class="caja--ser-rel color-sr2">
				<sf:form modelAttribute="descargaFacturaForm" >
					<sf:select path="anoGravable" items="${listaAnioGravable}" id="aniograv" class="new_alto form-control " name="aniograv"/>
				</sf:form>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3 col-md-offset-3">
			<button style="margin-top: 3px;" id="" class="btn btn-primary btn-lg facBuscar" type="button" id="facBuscar">
				<spring:theme code="descarga.factura.inicial.buscar" />
			</button>
		</div>
	</div>
	<br>
	<div id="table-predial" style="display: none;" class="table-responsive">
			<div class="col-md-12">
			<button id="solBenePredial" style="float: right;" type="button" data-impuesto="0001" data-numbp="" data-anioGravable="" data-numObjeto="" onclick="btnObtainBene()">Solicitar Beneficio</button>
				<table id="tabPaginacion0">
					<thead>
						<tr>
<!-- 							<th style="text-align: center" hidden="hidden"><label class="control-label labeltabletd " for="">Ao Gravable</label></th> -->
							<th class="col-md-1" style="text-align: center"><label class="control-label labeltabletd" for=""><spring:theme code="descarga.factura.predial.chip" /></label></th>
							<th class="col-md-1" style="text-align: center"><label class="control-label labeltabletd" for=""> <spring:theme code="descarga.factura.predial.matinm" /></label></th>
							<th class="col-md-1" style="text-align: center"><label class="control-label labeltabletd" for=""> <spring:theme code="descarga.factura.predial.dirpred" /></label></th>
							<!-- 							<th style="text-align: center"><label class="control-label" -->
							<%-- 								for=""> <spring:theme --%>
							<%-- 										code="descarga.factura.predial.selec" /></label></th> --%>
<%-- 							<th class="col-md-1" style="text-align: center"><label class="control-label labeltabletd" for=""> <spring:theme code="Pago voluntario" /></label></th> --%>
<!-- 							<th style="text-align: center"><label class="control-label" -->
<%-- 								for=""> <spring:theme code="Total a pagar" /></label></th> --%>
<!-- 							<th style="text-align: center"><label class="control-label" -->
<%-- 								for=""> <spring:theme code="Total con pago voluntario" /></label></th> --%>
							<th class="col-md-1" style="text-align: center"><label class="control-label labeltabletd " for=""> <spring:theme code="Descargar factura" /></label></th>
							<th class="col-md-1" style="text-align: center"><label class="control-label labeltabletd " for=""> <spring:theme code="Actualizar datos" /></label></th>
<th class="col-md-1" style="text-align: center"><label class="control-label labeltabletd " for=""> <spring:theme code="Beneficio 1%" /></label></th>
							<th class="col-md-1" style="text-align: center"><label class="control-label labeltabletd " for=""> <spring:theme code="Pagar" /></label></th>
<%-- 							<th class="col-md-1" style="text-align: center"><label class="control-label labeltabletd " for=""> <spring:theme code="Pagar sin aporte" /></label></th> --%>
						<th class="col-md-1" style="text-align: center"><label class="control-label labeltabletd " for=""> <spring:theme code="Seleccionar" /></label></th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${facturacionForm.predial }" var="eachPredial">
							<c:if
								test="${not empty eachPredial.matrInmobiliaria || not empty eachPredial.CHIP}">
								<c:if
									test="${not empty eachPredial.anioGravable || not empty eachPredial.direccionPredio}">
									<tr>
<%-- 										<td hidden="hidden"><c:out value="${eachPredial.anioGravable}" /></td> --%>
										<td><c:out value="${eachPredial.CHIP}" /></td>
										<td><c:out value="${eachPredial.matrInmobiliaria}" /></td>
										<td><c:out value="${eachPredial.direccionPredio}" /></td>
										<!-- 								<td><input class="inputtextnew" -->
										<!-- 									style="visibility: visible !important; width: 15px" -->
										<%-- 									type="radio" id="" name="objetoPredial" value="${eachPredial.numObjeto}"></td> --%>
<!-- 										<td></td> -->
<!-- 										<td></td> -->
<!-- 										<td></td> -->
<td><img id="imgDescarga" class="renglonBeneficios" src="${themeResourcePath}/images/download_icon.png" onclick="descargaFactura(this)"  data-claveImpuesto="0001" data-nombreObjeto="objetoPredial" data-anioGrav="${eachPredial.anioGravable}" data-numobjeto="${eachPredial.numObjeto}"></img></td>
										<td><label class="control-label renglonBeneficios"
											style="text-transform: capitalize !importan;color: #2196f3; text-decoration: underline !important; font-size: 14px;t"
											id="downloadFac" data-claveImpuesto="0001"
											data-nombreObjeto="objetoPredial"
											data-anioGrav="${eachPredial.anioGravable}" data-numobjeto="${eachPredial.numObjeto}"
											onclick="reexpedicion(this)"> <span class="">Actualizar</span></label></td>
										<td><label class="control-label renglonBeneficios"
											style="text-transform: capitalize !important; color: #2196f3; text-decoration: underline !important; font-size: 14px;"
											id="obtainBenef" data-claveImpuesto="0001"
											data-nombreObjeto="objetoPredial"
											data-anioGrav="${eachPredial.anioGravable}" data-numobjeto="${eachPredial.numObjeto}"
											onclick="obtainBene(this)"> <span class="">Obtener Descuento</span></label></td>
									<td><button class="renglonBeneficios" id="pagarFacturaBtn" type="button" data-impuesto="0001" data-numbp="${facturacionForm.numbp}" data-anioGravable="${eachPredial.anioGravable}" data-numObjeto="${eachPredial.numObjeto}" >Pagar</button></td>
<!-- 									<td><a onclick="validaBotonPago()"></a></td> -->
<td>	<div class="checkbox" role="checkbox" aria-checked="false"
								id="buzon2" style=" cursor: not-allowed;" data-numobjeto="${eachPredial.numObjeto}">
								<label tabindex="0" class="control-label" id="checkBeEneficio"> <input
									id="checkBeEneficio" name="checkBeEneficio" type="checkbox" ${ checked}
									value="true">
								</label>
							</div></td>

									</tr>
								</c:if>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
<!-- 		<div class="row"> -->
<!-- 			<div class="col-md-3 col-md-offset-5"> -->
<!-- 				<button style="margin-top: 3px;" id="" -->
<!-- 					class="btn btn-primary btn-lg" type="button" -->
<!-- 					onclick="descargaFactura()"> -->
<%-- 					<spring:theme code="descarga.factura.predial.desfact" /> --%>
<!-- 				</button> -->
<!-- 			</div> -->
<!-- 		</div> -->
<div class="mensaje">
								<spring:theme code="Si usted desea ser acreedor del descuento del 1% para m�s de una factura y m�ximo 5 presiona el bot�n de \"Solicitar beneficio\"" htmlEscape="false" />
							</div>
	</div>

	<div id="table-vehiculos" style="display: none;" class="table-responsive">
			<div class="col-md-12">
			<button id="solBeneVehicular" style="float: right;" type="button" data-impuesto="0002" data-numbp="" data-anioGravable="" data-numObjeto="" onclick="btnObtainBene()">Solicitar Beneficio</button>
				<table id="tabla_vehi">
					<thead>
						<tr>
<!-- 							<th style="text-align: center" hidden="hidden"><label class="control-label " for="">ao gravable</label></th> -->
							<th class="col-md-1" style="text-align: center"><label class="control-label labeltabletd " for=""><spring:theme code="descarga.factura.vehiculo.placa" /></label></th>
							<th class="col-md-1" style="text-align: center"><label class="control-label labeltabletd " for=""> <spring:theme code="descarga.factura.vehiculo.marca" /></label></th>
							<!-- 							<th style="text-align: center"><label class="control-label" -->
							<%-- 								for=""> <spring:theme --%>
							<%-- 										code="descarga.factura.vehiculo.selec" /></label></th> --%>
<%-- 							<th class="col-md-1" style="text-align: center"><label class="control-labe labeltabletd l" for=""> <spring:theme code="Pago voluntario" /></label></th> --%>
<!-- 							<th style="text-align: center"><label class="control-label" -->
<%-- 								for=""> <spring:theme code="Total a pagar" /></label></th> --%>
<!-- 							<th style="text-align: center"><label class="control-label" -->
<%-- 								for=""> <spring:theme code="Total con pago voluntario" /></label></th> --%>
							<th class="col-md-1" style="text-align: center"><label class="control-label labeltabletd " for=""> <spring:theme code="Descargar factura" /></label></th>
							<th class="col-md-1" style="text-align: center"><label class="control-label labeltabletd" for=""> <spring:theme code="Actualizar datos" /></label></th>
<th class="col-md-1" style="text-align: center"><label class="control-label labeltabletd " for=""> <spring:theme code="Beneficio 1%" /></label></th>
							<th class="col-md-1" style="text-align: center"><label class="control-label labeltabletd " for=""> <spring:theme code="Pagar" /></label></th>
<%-- 							<th class="col-md-1" style="text-align: center"><label class="control-label labeltabletd " for=""> <spring:theme code="Pagar sin aporte" /></label></th> --%>
						<th class="col-md-1" style="text-align: center"><label class="control-label labeltabletd " for=""> <spring:theme code="Seleccionar" /></label></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${facturacionForm.vehicular }"
							var="eachVehiculo">
							<c:if test="${not empty eachVehiculo.anioGravable}">
								<c:if
									test="${not empty eachVehiculo.placa || not empty eachVehiculo.marca}">
									<tr>
<%-- 										<td hidden="hidden"><c:out value="${eachVehiculo.anioGravable}" /></td> --%>
										<td><c:out value="${eachVehiculo.placa}" /></td>
										<td class="td_marca">${eachVehiculo.marca}</td>
<!-- 										<td><input class="inputtextnew" -->
<!-- 											style="visibility: visible !important; width: 15px" -->
<!-- 											type="radio" id="" name="objetoVehicular" -->
<%-- 											value="${eachVehiculo.numObjeto}"></td> --%>
<!-- 														<td></td> -->
<!-- 										<td></td> -->
<!-- 										<td></td> -->
<td><img id="downloadFac" src="${themeResourcePath}/images/download_icon.png" onclick="descargaFactura(this)"  data-claveImpuesto="0002"
											data-nombreObjeto="objetoVehicular"
											data-anioGrav="${eachVehiculo.anioGravable}" data-numobjeto="${eachVehiculo.numObjeto}"></img></td>
										<td><label class="control-label" style="text-transform: capitalize !important; color: #2196f3; text-decoration: underline !important; font-size: 14px;"
											id="downloadFac" data-claveImpuesto="0002"
											data-nombreObjeto="objetoVehicular"
											data-anioGrav="${eachVehiculo.anioGravable}" data-numobjeto="${eachVehiculo.numObjeto}"
											onclick="reexpedicion(this)"> <span class="">Actualizar</span></label></td>
												<td><label class="control-label" style="text-transform: capitalize !important; color: #2196f3; text-decoration: underline !important; font-size: 14px;"
											id="ontainBeneVehi" data-claveImpuesto="0002"
											data-nombreObjeto="objetoVehicular"
											data-anioGrav="${eachVehiculo.anioGravable}" data-numobjeto="${eachVehiculo.numObjeto}"
											onclick="obtainBene(this)"> <span class="">Obtener Descuento</span></label></td>
<!-- 										<td></td> -->
										<td><button id="pagarFacturaBtn" type="button" data-impuesto="0002" data-numbp="${facturacionForm.numbp}" data-anioGravable="${eachVehiculo.anioGravable}" data-numObjeto="${eachVehiculo.numObjeto}" >Pagar</button></td>
<!-- 										<td><a onclick="validaBotonPago()"></a></td> -->
<td><div class="checkbox" role="checkbox" aria-checked="false"
								id="checkBeneficio" style=" cursor: not-allowed; padding: 0px;margin: 0px;" data-numobjeto="${eachVehiculo.numObjeto}">
								<label tabindex="0" class="control-label" id="checkBeEneficio"> <input
									id="checkBeEneficio" name="checkBeEneficio" type="checkbox"  ${ checked}
									value="true">
								</label>
							</div></td>
									</tr>
								</c:if>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="mensaje">
								<spring:theme code="Si usted desea ser acreedor del descuento del 1% para m�s de una factura y m�ximo 5 presiona el bot�n de \"Solicitar beneficio\"" htmlEscape="false" />
							</div>
		</div>
<!-- 		<div class="row"> -->
<!-- 			<div class="col-md-3 col-md-offset-5"> -->
<!-- 				<button style="margin-top: 3px;" id="" -->
<!-- 					class="btn btn-primary btn-lg" type="button" -->
<!-- 					onclick="descargaFactura()"> -->
<%-- 					<spring:theme code="descarga.factura.vehiculo.desfac" /> --%>
<!-- 				</button> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->


<div class="container">
	<spring:url value="/contribuyentes/reexpedicionfacturaAct" var="reexpedicionURL" htmlEscape="false" />
	<sf:form action="${reexpedicionURL}" method="GET"
 		modelAttribute="descargaFacturaForm" id="reexpedicionFacturaAct"> 
 		<sf:hidden path="anoGravable" id="anoGravable"/> 
 		<sf:hidden path="numObjeto" id="numObjeto"/> 
 	</sf:form> 
</div>
</div>

<script>
	function refreshTablas() {
		ACC.facturacion.refreshTablas();

	}
	function descargaFactura(descargaFactura1) {
		var anoGravable = $("#aniograv").val();
		var claveImpuesto = $("#impuesto").val();
		var numObjeto = $.trim($(descargaFactura1).attr("data-numobjeto"));
		
		ACC.facturacion.descargaFactura(anoGravable,numObjeto,1,descargaFactura1);
	}
	
		
	function reexpedicion(reexpedicionFactura){
		$("#anoGravable").val($("#aniograv").val());
		var claveImpuesto = $("#impuesto").val();
		var numObjeto = $.trim($(reexpedicionFactura).attr("data-numobjeto"));
		$("#numObjeto").val(numObjeto);

		var form = document.getElementById('reexpedicionFacturaAct');
		if(form!=null && numObjeto!= null && numObjeto!=""){
			form.submit();
		}
		
	}
	
	function validaBotonPago(){
		var totPagar = document.getElementById('totalPagar');
		var negativePos = totPagar.value.search("-");
		if(totPagar.value == '0' || totPagar.value == '0.00' || negativePos >= 0 ){
			alert('El total a pagar debe ser mayor a 0');
		var btnPagar = document.getElementById("action");
		btnPagar.disabled = true;
		}else{
			var form1 = document.getElementById('infoPreviaPSE');
			form1.submit();		
		}
		
	}
	
	
	function pagarEnLinea(tipoImpuesto,anoGravable,periodo,numObjeto,chip,fechaVenc,numRef,totalPagar,cdu,placa,facilidad,montoFacilidad,pagoVoluntario){
		
		var numBP = "${customerData.numBP}";
		var numDoc = "${customerData.documentNumber}";
		var tipoDoc = "${customerData.documentType}";
		if (periodo === null || periodo === '' || typeof periodo === 'undefined' ){
			var clavePeriodo = anoGravable.substr(2,2).concat("A1");
		}	  
		else{
			var clavePeriodo = anoGravable.substr(2,2).concat(periodo);
		} 
		var dv = "${customerData.digVer}";
		
		
		$("#pagarEnLinea_tipoImpuesto").val(tipoImpuesto);
		$("#pagarEnLinea_numBP").val(numBP);
		$("#pagarEnLinea_numDoc").val(numDoc);
		$("#pagarEnLinea_tipoDoc").val(tipoDoc);		
		$("#pagarEnLinea_anoGravable").val(anoGravable);
		$("#pagarEnLinea_periodo").val(periodo);
		$("#pagarEnLinea_clavePeriodo").val(clavePeriodo);
		$("#pagarEnLinea_dv").val(dv);
		$("#pagarEnLinea_numObjeto").val(numObjeto);
		$("#pagarEnLinea_chip").val(chip);
		$("#pagarEnLinea_cdu").val(cdu);
		$("#pagarEnLinea_placa").val(placa);
		
		
		if(fechaVenc === '' || fechaVenc.search("/") >= 0 || periodo.search("/") >= 0){
			$("#pagarEnLinea_fechaVenc").val(fechaVenc);
		}else{
			var fechaVencimineto = fechaVenc.substring(6,8).concat("/",fechaVenc.substring(4,6),"/",fechaVenc.substring(0,4));
			$("#pagarEnLinea_fechaVenc").val(fechaVencimineto);
		}
		
		$("#pagarEnLinea_numRef").val(numRef);
	    $("#pagarEnLinea_totalPagar").val(totalPagar);
	    $("#pagarEnLinea_pagoVoluntario").val(pagoVoluntario);
	    
		var form = document.getElementById("infoPreviaPSE");
		if(form!=null){
			form.submit();
		}
		
	}
	
	
</script>

