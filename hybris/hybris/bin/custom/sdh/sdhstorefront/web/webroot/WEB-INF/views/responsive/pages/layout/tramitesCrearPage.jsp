<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="tramite" tagdir="/WEB-INF/tags/responsive/tramites"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<spring:url
	value="/contibuyentes/tramites/crear"
	var="enviarURL" htmlEscape="false" />

<div class="loader"></div>
<div class="cargandoSpinner" id="cargandoSpinner" style="display: none;"></div>


	<tramite:crearTramite/>



<div id="dialogMensajes" title="Tramites">
	<div id="dialogMensajesContent"></div>
</div>
<script>

window.onload = function() {
	
    $(".loader").fadeOut("slow");
}

</script>