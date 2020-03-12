<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>


<c:set var="flagPresentarDeclaracion" value="false" />
<c:set var="flagPagarEnLinea" value="false" />
<c:if test="${predialForm.controlCampos.btnPresentarDec == false}">
	<c:set var="flagPresentarDeclaracion" value="true" />
</c:if>
<c:if test="${predialForm.controlCampos.btnPagarDec == false}">
	<c:set var="flagPagarEnLinea" value="true" />
</c:if>
<c:if test="${contribuyente.documentType ne 'NIT' and contribuyente.numBP eq currentUser.numBP }">
	<c:set var="flagPresentarDeclaracion" value="true" />
	<c:set var="flagPagarEnLinea" value="true" />
	<input type="hidden" value="X" id="contribuyenteNoNIT"/>
</c:if>

<spring:htmlEscape defaultHtmlEscape="true" />

<div class="container">
<!-- Campos para calculo -->
 <input type="hidden" value="${predialFormocho.numBP}" id="NumBP"/>
 <input type="hidden" value="${predialFormocho.CHIP}" id="CHIP"/>
 <input type="hidden" value="${predialFormocho.matrInmobiliaria}" id="MatrInmobiliaria"/>
 <input type="hidden" value="${predialFormocho.anioGravable}" id="AnioGravable"/>
 <input type="hidden" value="${predialFormocho.opcionuso}" id="OpcionUso"/>
   <!--  "DatosLiquidacion":-->
 <input type="hidden" value="${predialFormocho.estrDatosGenerales.tipoDeclaracion}" id="TipoDeclaracion"/>
 <input type="hidden" value="${predialFormocho.datosJuridicos.porcentajePropiedad}" id="PorcentajePropiedad"/>
 <input type="hidden" value="" id="PorcentajeExclusion"/><!-- Estos datos se toman directamente del campo en la declaración -->
 <input type="hidden" value="" id="PorcentajeExencion"/><!-- Estos datos se toman directamente del campo en la declaración -->
 <input type="hidden" value="${predialFormocho.estrLiquidacionPredial.tarifaLiquidacion}" id="TarifaLiquidacion"/>
 <input type="hidden" value="${predialFormocho.estrLiquidacionPredial.destinoHacendario}" id="DestinoHacendario"/>
 <input type="hidden" value="${predialFormocho.estrLiquidacionPredial.baseGravable}" id="BaseGravable"/>
 <input type="hidden" value="${predialFormocho.estrDatosGenerales.canonArrendamiento}" id="CanonArrendamiento"/>
 <input type="hidden" value="" id="NumeroContratoArrendamiento"/><!-- este campo no se encuentra en el servicio -->
 <input type="hidden" value="${predialFormocho.datosJuridicos.calidadSujecion}" id="CalidadSujecion"/>
 <input type="hidden" value="${predialFormocho.estrDatosGenerales.avaluoMatrizMejora}" id="AvaluoMatrizMejora"/>
 <input type="hidden" value="${predialFormocho.estrDatosGenerales.areaTerrenoMejoraContrib}" id="AreaTerrenoMejoraContribuye"/>
 <input type="hidden" value="${predialFormocho.estrDatosGenerales.avaluoProrrateado}" id="AvaluoProrrateado"/>
 <input type="hidden" value="${predialFormocho.estrDatosGenerales.avaluoIndiceEdificabilidad}" id="AvaluoIndiceEdificabilidad"/>
 <input type="hidden" value="${predialFormocho.estrDatosGenerales.exclusionParcial}" id="ExclusionParcial"/>
   <!--  LiquidacionPrivada -->
 <input type="hidden" value="${predialFormocho.estrLiquidacionPrivada.aporteVoluntario}" id="AporteVoluntario"/>
 <input type="hidden" value="${predialFormocho.estrLiquidacionPrivada.proyecto}" id="Proyecto"/>
 <input type="hidden" value="" id="Autoavaluo"/><!-- este campo no se encuentra en el servicio -->
<!-- Fin de campos para calculo -->
	<div class="row" style="marging-top: 5px">
		<div class="col-md-12 centercol-md-8 text-center">
			<c:if test="${flagPresentarDeclaracion eq true}">
				<button style="margin-top: 3px;" id="predialGeneraDeclaracionButton" class="btn btn-primary btn-lg GeneraDeclaracionButton"
					type="button" disabled="disabled">
					<spring:theme code="predialocho.firma.presendecla" />
				</button>
			</c:if>

			<c:if test="${flagPagarEnLinea eq true}">
				<button class="btn btn-primary btn-lg pagarbtn" type="submit" id="pagar"
					name="pagar" value="pagar" disabled="disabled">
					<spring:theme code="predialocho.firma.paglinea" />
				</button>
			</c:if>
			
			<button class="btn btn-primary btn-lg" type="submit" id="action"
				name="pagar" value="pagar">
				<spring:theme code="predialocho.firma.spac" />
			</button>

		</div>
	</div>
</div>

