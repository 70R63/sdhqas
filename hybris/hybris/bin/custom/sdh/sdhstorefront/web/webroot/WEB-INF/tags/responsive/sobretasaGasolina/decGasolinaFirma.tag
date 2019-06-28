<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<spring:htmlEscape defaultHtmlEscape="true" />
<sf:form action="${declaracionURL}" method="POST"
	modelAttribute="dataForm" id="forma">
	<div class="container_new">
		<div class="row mt-3">
			<div class="col-md-12 mt-3">
				<div class="headline">
					<h2>
						<span><spring:theme
								code="gasolina.declaracion.firma.titulo" /></span>
					</h2>
				</div>

				<%-- 			<form:form action=""> --%>
				<div class="row margin-bottom-4" style="margin-top: 18px">
					<div class="col-md-3" style="margin-top: 18px">
						<div class="form-check">
							<label class="form-check-label"
								style="text-transform: none; font-size: 14px; font-weight: 400;">
								<input type="checkbox" name="regimen" id="selectobligado"
								class="form-check-input mr-2"
								style="visibility: visible !important; min-height: 4px !important; margin-left: 12px;"
								onclick="habradio()"> <spring:theme
									code="gasolina.declaracion.firma.obligado" />
							</label>
						</div>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-md-2">
						<div class="form-group">
							<label class="control-label"><spring:theme code="" /></label> <input
								disabled id="" name="" class="form-control" disabled type="text"
								value="" maxlength="240" placeholder="Declarante"
								style="margin-top: 4px">
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label class="control-label"><spring:theme
									code="gasolina.declaracion.firma.nombre" /></label> <input disabled
								id="" name="" class="form-control" disabled type="text"
								value="${dataForm.declarante.nombres}" maxlength="240"></input>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label class="control-label"><spring:theme
									code="gasolina.declaracion.firma.tipoiden" /></label> <input disabled
								id="" name="" class="form-control" disabled type="text"
								value="${dataForm.declarante.tipoDoc}" maxlength="240"></input>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label class="control-label"><spring:theme
									code="delineacion.declaracion.firma.numide" /></label> <input disabled
								id="" name="" class="form-control" disabled type="text"
								value="${dataForm.declarante.numDoc}" maxlength="240"></input>
						</div>
					</div>

					<div class="col-md-2">
						<div class="form-group">
							<label class="control-label"><spring:theme
									code="delineacion.declaracion.firma.numtarjeta" /></label> <input
								disabled id="" name="" class="form-control" disabled type="text"
								value="" maxlength="240"></input>
						</div>
					</div>
					<div class="col-md-1">
						<label class="control-label"><spring:theme code="" /></label>
						<button class="btn btn-primary" id="btnfirmardeclarante"
							style="margin-top: 4px">Firmar</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container_new" id="repre">

		<div id="representante" class="row mt-3 representante"
			style="display: none">
			<div class="col-md-2">
				<div class="form-group">
					<label class="control-label"><spring:theme code="" /></label> <select
						class="form-control "
						style="font-size: 13px; padding: 0px; margin-top: 23px"
						onchange="habfirmante(this)" id="selectfirmante">
						<option>Seleccionar</option>
						<option>Revisor</option>
						<option>Contador</option>
						<option>Representante</option>
					</select>
				</div>
			</div>
			<div class="col-md-2">
				<div class="form-group">
					<label class="control-label " style="margin-top: 20px"><spring:theme
							code="ica.declaracion.firma.nombre" /></label> <select id="selcnombre"
						name="" class="form-control"><option>Seleccionar</option></select>
				</div>
			</div>
			<div class="col-md-2">
				<div class="form-group">
					<label class="control-label textocentrado" style="margin-top: 20px"><spring:theme
							code="gasolina.declaracion.firma.nombre" /></label> <input disabled
						id="" name="" class="form-control" disabled type="text" value=""
						maxlength="240"></input>
				</div>
			</div>
			<div class="col-md-2">
				<div class="form-group">
					<label class="control-label" style="margin-top: 20px"><spring:theme
							code="gasolina.declaracion.firma.numide" /></label> <input disabled
						id="" name="" class="form-control" disabled type="text" value=""
						maxlength="240"></input>
				</div>
			</div>

			<div class="col-md-2">
				<div class="form-group">
					<label class="control-label" style="margin-top: 20px"><spring:theme
							code="gasolina.declaracion.firma.numtarjeta" /></label> <input disabled
						id="" name="" class="form-control" disabled type="text" value=""
						maxlength="240"></input>
				</div>
			</div>

			<div class="col-md-1">
				<button class="btn btn-primary ajustemargen">Firmar</button>
			</div>
			<div class="col-md-1">
				<div class="form-group ">
					<img onclick="fnaddFirmanteRep()"
						src="${themeResourcePath}/images/adddelineacion.png"
						style="width: 25px; margin-top: 55px;"></img> <img
						onclick="delerepre()"
						src="${themeResourcePath}/images/deledelineacion.png"
						style="width: 25px; margin-top: 55px;"></img>
				</div>
			</div>
		</div>
	</div>

</sf:form>




<script>
	function habradio() {
		debugger;
		var hobli = document.getElementById('selectobligado');
		var firmdeclar = document.getElementById('btnfirmardeclarante');
		var btnpredec = document
				.getElementById('gasolinaGeneraDeclaracionButton');
		var repre = document.getElementById('representante');
		var rep2 = document.getElementById('newrepresentante');
		var selc = document.getElementById('selectfirmante');
		var selcnom = document.getElementById('selcnombre');

		if (hobli.checked == true) {
			firmdeclar.disabled = false;
			btnpredec.disabled = true;
			repre.style.display = 'block';

		} else if ((rep2 != null)) {

			firmdeclar.disabled = false;
			btnpredec.disabled = false;
			repre.style.display = 'none';
			rep2.style.display = 'none';
			selc.value = "Seleccionar";
			selcnom.value = "Seleccionar"

		} else {

			firmdeclar.disabled = false;
			btnpredec.disabled = false;
			repre.style.display = 'none';
			selc.value = "Seleccionar";
			selcnom.value = "Seleccionar"

		}
	}

	function fnaddFirmanteRep() {
		var rep2 = document.getElementById('newrepresentante');

		var tam = $(".representante").length;

		if ($(".representante").length < 2) {

			var clon = $(".representante:first").clone();
			$(clon).attr('id', 'newrepresentante'); //change cloned element id attribute
			$(clon).insertAfter(".representante:last");

		} else if ($(".representante").length == 2
				&& rep2.style.display == 'none') {

			rep2.style.display = 'block';

		} else {

			alert("No se pueden agregar m�s firmantes");

		}
	}

	function delerepre() {

		var i = $(".representante").length;
		var val = i - 1;
		if ($(".representante").length <= 2 && $(".representante").length > 1) {

			$($(".representante")[val]).closest(
					$($(".representante")[val]).remove());

		} else if ($(".representante").length <= 1) {
			alert("No puede eliminar todos los registros");
		}
	}
</script>