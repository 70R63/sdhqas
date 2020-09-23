<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="pagoPSE" tagdir="/WEB-INF/tags/responsive/pagoPSE"%>


<div id="pagoARResponse" title="ReteICA" ><div id="pagoARResponseContent"></div></div>

<%-- --flagSuccessView:${flagSuccessView}-- --${empty flagSuccessView}-- --%>
<c:choose>
	<c:when test="${flagSuccessView eq 'E'}">
		<template:page pageTitle="${pageTitle}">
			<div class="container">
				<pagoPSE:formSection_error />
			</div>
		</template:page>
	</c:when>
	<c:when test="${empty flagSuccessView}">
		<template:page pageTitle="${pageTitle}">
			<div class="container">
				<pagoPSE:formSection />
			</div>
		</template:page>
	</c:when>
	<c:otherwise>
		<template:page pageTitle="${pageTitle}">
			<div class="container">
				<pagoPSE:formSection_success />
			</div>
		</template:page>
	</c:otherwise>
</c:choose>

<script>

	function goBack() {
		//window.history.back();
		window.location.replace("/bogota/es/");
	}
</script>

