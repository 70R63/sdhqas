<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>


<spring:htmlEscape defaultHtmlEscape="true" />
<spring:url
	value="/contribuyentes/sobretasa-gasolina/declaracion-gasolina"
	var="presentarDeclaracionUrl" htmlEscape="false" />



<div class="col-md-12">
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<td><c:out value="${dataFormRes}"></c:out> </td>
				</tr>
			</thead>
		</table>
	</div>
</div>


<div class="col-md-12">
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<td><spring:theme
							code="impuestos.sobreTasaGasolina.menu.titulo" /></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><spring:theme
							code="impuestos.sobreTasaGasolina.menu.tituloNota" /><a
						href="http://www.shd.gov.co/shd/">Mas información</a></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>



<div class="col-md-10">
	<div class="table-responsive">
		<sf:form action="/contribuyente" id="placeOrderForm1"
			commandName="dataForm">
			<table class="table" id="example">
				<thead>
					<tr>
						<td><spring:theme
								code="impuestos.sobreTasaGasolina.menu.tipoDocumento" /></td>
						<td><spring:theme
								code="impuestos.sobreTasaGasolina.menu.numeroDocumento" /></td>
						<td><spring:theme
								code="impuestos.sobreTasaGasolina.menu.seleccionar" /></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listaDocumentos}" var="item">
						<tr>
							<td><c:out value="${item.tipoDocumento}"></c:out></td>
							<td><c:out value="${item.numeroDocumento}"></c:out></td>
							<td><input id="action"
								style="visibility: visible !important; margin: 0; min-height: 0;"
								name="action" type="radio" value="Vehiculos"></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</sf:form>
	</div>
</div>

<div class="col-md-12">
	<div class="form-group ">
		<sf:form action="${presentarDeclaracionUrl}"
			id="presentarDeclaracionUrl1" commandName="presentarDeclaracion"
			method="GET">

			<button id="presentarDeclaracionUrl" type="submit"
				class="btn btn-primary btn-block">
				<spring:theme
					code="impuestos.sobreTasaGasolina.menu.presentarDeclaracion" />
			</button>
		</sf:form>
	</div>
</div>

<div class="col-md-12">
	<div class="form-group ">
		<button class="btn btn-primary btn-block" type="button">
			<spring:theme code="impuestos.sobreTasaGasolina.menu.rop" />
		</button>
	</div>
</div>
<div class="col-md-12">
	<div class="form-group ">
		<button class="btn btn-primary btn-block" type="button">
			<spring:theme code="impuestos.sobreTasaGasolina.menu.pagoEnLinea" />
		</button>
	</div>
</div>
