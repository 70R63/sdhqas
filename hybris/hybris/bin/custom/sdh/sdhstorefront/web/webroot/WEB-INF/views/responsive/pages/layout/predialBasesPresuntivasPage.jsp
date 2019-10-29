

<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="predial"
	tagdir="/WEB-INF/tags/responsive/predial/predialBasesPresuntivas"%>
<%@ taglib prefix="firmas" tagdir="/WEB-INF/tags/responsive/firmas"%>

<predial:predialBasesGenerales />
<predial:predialBasesDatPredio />

<div class="BasesDetalle" id="BasesDetalle" style="display: none">
<predial:predialBasesDatLiq />
	<predial:predialBasesLiqPrivada />
	<firmas:generalFirmas />
	<predial:predialBasesBotones />
</div>

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
	$(".loader").fadeOut("slow");
}
</script>