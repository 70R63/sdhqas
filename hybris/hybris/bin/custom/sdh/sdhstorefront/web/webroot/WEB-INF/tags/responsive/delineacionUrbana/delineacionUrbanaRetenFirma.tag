<%@ tag body-content="empty" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>


<spring:url value="/impuestos/preparaPagoPSE" var="pagarURL" htmlEscape="false" />

<spring:htmlEscape defaultHtmlEscape="true" />


<c:set var="tipoDescripcionID" value='${dataForm.valCont.infoContrib.tipoDoc}'/>
<%-- ${dataForm.valCont.infoContrib.tipoDocDescripcion}' /> --%>
<c:set var="nombreCompleto" value='${dataForm.valCont.infoContrib.primNom} ${dataForm.valCont.infoContrib.primApe}' />

		<br>
		<div class="container">
			<div class="row">
			
<%-- 			<sf:hidden path="dataForm.infObjetoDelineacion.numForm" /> --%>
			<input type="hidden" id="numForm" value="${dataForm.infObjetoDelineacion.numForm}">
			
				<sf:form action="${pagarURL}" method="POST" modelAttribute="infoPreviaPSE" id="infoPreviaPSE">
				
				<div class=" col-md-3">
					<button type="button" class="btn btn-secondary btn-lg"
						id="regresarButton" name="" value="regresar" onclick="goBack2()">
						<spring:theme code="delineacion.urbana.dec.firm.regresar" />
					</button>
				</div>

				<div class=" col-md-3">
					<button type="button" class="btn btn-primary btn-lg" id="" name=""
						value="" onclick="window.location.href ='<c:url value='/contribuyentes' />';">
						<spring:theme code="delineacion.urbana.dec.firm.cancelar" />
					</button>
				</div>

				<div class="col-md-3">
				<a id="downloadHelper" target="_blank"></a>
<!-- 					<button type="submit" class="btn btn-primary btn-lg" id="" name="" -->
<!-- 						value="retencion"> -->
<%-- 						<spring:theme code="delineacion.urbana.dec.firm.prerete" /> --%>
<!-- 					</button> -->
		<button id="duGeneraDeclaracionButton" type="button" class="btn btn-primary btn-lg" onclick="pagarlinea()" >
			<!--<c:out value='${empty dataForm.infObjetoDelineacion.numForm ? "disabled":""}'/>
			class="btn btn-primary btn-lg" onclick="pagarlinea()" >   Se comenta linea para habilitar boton 19/12/2019 Maria Torres--> 
			<spring:theme code="delineacion.urbana.dec.firm.prerete" />
		</button>
					
				</div>

				<sf:hidden path="tipoImpuesto"/>
				<sf:hidden path="numBP" />
				<sf:hidden path="numDoc" />
				<sf:hidden path="tipoDoc" />
				<sf:hidden path="anoGravable" />
				<sf:hidden path="periodo" />
				<sf:hidden path="clavePeriodo" />
				<sf:hidden path="dv" />
				<sf:hidden path="numObjeto" />
				<sf:hidden path="CDU" />
				<sf:hidden path="anticipo" />
				<sf:hidden path="radicado" />
				
				<div class="col-md-3">
				<sf:button class="btn btn-primary btn-lg pagarbtn" type="submit" id="action" name="pagar" value="pagar"  disabled="true">
					<spring:theme code="impuestos.decGasolina.Pago.Pagar"/>
				</sf:button>
				</div>
				</sf:form>
			</div>
		</div>



<div class="row"></div>

<div id="dialogDU" title="Delineación Urbana">
	<div id="duDialogContent"></div>
</div>
