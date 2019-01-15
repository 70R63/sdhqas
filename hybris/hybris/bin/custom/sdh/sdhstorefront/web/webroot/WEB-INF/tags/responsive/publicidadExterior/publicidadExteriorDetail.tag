<%@ tag body-content="empty" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="publicidadExterior" tagdir="/WEB-INF/tags/responsive/publicidadExterior"%>


<spring:htmlEscape defaultHtmlEscape="true" />

	<div class="row">
		<div class="headline">
			<h3>
				<span tabindex="0"><spring:theme code="publicidad.exterior.detail.basicdata" /></span>
			</h3>
		</div>			
	</div>

	<div class="row">				
		<div class="col-md-2">
			<label><spring:theme code="publicidad.exterior.detail.dateresolution" /></label>
		</div>
		<div class="col-md-2">
			<div class="form-group ">
				<input id="address.surname" name="lastName" class="form-control form-control" aria-required="true" type="text" value="" maxlength="240">
			</div>
		</div>
		<div class="col-md-2">
			<label><spring:theme code="publicidad.exterior.detail.type" /></label>
		</div>
		<div class="col-md-2">
			<div class="form-group ">
				<input id="address.surname" name="lastName" class="form-control form-control" aria-required="true" type="text" value="" maxlength="240">
			</div>
		</div>
	</div>

	<div class="row">				
		<div class="col-md-2">
			<label><spring:theme code="publicidad.exterior.detail.Datenotification" /></label>
		</div>
		<div class="col-md-2">
			<div class="form-group ">
				<input id="address.surname" name="lastName" class="form-control form-control" aria-required="true" type="text" value="" maxlength="240">
			</div>
		</div>
	</div>
	<div class="row">
	<div class="col-md-2">
		<label><spring:theme code="publicidad.exterior.detail.validsince" /></label>
	</div>
	<div class="col-md-2">
		<div class="form-group ">
			<input id="address.surname" name="lastName" class="form-control form-control" aria-required="true" type="text" value="" maxlength="240">
		</div>
	</div>
	
</div>

<div class="row">				
	<div class="col-md-2">
		<label><spring:theme code="publicidad.exterior.detail.validityuntil" /></label>
	</div>
	<div class="col-md-2">
		<div class="form-group ">
			<input id="address.surname" name="lastName" class="form-control form-control" aria-required="true" type="text" value="" maxlength="240">
		</div>
	</div>


</div>
	<c:choose>
		<c:when test="${ action eq 'Avisos' }">
			<publicidadExterior:publicidadExteriorAvisos/>
		</c:when>
		<c:when test="${ action eq 'Vehiculos' }">
			<publicidadExterior:publicidadExteriorVehiculos/>
		</c:when>
		<c:when test="${ action eq 'Convencional' }">
			<publicidadExterior:publicidadExteriorConvencional/>
		</c:when>
		<c:when test="${ action eq 'Tubular' }">
			<publicidadExterior:publicidadExteriorTubular/>
	  	</c:when>
	  	<c:otherwise>
	  		<publicidadExterior:publicidadExteriorAvisos/>
	  		<publicidadExterior:publicidadExteriorVehiculos/>
	  		<publicidadExterior:publicidadExteriorConvencional/>
	  		<publicidadExterior:publicidadExteriorTubular/>
	  	</c:otherwise>
	  </c:choose>

	
<div class="row">				

</div>
