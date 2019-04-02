<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<spring:htmlEscape defaultHtmlEscape="true" />
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="headline">
				<h2>
					<span class="col-md-10 "><spring:theme
							code="ica.inicial.marcas.title" /></span>
				</h2>
			</div>
		</div>
	</div>
</div>

<form:form action="">
	<div class="row">
		<div class="col-md-12">
			<div class="table-responsive">
				<table class="table table-bordered">
					<thead>
						<tr>
							<td><label class="control-label text-capitalize !important"><spring:theme
										code="ica.inicial.marcas.tipmarca" /></label></td>
							<td><label class="control-label text-capitalize !important"><spring:theme
										code="ica.inicial.marcas.caodmarca" /></label></td>
							<td><label class="control-label text-capitalize !important"><spring:theme
										code="ica.inicial.marcas.valexe" /></label></td>
							<td><label class="control-label text-capitalize !important"><spring:theme
										code="ica.inicial.marcas.ciiu" /></label></td>
							<td><label class="control-label text-capitalize !important"><spring:theme
										code="ica.inicial.marcas.denoacteco" /></label></td>
							<td><label class="control-label text-capitalize !important"><spring:theme
										code="ica.inicial.marcas.fecvaldesde" /></label></td>
							<td><label class="control-label text-capitalize !important"><spring:theme
										code="ica.inicial.marcas.fecvalhasta" /></label></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input class="inputtextnew" disabled="disabled"
								type="text" style="visibility: visibility !important" /></td>
							<td><input class="inputtextnew" disabled="disabled"
								type="text" /></td>
							<td><input class="inputtextnew" disabled="disabled"
								type="text" /></td>
							<td><input class="inputtextnew" disabled="disabled"
								type="text" /></td>
							<td><input class="inputtextnew" disabled="disabled"
								type="text" /></td>
							<td><input class="inputtextnew" disabled="disabled"
								type="text" /></td>
							<td><input class="inputtextnew" disabled="disabled"
								type="text" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</form:form>