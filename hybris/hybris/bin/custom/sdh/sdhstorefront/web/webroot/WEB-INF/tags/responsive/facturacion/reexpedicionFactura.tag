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

<spring:htmlEscape defaultHtmlEscape="true" />

<div class="container_new_page">
	<div class="row">
		<div class="headline">
			<h2 align="center">
				<span><spring:theme code="reexpedicion.factura.inicial.titulo" /></span>
			</h2>
		</div>
	</div>


	<div class="row">
		<div class="col-md-4 col-xs-12 mb-20 no-marginright">
			<span class="paso--uno pasos color-sr1">1</span>
			<h2 class="titulo-caja--ser-rel color-sr1 ">REEXPEDICI�N DE FACTURA</h2>
			<p class="pasoClase1 metrophobic">Selecciona el impuesto que
				deseas consultar.</p>
			<div class="caja--ser-rel color-sr1">
				<select class="new_alto form-control !important" id="impuesto">
					<option value="00">Seleccionar</option>
					<option value="01">Predial Unificado</option>
					<option value="02">Veh�cular</option>
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
				<select id="aniograv" class="new_alto form-control " name="aniograv">
					<option value="">Seleccionar</option>
					<option value="2019">2019</option>
					<option value="2018">2018</option>
					<option value="2017">2017</option>
					<option value="2016">2016</option>
				</select>

			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3 col-md-offset-3">
			<button style="margin-top: 3px;" id="" class="btn btn-primary btn-lg"
				type="button" onclick="showtable()">
				<spring:theme code="reexpedicion.factura.inicial.buscar" />
			</button>
		</div>
	</div>
	<br>
	<div id="table-predial" style="display: none;">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<table class="table">
					<thead style="cellspacing: 10 !important">
						<tr>
							<th style="text-align: center"><label class="control-label "
								for=""><spring:theme
										code="reexpedicion.factura.predial.chip" /></label></th>
							<th style="text-align: center"><label class="control-label"
								for=""> <spring:theme
										code="reexpedicion.factura.predial.matinm" /></label></th>
							<th style="text-align: center"><label class="control-label"
								for=""> <spring:theme
										code="reexpedicion.factura.predial.dirpred" /></label></th>
							<th style="text-align: center"><label class="control-label"
								for=""> <spring:theme
										code="reexpedicion.factura.predial.selec" /></label></th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td><input style="width: 100%" class="inputtextnew"
								maxlength="30" size="30" disabled="disabled" type="text"
								value="<c:out value="CHIP"></c:out>" /></td>
							<td><input style="width: 100%" class="inputtextnew"
								maxlength="30" size="30" disabled="disabled" type="text"
								value="<c:out value="Matricula"></c:out>" /></td>
							<td><input style="width: 100%" class="inputtextnew"
								maxlength="30" size="30" disabled="disabled" type="text"
								value="<c:out value="Direccion"></c:out>" /></td>
							<td><input class="inputtextnew"
								style="visibility: visible !important; width: 15px" type="radio"
								id="" name="" value=""></td>

						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3 col-md-offset-5">
				<button style="margin-top: 3px;" id=""
					class="btn btn-primary btn-lg" type="button">
					<spring:theme code="descarga.factura.predial.desfact" />
				</button>
			</div>
		</div>
	</div>

	<div id="table-vehiculos" style="display: none;">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<table class="table">
					<thead style="cellspacing: 10 !important">
						<tr>
							<th style="text-align: center"><label class="control-label "
								for=""><spring:theme
										code="descarga.factura.vehiculo.placa" /></label></th>
							<th style="text-align: center"><label class="control-label"
								for=""> <spring:theme
										code="descarga.factura.vehiculo.marca" /></label></th>
							<th style="text-align: center"><label class="control-label"
								for=""> <spring:theme
										code="reexpedicion.factura.vehiculo.selec" /></label></th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td><input style="width: 100%" class="inputtextnew"
								maxlength="30" size="30" disabled="disabled" type="text"
								value="<c:out value="PLACA"></c:out>" /></td>
							<td><input style="width: 100%" class="inputtextnew"
								maxlength="30" size="30" disabled="disabled" type="text"
								value="<c:out value="MARCA"></c:out>" /></td>
							<td><input class="inputtextnew"
								style="visibility: visible !important; width: 15px" type="radio"
								id="" name="" value=""></td>

						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3 col-md-offset-5">
				<button style="margin-top: 3px;" id=""
					class="btn btn-primary btn-lg" type="button">
					<spring:theme code="reexpedicion.factura.vehiculo.desfac" />
				</button>
			</div>
		</div>

	</div>
</div>

<script>
function showtable(){
	debugger;

	var imp = document.getElementById('impuesto').value;
	var tabpred = document.getElementById('table-predial');
	var tabveh = document.getElementById('table-vehiculos');
	
	if (imp == '01' ){
		tabpred.style.display= 'block';
		tabveh.style.display='none';
		
	}else if(imp == '02'){
		tabpred.style.display='none';
		tabveh.style.display='block';
	}else{
		tabpred.style.display='none';
		tabveh.style.display='none';
	}
	
}
</script>
