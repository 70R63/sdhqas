<%@ tag body-content="empty" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<spring:htmlEscape defaultHtmlEscape="true" />
<div class="container">

	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr class="avisoheadline p">
						<td style="text-align: center"><spring:theme
								code="retenedor.declarfirmar.inicial.titulo" /></td>
					</tr>
				</thead>
				<tbody>
					<tr class="avisobody">

						<td><spring:theme
								code="retenedor.declarfirmar.inicial.descripcion" /></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="headline">
				<h2>
					<span class="col-md-10 text-center "><spring:theme
							code="retenedor.declarfirmar.inicial.decfirmar" /></span>
				</h2>
			</div>
		</div>
	</div>


	<form:form action="">
		<div class="row" style="margin-top: 6px;">
			<div class="col-md-8 col-md-offset-2 tableamplia">
				<div class="table-responsive">
					<table class="table col-md-2 table-bordered">
						<thead>
							<tr>
								<td><label class="control-label labeltabletd"><spring:theme
											code="retenedor.declarfirmar.inicial.declaracion" /></label></td>
								<td><label class="control-label labeltabletd tableangrav"><spring:theme
											code="retenedor.declarfirmar.inicial.ani" /></label></td>
								<td><label class="control-label labeltabletd tableangrav"><spring:theme
											code="retenedor.declarfirmar.inicial.periodo" /></label></td>
								<td><label class="control-label labeltabletd"><spring:theme
											code="retenedor.declarfirmar.inicial.selccionar" /></label></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input class="inputtextnew" type="text" size="30"
									disabled /></td>
								<td><input class="inputtextnew tableangrav" type="text" size="30"
									disabled /></td>
								<td><input class="inputtextnew tableangrav" type="text" size="30"
									disabled /></td>
								<td><input type="checkbox" name="regimen" id=""
									class="form-check-input mr-2"
									style="visibility: visible !important; min-height: 4px !important; margin-left: 12px"></td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>
		</div>
		<div class="row">
			<div class="col-md-12 col-md-offset-5">
				<button class="btn btn-secondary"
					style="text-align: center !important" type="button"
					onclick="goBack()">
					<spring:theme code="retenedor.edocargas.inicial.regresar" />
				</button>
			</div>
		</div>
	</form:form>
</div>

<script>
	function goBack() {
		window.history.back();

	}
</script>