<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	<!-- Agregar el valor del acto que venga del form para determinar si se muestran los campos de acto o no -->
<c:set var="idacto" value=""/>
<spring:htmlEscape defaultHtmlEscape="true" />
<div class="container_new_page">
<div class="alert alert-success" role="alert">
 <span><spring:theme code="message.download" /> </span>
</div>
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr class="avisoheadline p">
						<td style="text-align: center"><spring:theme
								code="predialcuatro.generales.titulo" /></td>
					</tr>
				</thead>
				<tbody>
					<tr class="avisobody">

						<td><spring:theme code="predialcuatro.generales.descripcion1" /><a
							href="http://www.shd.gov.co/shd/" target="_blank"> Mas
								información</a><br> <spring:theme
								code="predialuno.generales.descripcion2" /></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<form:form>
		<div class="row mt-3">
			<div class="col-md-6 col-md-offset-4 d-flex align-items-center">
				<div class="table-responsive text-center">
					<table class="table table-bordered">
						<thead>
							<tr>
								<td><label class="control-label labeltabletd"><spring:theme
											code="ica.inicial.table.tipdoc" /></label></td>
								<td><label class="control-label labeltabletd"><spring:theme
											code="ica.inicial.table.numdoc" /></label></td>
								<td><label class="control-label labeltabletd "><spring:theme
											code="ica.inicial.table.nombre" /></label></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><c:out value="${predialFormcua.tipDoc}" /></td>
								<td><c:out value="${predialFormcua.numDoc}" /></td>
								<td><c:out value="${predialFormcua.compleName}" /></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="headline">
					<h2>
						<span class="col-md-10 "><spring:theme
								code="predialcuatro.generales.titulodatos" /></span>
					</h2>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-2">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="predialcuatro.generales.anigrav" /></label> <input id="" name=""
						class="newalto form-control" disabled type="text" value="${predialFormcua.anioGravable}"
						maxlength="240"></input>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="predialcuatro.generales.opuso" /></label> <input id="" name=""
						class="alto form-control" disabled type="text" value="${predialFormcua.opcionuso}"
						maxlength="240"></input>
				</div>
			</div>
			<div class="col-md-2">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="predialcuatro.generales.matricula" /></label> <input id="" name=""
						class="newalto form-control" disabled type="text" value="${predialFormcua.matrInmobiliaria}"
						maxlength="240"></input>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="predialcuatro.generales.chip" /></label> <input id="" name=""
						class="newalto form-control" disabled type="text" value="${predialFormcua.CHIP}"
						maxlength="240"></input>
				</div>
			</div>
			<div class="col-md-2">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="predialcuatro.generales.cedula" /></label> <input id="" name=""
						class="newalto form-control" disabled type="text" value="${predialFormcua.estrDatosGenerales.cedulaCatastral}"
						maxlength="240"></input>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="predialcuatro.generales.direccion" /></label> <input id="" name=""
						class="alto form-control" disabled type="text" value="${predialFormcua.direccionPredio}"
						maxlength="240"></input>
				</div>
			</div>
		</div>
		<c:if test="${idacto != ''}">
		<div class="row">
		<div class="col-md-2">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="predial.declaracion.vehiculo.idacto" /></label> <input id=""
						name="" class="newalto form-control"
						value=""
						aria-required="false" type="text" maxlength="30"
						disabled="disabled">

				</div>
			</div>
					<div class="col-md-2">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="sobre.vehiculo.declaracion.vehiculo.fechanotiacto" /></label> <input id=""
						name="" class="newalto form-control"
						value=""
						aria-required="false" type="text" maxlength="30"
						disabled="disabled">

				</div>
			</div>
			<div class="col-md-2">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="predial.declaracion.vehiculo.descriacto" /></label> <input id=""
						name="" class="newalto form-control"
						value=""
						aria-required="false" type="text" maxlength="30"
						disabled="disabled">

				</div>
			</div>
			<div class="col-md-2">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="predial.declaracion.vehiculo.numeroexpediente" /></label> <input id=""
						name="" class="newalto form-control"
						value=""
						aria-required="false" type="text" maxlength="30"
						disabled="disabled">

				</div>
			</div>
		
		</div>
		</c:if>

	</form:form>
</div>



