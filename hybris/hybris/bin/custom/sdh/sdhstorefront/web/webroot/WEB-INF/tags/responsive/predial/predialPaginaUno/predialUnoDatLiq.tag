<%@ tag body-content="empty" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<spring:htmlEscape defaultHtmlEscape="true" />
<form:form>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="headline">
					<h2>
						<span class="col-md-10 "><spring:theme
								code="predialuno.datliquidacion.titulo" /></span>
					</h2>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-2">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="predialuno.datliquidacion.porcepropiedad" /></label> <input id=""
						name="" class="newalto form-control" disabled type="text" value="${predialForm.datosJuridicos.porcentajePropiedad}"
						maxlength="240" style="display: inline-block !important;"></input><label class="control-label" style="display: inline-block !important;"><spring:theme
							code="%" /></label>
				</div>
			</div>
			<div class="col-md-2">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="predialuno.datliquidacion.porcenexe" /></label> <input id="porcenexe"
						name="" class="newalto form-control" disabled type="text" value="${predialForm.decExencion}"
						maxlength="240" style="display: inline-block !important;"></input><label class="control-label" style="display: inline-block !important;"><spring:theme
							code="%" /></label>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-2">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="predialuno.datliquidacion.porceexclu" /></label> <input id="porceexclu"
						name="" class="newalto form-control" disabled type="text" value="${predialForm.decExclusion}"
						maxlength="240" style="display: inline-block !important;"></input><label class="control-label" style="display: inline-block !important;"><spring:theme
							code="%" /></label>
				</div>
			</div>
			<div class="col-md-2">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="predialuno.datliquidacion.tarliqui" /></label> <input id=""
						name="" class="newalto form-control" disabled type="text" value="${predialForm.estrLiquidacionPredial.tarifaLiquidacion}"
						maxlength="240"></input>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-4">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="predialuno.datliquidacion.destino" /></label> <input id="" name=""
						class="alto form-control" disabled type="text" value="${predialForm.estrLiquidacionPredial.destinoHacendario}"
						maxlength="240"></input>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-2">
				<div class="form-group">
					<label class="control-label"><spring:theme
							code="predialuno.datliquidacion.basegrav" /></label> <input id=""
						name="" class="newalto form-control" disabled type="text" value="${predialForm.estrLiquidacionPredial.baseGravable}"
						maxlength="240"></input>
				</div>
			</div>
		</div>
	</div>
</form:form>


