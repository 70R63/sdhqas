<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="delineacionUrbana" tagdir="/WEB-INF/tags/responsive/delineacionUrbana"%>

<template:page pageTitle="${pageTitle}">
	<div class="container">
		<div class="row">
			<div class="headline">
				<h3>
					<span tabindex="0"><spring:theme code="delineacion.urbana.declaraciones" /></span>
				</h3>
			</div>			
		</div>

		<c:choose>
			<c:when test="${ action eq 'initialDeclaration' }">
				<delineacionUrbana:delineacionUrbanaInitailDeclaration/>
			</c:when>
			<c:when test="${ action eq 'retention' }">
				<delineacionUrbana:delineacionUrbanaRetention/>
			</c:when>
			<c:when test="${ action eq 'correctionDeclaration' }">
				<delineacionUrbana:delineacionUrbanaCorrection/>
			</c:when>
			<c:otherwise>
				<delineacionUrbana:delineacionUrbanaDeclaracionesForm/>
			</c:otherwise>
		</c:choose>
	</div>	
</template:page>

<script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>


