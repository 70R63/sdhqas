<%@ tag body-content="empty" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>

<spring:htmlEscape defaultHtmlEscape="true" />

<div class="row">
	<div class="col-md-6">
		<h3>
			<span tabindex="0"><spring:theme
					code="declaracion.publicidad.FirmaDeclarante" /></span>
		</h3>
	</div>
</div>

<div class="row">
	<div class="col-md-4">
		<label><spring:theme
				code="declaracion.publicidad.tipoiden" /></label>
	</div>

	<div class="col-md-4">
		<label><spring:theme code="declaracion.publicidad.numidenti" /></label>
	</div>

	<div class="col-md-4">
		<label><spring:theme
				code="declaracion.publicidad.nombreyrazon" /></label>
	</div>

	<div class="col-md-4">
		<select id="tipiden" class="form-control" disabled="disabled">
			<option value="CC">Cedula de Ciudadania</option>
		</select>
	</div>



	<div class="col-md-4">
		<input id="numide" name="numide" class="form-control form-control"
			aria-required="true" type="text" value="" maxlength="30" size="30"
			disabled="disabled">
	</div>
	<div class="col-md-4">
		<input id="name" name="name" class="form-control form-control"
			aria-required="true" type="text" value="" maxlength="30" size="30"
			disabled="disabled">
	</div>
</div>