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
							code="ica.declaracion.actifuera.titulo" /></span>
				</h2>
			</div>
		</div>
	</div>


	<form:form action="">
		<div class="row" style="margin-top: 18px">
			<div class="col-md-10">
				<div class="table-responsive">
					<table class="table table-bordered">
						<thead style="background-color: rgb(235, 235, 228) !important">
							<tr>
								<td style="width: 250px;"><label class="control-label text-capitalize !important"><spring:theme
											code="ica.declaracion.actifuera.ciiu" /></label></td>
								<td><label class="control-label text-capitalize !important"><spring:theme
											code="ica.declaracion.actifuera.municipio" /></label></td>
								<td><label class="control-label text-capitalize !important"><spring:theme
											code="ica.declaracion.actifuera.ingre" /></label></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="width: 300px;"><select id="" style="width: 300px;">
										<option value=" ">Seleccionar</option>
								</select></td>
								<td><select class="" style="width: 200px;" >
										<option>Seleccionar</option>
								</select></td>
								<td><input class="inputtextnew" type="text"  /></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</form:form>
</div>