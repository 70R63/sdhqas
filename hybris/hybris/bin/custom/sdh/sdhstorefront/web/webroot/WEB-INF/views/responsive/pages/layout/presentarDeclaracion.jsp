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
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template" %>
<spring:htmlEscape defaultHtmlEscape="true" />

<div class="loader"></div>
<div class="cargandoSpinner" id="cargandoSpinner" style="display: none;"></div>

<template:sdhJavascriptVariables_linea_vehi/>
<template:sdhJavascriptVariables_linea_vehi2/>
<template:sdhJavascriptVariables_linea_vehi3/>
<template:sdhJavascriptVariables_linea_vehi4/>
<template:sdhJavascriptVariables_linea_vehi5/>
<template:sdhJavascriptVariables_linea_vehi6/>
<template:sdhJavascriptVariables_linea_vehi7/>
<template:sdhJavascriptVariables4/>
<impuestos:listaImpuestos />
<div id="dialogMensajes" title="Predial">
	<div id="dialogMensajesContent"></div>
</div>

<div id="dialogDeclaracion" title="Declaracion">
	<div id="declaracionDialogContent"></div>
</div>
