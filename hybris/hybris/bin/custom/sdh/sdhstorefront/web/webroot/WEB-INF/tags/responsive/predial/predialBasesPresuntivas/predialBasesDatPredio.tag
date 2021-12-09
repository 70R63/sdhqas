<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<c:set var="disabledDatosPredio" value="false" />
<c:if test="${predialFormbases.controlCampos.datosPredio == true}">
	<c:set var="disabledDatosPredio" value='true' />
</c:if>
<spring:htmlEscape defaultHtmlEscape="true" />
<div class="container">

	<form:form modelAttribute="predialFormbases">
		<div class="row">
			<div class="col-md-12">
				<div class="headline">
					<h2>
						<span class="col-md-10 "><spring:theme
								code="predial.basespresun.datospredio.titulo" /></span>
					</h2>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-2">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="Uso de suelo" /></label> 
						<select class="newalto form-control" id="usoSuelo" onchange="showDestino(this)">
						<option value="">Seleccionar</option>
							<option value="0">Urbano</option>
							<option value="1">Rural</option>
						</select>
			</div>
			</div>
				<div class="col-md-2" id="destHacendario" style="display: none">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="predial.basespresun.datliquidacion.destino" /></label> 
						<form:select class="newalto form-control" id="DestinoHacendario" path="estrLiquidacionPredial.destinoHacendario" items="${predialFormbases.catalogos.destinoHacendario}" onclick="accionCat_destinoHacendario()" disabled="${disabledDatosPredio}" onchange="showHacendario(this)"></form:select>
			</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="predial.basespresun.datospredio.areterreno" /></label> <input id="areaterreno"
						name="areaterreno" class="newalto form-control areaterreno" disabled type="text" value=""
						maxlength="240"></input>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="predial.basespresun.datospredio.areaconstru" /></label> <input id="areaconstruccion"
						name="areaconstruccion" class="newalto form-control areaconstruccion" disabled type="text" value=""
						maxlength="240"></input>
				</div>
			</div>
		</div>
		<div class="row">
				<div class="col-md-2">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="Actividad Ec�nomica" /></label> 
						<select class="newalto form-control" id="activEconomica" ></select>
			</div>
			</div>
			<div class="col-md-2">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="predial.basespresun.datospredio.prophorizon" /></label> 
							<form:select class="newalto form-control prophorizontal" id="propiedadHorizontal" path="estrDatosGenerales.propiedadHorizontal" items="${predialFormbases.catalogos.propiedadHorizontal}" disabled="${disabledDatosPredio}"></form:select>
							
				</div>
			</div>
					<div class="col-md-3">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="Base gravable calc." /></label> <input id="baseGrav"
						name="baseGrav" class="newalto form-control areaterreno" disabled type="text" value=""
						maxlength="240"></input>
				</div>
			</div>
					<div class="col-md-3">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="Tarifa" /></label> <input id="tarifa"
						name="baseGrav" class="newalto form-control areaterreno" disabled type="text" value=""
						maxlength="240"></input>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="predial.basespresun.datospredio.caracpredio" /></label> 
						<form:select style="display: none" class="newalto form-control" id="caracterizacionPredio" path="estrDatosGenerales.caracterizacionPredio" items="${predialFormbases.catalogos.caracteri61}" disabled="${disabledDatosPredio}"></form:select>
						<form:select style="display: none" class="newalto form-control" id="caracterizacionPredio62" path="estrDatosGenerales.caracterizacionPredio" items="${predialFormbases.catalogos.caracteri62}" disabled="${disabledDatosPredio}"></form:select>
						<form:select style="display: none" class="newalto form-control" id="caracterizacionPredio65" path="estrDatosGenerales.caracterizacionPredio" items="${predialFormbases.catalogos.caracteri65}" disabled="${disabledDatosPredio}"></form:select>
						<form:select style="display: none" class="newalto form-control" id="caracterizacionPredio67" path="estrDatosGenerales.caracterizacionPredio" items="${predialFormbases.catalogos.caracteri67}" disabled="${disabledDatosPredio}"></form:select>
				</div>
			</div>
					<div class="col-md-3">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="Confirmar BG final" /></label> <input id="confirmBG"
						name="baseGrav" class="newalto form-control areaterreno" disabled type="text" value=""
						maxlength="240"></input>
				</div>
			</div>
			</div>
			<div class="row">
			<div class="col-md-3">
				<div class="form-group">
				<c:if test="${predialFormbases.controlCampos.datosPredio != true}">
				<button id="buttonPrecalculo"
					class="btn btn-primary btn-lg buttonPrecalculo" type="button" onclick="accionPreCalculo()">
					<spring:theme code="predial.basespresun.datospredio.precalculo" />
				</button>
				</c:if>
				</div>
			</div>
		</div>
	</form:form>
</div>

<script type="text/javascript">

function accionPreCalculo(){
	
	var numBP = $('#numBP').val();
	var chip = $('#chip').val();
	var anioGravable = $('#anioGravable').val();
	var areaConstruida = $('#areaconstruccion').val();
	var areaTerrenoCatastro = $('#areaterreno').val();
	var caracterizacionPredio = $('#caracterizacionPredio').val();
	var propiedadHorizontal = $('#propiedadHorizontal').val();
	var destinoHacendario = $('#DestinoHacendario').val();
	
	ACC.predial.ejecutarPreCalculoPB(numBP,chip,anioGravable,areaConstruida,areaTerrenoCatastro,caracterizacionPredio, propiedadHorizontal, destinoHacendario);
	
}

function accionCat_destinoHacendario(){

	$("#caracterizacionPredio").find("option:gt(0)").remove();	
	if($("#DestinoHacendario").val() != null){
		for(var i=0;i<cat_predial_caracterizacionPredio.length;i++){
			if(cat_predial_caracterizacionPredio[i].destinoHacendario == $("#DestinoHacendario").val()){
				$('#caracterizacionPredio').append('<option value="'+ cat_predial_caracterizacionPredio[i].itemId +'">'+ cat_predial_caracterizacionPredio[i].itemValue + "</option>");
			}
		}		
	}
	}
	

	function showDestino(object) {
		var opt = object;
		var dest = document.getElementById("destHacendario");
		var x = document.getElementById('usoSuelo').value;

		if (x == '0') {
			dest.style.display = 'block';
		} else if (x == '1') {
			dest.style.display = 'none';
		}
	}

	function showHacendario(object) {
		var opt = object;
		var x = document.getElementById('destHacendario').value;
		var car61 = document.getElementById("caracterizacionPredio");
		var car62 = document.getElementById("caracterizacionPredio62");
		var car67 = document.getElementById("caracterizacionPredio67");
		var car65 = document.getElementById("caracterizacionPredio65");

		if (x == '61') {
			car61.style.display = 'block';
			car62.style.display = 'none';
			car67.style.display = 'none';
			car65.style.display = 'none';
		} else if (x == '62') {
			car61.style.display = 'none';
			car62.style.display = 'block';
			car67.style.display = 'none';
			car65.style.display = 'none';
		}else if (x == '67') {
			car61.style.display = 'none';
			car62.style.display = 'none';
			car67.style.display = 'block';
			car65.style.display = 'none';
		}else if (x == '64') {
			car61.style.display = 'none';
			car62.style.display = 'none';
			car67.style.display = 'none';
			car65.style.display = 'none';
		}else if (x == '65') {
			car61.style.display = 'none';
			car62.style.display = 'none';
			car67.style.display = 'none';
			car65.style.display = 'block';
		}else if (x == '66') {
			car61.style.display = 'none';
			car62.style.display = 'none';
			car67.style.display = 'none';
			car65.style.display = 'none';
		}
	}
</script>

