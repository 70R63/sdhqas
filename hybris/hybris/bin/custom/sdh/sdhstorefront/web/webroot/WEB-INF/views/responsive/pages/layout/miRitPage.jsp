<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="miRit" tagdir="/WEB-INF/tags/responsive/miRit"%>
<spring:htmlEscape defaultHtmlEscape="true" />
<template:sdhJavascriptVariables5/>

<div class="loader"></div>

<template:page pageTitle="${pageTitle}">

<div class="cargandoSpinner col-xs-6" id="cargandoSpinner" style="display: none;"></div>
	<div class="container_new_page">
		<p>
			<spring:theme code="mirit.description" />
		</p>
	</div>
	<c:choose>
		<c:when test="${ PJUR eq true}">
			<miRit:personalDataPJ />
		</c:when>
		<c:otherwise>
			<miRit:personalData />

			<miRit:generalData />
		</c:otherwise>
	</c:choose>


	<miRit:contactData />

	<miRit:changeEmail />

	<miRit:changePasword />

	<miRit:consentsData />

	<miRit:myTaxes />

	<miRit:myRepresentantsData />

	<miRit:myTributaryRols />

	<miRit:miRitButtons />



<template:sdhJavascriptVariables_linea_vehi/>
<template:sdhJavascriptVariables_linea_vehi2/>
<template:sdhJavascriptVariables_linea_vehi3/>
<template:sdhJavascriptVariables_linea_vehi4/>
<template:sdhJavascriptVariables_linea_vehi5/>
<template:sdhJavascriptVariables_linea_vehi6/>
<template:sdhJavascriptVariables_linea_vehi7/>
<template:sdhJavascriptVariables4/>
<script>

window.onload = function() {
		var cosas = $(":input");
	var tam = cosas.length;
	if (false){
		for (var i = 0; i < tam; i++) {
			var valor = cosas[i].value;
			if (valor == "") {
				cosas[i].value = "-";

			}
		}
	}
	
	var url = window.parent.location.href;
	var contenido_url = url.includes('contribuyentes');
}
	window.onload = function() {
		
		ACC.vehiculos.cargarDescripciones();
		
		var inputcol = document.getElementsByTagName("input");
		for (i = 0; i < inputcol.length; i++) {
			var texto = inputcol[i].value;
			inputcol[i].style.width = (texto.length + 1) * 10 + 'px';
		}
		
		var url = window.parent.location.href;
		var contenido_url = url.includes('contribuyentes');
		
	
		$(".loader").fadeOut("slow");
		
		var checkbuzon = document.getElementById("buzon").disabled = true;
	};

	function ajustar(selectObject) {
		var inputn = selectObject;
			var texto = inputn.value;
			inputn.style.width = (texto.length + 1) * 8 + 'px';
		}


</script>

</template:page>
<style>
.newtaminput{
padding: 2px !important; 
width: 50% !important; 
text-align: center !important;
}
</style>
