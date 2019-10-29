<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="cont"
	tagdir="/WEB-INF/tags/responsive/listaContribuyente"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div class="loader"></div>

<template:page pageTitle="${pageTitle}">
<cont:contribuyentesLista/>
	<script type="text/javascript">
	debugger;
window.onload = function() {
	
    $(".loader").fadeOut("slow");
}
</script>

</template:page>


