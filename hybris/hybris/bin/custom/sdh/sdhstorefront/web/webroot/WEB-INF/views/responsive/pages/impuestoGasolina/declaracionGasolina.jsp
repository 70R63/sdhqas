<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="sobreTasaGasolina"
	tagdir="/WEB-INF/tags/responsive/sobretasaGasolina"%>
<%@ taglib prefix="firmas" tagdir="/WEB-INF/tags/responsive/firmas"%>
<spring:htmlEscape defaultHtmlEscape="true" />
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<spring:url
	value="/contribuyentes/sobretasa-gasolina/declaracion-gasolina"
	var="declaracionURL" htmlEscape="false" />

<div class="loader"></div>
<div class="cargandoSpinner" id="cargandoSpinner" style="display: none;"></div>	



<sf:form action="${declaracionURL}" method="POST"
	modelAttribute="dataForm" id="forma">
	<sobreTasaGasolina:decGasolinaGen />
	<sobreTasaGasolina:decGasolinaInfDec />
	<sobreTasaGasolina:decGasolinaTotales />
	<sobreTasaGasolina:decGasolinaPagos />
	<%-- 	<sobreTasaGasolina:decGasolinaDatRev /> --%>
	<%-- 	<sobreTasaGasolina:decGasolinaInfFirma /> --%>
	<c:url value='${redirectURL}' var="taxRedirection"/>
	<firmas:generalFirmas firmaContribuyenteRedirection="${taxRedirection}"/>
<%--	<sobreTasaGasolina:decGasolinaFirma />--%>
</sf:form>
<sobreTasaGasolina:decGasolinaPago />

<script>
window.onload = function() {

	debugger;

	var cosas = $(":input");
	var tam = cosas.length;
	if (false){ //FFD-codigo comentado por observaciones en pruebas realizadas el 04 de octubre 2019
		for (var i = 0; i < tam; i++) {
			var valor = cosas[i].value;
			if (valor == "") {
				cosas[i].value = "-";
			}
		}
	}
	 $(".loader").fadeOut("slow");
	 document.getElementById("gasolinaGeneraDeclaracionButton").disabled = false; //Se agrega linea para habilitar boton de declaracion 19/12/2019 Maria Torres
}


</script>


<script>
	function numberFormat(selectObject) {
debugger;
		var numero = selectObject.value;
		var idinput = selectObject.id;
		var nameinput = selectObject.name;
		var resultado = "";
		if (numero[0] == "-") {
			nuevoNumero = numero.replace(/\./g, '').substring(1);
		} else {
			nuevoNumero = numero.toString().replace(/\./g, '');
		}
		if (numero.toString().indexOf(",") >= 0)
			nuevoNumero = nuevoNumero.substring(0, nuevoNumero.indexOf(","));

		for (var j, i = nuevoNumero.length - 1, j = 0; i >= 0; i--, j++)
			resultado = nuevoNumero.charAt(i)
					+ ((j > 0) && (j % 3 == 0) ? "." : "") + resultado;
		if (numero.toString().indexOf(",") >= 0)
			resultado += numero.substring(numero.indexOf(","));

		if (numero[0] == "-") {
			document.getElementById(idinput).value = "-" + resultado;
			return "-" + resultado;
		} else {
			document.getElementById(idinput).value = resultado;
			return resultado;
		}
	}
	
	function numberFormattable(selectObject) {
		debugger;
				var numero = selectObject.value;
				var idinput = selectObject.id;
				var nameinput = selectObject.name;
				selectObject.id = nameinput;
				var idinput = selectObject.id;
				var resultado = "";
				if (numero[0] == "-") {
					nuevoNumero = numero.replace(/\./g, '').substring(1);
				} else {
					nuevoNumero = numero.toString().replace(/\./g, '');
				}
				if (numero.toString().indexOf(",") >= 0)
					nuevoNumero = nuevoNumero.substring(0, nuevoNumero.indexOf(","));

				for (var j, i = nuevoNumero.length - 1, j = 0; i >= 0; i--, j++)
					resultado = nuevoNumero.charAt(i)
							+ ((j > 0) && (j % 3 == 0) ? "." : "") + resultado;
				if (numero.toString().indexOf(",") >= 0)
					resultado += numero.substring(numero.indexOf(","));

				if (numero[0] == "-") {
					document.getElementById(idinput).value = "-" + resultado;
					return "-" + resultado;
				} else {
					document.getElementById(idinput).value = resultado;
					return resultado;
				}
			}
</script>




