<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="impuestos"
	tagdir="/WEB-INF/tags/responsive/impuestos"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<spring:htmlEscape defaultHtmlEscape="true" />


<impuestos:listaImpuestos />



<script type="text/javascript">
	
		window.onload = function() {
			
		    $(".loader").fadeOut("slow");
		}
		
		//debugger;

		//var div = document.getElementById("impuestoGas");
		//var valGas = div.attributes[0].value;
		//var div = document.getElementById("impuestoPE");
		//var valPE = div.attributes[0].value;

		//if (valGas != "" && valPE != "") {
		//var x = document.getElementById("impuesto");

		//var option = document.createElement("option");
		//option.value = "0"
		//option.text = "Seleccionar";
		//x.appendChild(option);
		//var option = document.createElement("option");
		//option.value = "4"
		//option.text = "Publicidad Exterior";
		//x.appendChild(option);
		//var option = document.createElement("option");
		//option.value = "5"
		//option.text = "Sobretasa Gasolina";
		//x.appendChild(option);
		//} else if (valGas != "" && valPE == ""){
		//var x = document.getElementById("impuesto");
		//var option = document.createElement("option");
		//option.value = "0"
		//option.text = "Seleccionar";
		//x.appendChild(option);
		//var option = document.createElement("option");
		//option.value = "5"
		//option.text = "Sobretasa Gasolina";
		//x.appendChild(option);
		//}else if (valGas == "" && valPE != ""){
		//var x = document.getElementById("impuesto");
		//var option = document.createElement("option");
		//option.value = "0"
		//option.text = "Seleccionar";
		//x.appendChild(option);
		//var option = document.createElement("option");
		//option.value = "4"
		//option.text = "Publicidad Exterior";
		//x.appendChild(option);
		//}else{
		//alert("Usted no cuenta con ningun impuesto para declarar");
		///}

	};

	function onChange() {
		var tipoImpuesto = document.getElementById("impuesto").value;
		
// 		debugger;
		if(tipoImpuesto == '2'){ //vehicular
			ACC.opcionDeclaraciones.prepararVehicular_presentarDec(tipoImpuesto);
		}else{ //otros impuestos
			form = document.getElementById("forma");
	
			input = document.createElement('input');
			input.setAttribute('name', 'skipReques');
			input.setAttribute('value', 'X');
			input.setAttribute('type', 'hidden');
			form.appendChild(input);
	
			form.submit();
		}
	}

	function onChangeAnioGravable() {
// 		debugger;
		var impuestoVal = document.getElementById("impuesto").value;
		if(impuestoVal == '2'){ //vehicular
			ACC.opcionDeclaraciones.obtenerListaDeclaraciones_presentarDec(impuestoVal);
		}else{ //otros impuestos
			if (impuestoVal == "4" || impuestoVal == "6") {
				form = document.getElementById("forma");
				input = document.createElement('input');
				input.setAttribute('name', 'skipReques');
				input.setAttribute('value', '');
				input.setAttribute('type', 'hidden');
				form.appendChild(input);
				form.submit();
			}
	
			ajustaPeriodo();
		}
	}

	function ajustaPeriodo() {
		debugger;
		var dt = new Date();
		var year = dt.getFullYear();

		var sizePeriodo = document.getElementById("periodo").options.length;

		if (sizePeriodo == 12
				&& document.getElementById("anoGravable").value == year) {
			var mon = dt.getMonth();
			for (monPop = mon; monPop <= 11; monPop++) {
				document.getElementById("periodo").options[monPop].disabled = true;
			}
		} else if (sizePeriodo == 7
				&& document.getElementById("anoGravable").value == year) {
			var mon = parseInt((dt.getMonth()) / 2) + 2;
			mon = mon - 1;
			for (monPop = mon; monPop < 7; monPop++) {
				document.getElementById("periodo").options[monPop].disabled = true;
			}
		} else {
			for (monPop = 0; monPop < document.getElementById("periodo").length; monPop++) {
				document.getElementById("periodo").options[monPop].disabled = false;
			}
		}

	}
	
	function obtenerURLBase(){
		debugger;
		return '<c:url value="/" />';
	}
</script>