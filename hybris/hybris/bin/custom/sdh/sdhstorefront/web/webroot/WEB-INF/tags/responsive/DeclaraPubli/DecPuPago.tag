<%@ tag body-content="empty" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<spring:htmlEscape defaultHtmlEscape="true" />

<spring:url value="/contribuyentes/publicidadexterior/declaracion"
	var="CalculodeclaracionUrl" htmlEscape="false" />
<spring:url value="/contribuyentes/publicidadexterior/declaracion"
	var="CalculodeclaracionUrl2" htmlEscape="false" />
<spring:url value="/impuestos/preparaPagoPSE" var="pagarURL"
	htmlEscape="false" />

<div class="container">
	<input type="hidden" id="numForm" name="numForm"
		value="${declaPublicidadForm.numform }" />
		
	<div class="row">
		<sf:form action="${pagarURL}" method="POST"
			modelAttribute="infoPreviaPSE" id="infoPreviaPSE">

			<div class="col-md-4 text-right">
				<div class="form-group">
					<button id="regresar" class="btn btn-primary btn-lg"
						name="generaDeclaracionButton" type="button"
						onclick="window.location.href ='<c:url value='/contribuyentes/publicidadexterior/' />';">
						<spring:theme code="" text="Regresar" />
					</button>
				</div>
			</div>


			<div class="col-md-3 text-center">
				<a id="downloadHelper" target="_blank"></a>
				<sf:button id="generaDeclaracionButton" class="btn btn-primary btn-lg GeneraDeclaracionButton"
					name="generaDeclaracionButton" type="button"  disabled="false">		 <!-- Se cambia atributo disabled a false para habilitar bot�n 19/12/2019 Maria Torres -->			
					<spring:theme code="declaracion.publicidad.button.presdec" />
				</sf:button>
			</div>

			<div class="col-md-2">

				<sf:hidden path="tipoImpuesto" />
				<sf:hidden path="numBP" />
				<sf:hidden path="numDoc" />
				<sf:hidden path="tipoDoc" />
				<sf:hidden path="anoGravable" />
				<sf:hidden path="periodo" />
				<sf:hidden path="clavePeriodo" />
				<sf:hidden path="dv" />
				<sf:hidden path="numObjeto" />
				<c:choose>
					<c:when test="${empty declaPublicidadForm.habilitaPagarEnLinea}">
						<c:set var = "deshabilitarPagar" value = "true"/>
					</c:when>
					<c:otherwise>
						<c:set var = "deshabilitarPagar" value = "false"/>	
					</c:otherwise>
				</c:choose>
				<sf:button class="btn btn-primary btn-lg" type="button" onclick="validaBotonPago()" id="action"
					name="pagar" value="pagar" disabled="${deshabilitarPagar}">
					<spring:theme code="impuestos.decGasolina.Pago.Pagar" />
				</sf:button>
			</div>
		</sf:form>

	</div>
</div>


<script>

function validaBotonPago(){
	debugger;
	var totPagar = document.getElementById('totpag');
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

</script>
