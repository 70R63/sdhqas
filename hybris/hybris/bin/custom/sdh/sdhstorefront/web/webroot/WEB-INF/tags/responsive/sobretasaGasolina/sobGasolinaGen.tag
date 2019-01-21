<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>


<spring:htmlEscape defaultHtmlEscape="true" />
<spring:url value="/contribuyentes/sobretasa-gasolina"
	var="buscarUrl" htmlEscape="false" />

<div class="row">
	<div class="col-md-6">
		<h3>
			<span tabindex="0"> <spring:theme
					code="impuestos.sobreTasaGasolina.DatosGenerales.titulo" />
			</span>
		</h3>
	</div>
</div>

<div class="row">
	<div class="col-md-2">
		<label><spring:theme
				code="impuestos.sobreTasaGasolina.DatosGenerales.anioGravableConsultar" /></label>
	</div>
	<div class="col-md-2">
		<div class="form-group ">
			<select id="anioGravable" class="form-control">
				<c:forEach items="${dataFormCatalogos.anioGravable}" var="elemento">
					<option value="${elemento.key}"><c:out
							value="${elemento.label}" /></option>
				</c:forEach>
			</select>
		</div>
	</div>
	<div class="col-md-2">
		<label><spring:theme
				code="impuestos.sobreTasaGasolina.DatosGenerales.Periodo" /></label>
	</div>
	<div class="col-md-2">
		<div class="form-group ">
			<select id="periodo" class="form-control">
				<c:forEach items="${dataFormCatalogos.periodo}" var="elemento">
					<option value="${elemento.key}"><c:out
							value="${elemento.label}" /></option>
				</c:forEach>
			</select>
		</div>
	</div>
	<div class="col-md-12">
		<div class="form-group ">
			<sf:form action="${buscarUrl}"
				id="buscarUrl1" commandName="buscarUrl"
				method="POST">

				<button id="buscarUrl" type="submit"
					class="btn btn-primary btn-block">
					<spring:theme
						code="impuestos.sobreTasaGasolina.DatosGenerales.buscar" />
				</button>
			</sf:form>
		</div>
	</div>
</div>


