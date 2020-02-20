<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<spring:htmlEscape defaultHtmlEscape="true" />
<spring:url value="/contribuyentes/predialunificado_1" var="declarar"
	htmlEscape="false" />
<sf:form action="${declarar}" method="POST"
	modelAttribute="predialFormIni" id="declarar">
	<div class="container">


		<div class="row">
			<div class="col-md-12">
				<div class="headline">
					<h2>
						<span class="col-md-10 "><spring:theme
								code="predial.inicial.marcas.titulo" /></span>
					</h2>
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-md-10 d-flex align-items-center">
				<div class="table-responsive text-center">
					<table class="table table-bordered MarcasPredial"
						id="MarcasPredial">
						<thead>
							<tr>
								<td><label class="control-label labeltabletd tableident"><spring:theme
											code="predial.inicial.marcas.marca" /></label></td>
								<td><label class="control-label labeltabletd tablenumiden"><spring:theme
											code="predial.inicial.marcas.tipmarca" /></label></td>
								<td><label class="control-label labeltabletd "><spring:theme
											code="predial.inicial.marcas.pormarca" /></label></td>
								<td><label class="control-label labeltabletd "><spring:theme
											code="predial.inicial.marcas.valex" /></label></td>
								<td><label class="control-label labeltabletd "><spring:theme
											code="predial.inicial.marcas.conservacion" /></label></td>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">

			<sf:input type="hidden" id="reCHIP" path="CHIP" /> 
			<sf:input type="hidden" id="rematrInmobiliaria" path="matrInmobiliaria"/> 
			<sf:input type="hidden" id="reanioGravable" path="anioGravable" />
			<sf:input type="hidden" id="renumBP" path="numBP" />
			<div class="col-md-12 centercol-md-8 text-center">
				<button style="margin-top: 3px;" id=""
					class="btn btn-secondary btn-lg" type="button">
					<spring:theme code="predial.inicial.marcas.btnregresar" />
				</button>

				<button class="btn btn-primary btn-lg" type="button" id="action"
					name="pagar" value="pagar">
					<spring:theme code="predial.inicial.marcas.btndescar" />
				</button>


				<button class="btn btn-primary btn-lg" type="submit" id="" name=""
					value="">
					<spring:theme code="predial.inicial.marcas.generar" />
				</button>

			</div>

		</div>

	</div>
</sf:form>



