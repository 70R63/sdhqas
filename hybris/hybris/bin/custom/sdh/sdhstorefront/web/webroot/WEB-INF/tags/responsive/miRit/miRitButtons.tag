<%@ tag body-content="empty" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>

<spring:htmlEscape defaultHtmlEscape="true" />
<div class="container_new">
	<div class="row ">
		<div class="col-12 col-md-3 text-center">
			<button class="btn btn-primary btn-block btn-lg" type="button"
				onclick="window.location.href = '<c:url value="/contribuyentes/mirit/certificacion-datos" />'">
				<spring:theme code="mirit.buttons.certificate" />
			</button>
			<%-- 		<button class="btn btn-primary btn-lg" type="button" id="updateRitButton"><spring:theme code="mirit.buttons.update" /></button> --%>
		</div>
	</div>


	<div id="dialog" title="Actualización de RIT">
		<div id="ritDialogContent"></div>
	</div>
</div>


