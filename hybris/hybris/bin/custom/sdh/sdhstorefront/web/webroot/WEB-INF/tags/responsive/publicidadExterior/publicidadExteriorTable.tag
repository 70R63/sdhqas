<%@ tag body-content="empty" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>

<spring:htmlEscape defaultHtmlEscape="true" />

		<div class="row">
			<div class="headline">
				<h2>
					<span tabindex="0"><spring:theme code="publicidad.exterior.title" text="Publicidad Exterior"/></span>
				</h2>
			</div>			
			<p><spring:theme code="publicidad.exterior.description" /></p>	
			
		</div>

		<br/>
		<div class="row">				
			<div class="col-md-2 text-right">
				<label><spring:theme code="publicidad.exterior.showing" /></label>
			</div>
			<div class="col-md-2">
				<select id="u5013_input" class="form-control">
                        <option value="10">10</option>
                        <option value="20">20</option>
                        <option value="50">50</option>
                </select>
			</div>
			<div class="col-md-2 ">
				<label><spring:theme code="publicidad.exterior.dataPerPage" /></label>
			</div>
			<div class="col-md-2 text-right">
				<label><spring:theme code="publicidad.exterior.search" /></label>
			</div>
			<div class="col-md-2">
				<div class="form-group ">
					<input id="address.surname" name="lastName" class="form-control form-control" aria-required="true" type="text" value="" maxlength="240">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="table-responsive">
				  <table class="table">
				  	<thead>
				  		<tr>
				  			<th><spring:theme code="publicidad.exterior.resolutionnumber" /></th>
				  			<th><spring:theme code="publicidad.exterior.typefence" /></th>
				  			<th><spring:theme code="publicidad.exterior.select" /></th>
				  		</tr>
				  	</thead>
				  	<tbody>
				  		<tr>
				  			<td>41261533</td>
				  			<td>Avisos</td>
				  			
				  			<td>
								<input id="action" style="visibility: visible !important; margin:0;min-height:0;" name="action" type="checkbox" value="Avisos">	
							</td>
						</tr>
						<tr>
				  			<td>41261534</td>
				  			<td>Veh�culos</td>
				  			
				  			<td>
								<input id="action" style="visibility: visible !important; margin:0;min-height:0;" name="action" type="checkbox" value="Vehiculos">
							</td>
						</tr>
						<tr>
				  			<td>41261535</td>
				  			<td>Valla conv</td>
				  			
				  			<td>
								<input id="action" style="visibility: visible !important; margin:0;min-height:0;" name="action" type="checkbox" value="Convencional">
							</td>
						</tr>
						<tr>
				  			<td>41261536</td>
				  			<td>Valla tubular</td>
				  			
				  			<td>
								<input id="action" style="visibility: visible !important; margin:0;min-height:0;" name="action" type="checkbox" value="Tubular">
							</td>
						</tr>
				  	</tbody>
				  </table>
				</div>
			</div>
		</div>
		
		
		<div class="row">				

			<div class="col-md-2 ">
				<c:url value='/contribuyentes/publicidadexterior/declaracion' var="pubExtDeclaURL"/>
				<button class="btn btn-secondary btn-lg" type="button" onclick="'<c:url value="${pubExtDeclaURL }" />'">
					<spring:theme code="publicidad.exterior.declarationpresent" />
				</button>
			</div>
		</div>

		<div class="row">				

			<div class="col-md-2 ">
				<button class="btn btn-secondary btn-lg" type="button">
					<spring:theme code="publicidad.exterior.rop" />
				</button>
			</div>
		</div>
		<div class="row">				

			<div class="col-md-2 ">
				<button class="btn btn-secondary btn-lg" type="button">
					<spring:theme code="publicidad.exterior.payonline" />
				</button>
			</div>
		</div>
		<div class="row">
			<div class="headline">
				<h3>
					<span tabindex="0"><spring:theme code="publicidad.exterior.detail.outdooradvertising" /></span>
				</h3>
			</div>			
		</div>

		<div class="row">				
			<div class="col-md-3">
				<label><spring:theme code="publicidad.exterior.detail.selectYear" /></label>
			</div>
			<div class="col-md-2">
				<select id="u5013_input" class="form-control">
            		<option value="2019">2019</option>
            		<option value="2018">2018</option>
            		<option value="2017">2017</option>
            		<option value="2016">2016</option>
          		</select>
			</div>
			<div class="col-md-2 ">
				<c:url value='/contribuyentes2/publicidadexterior/detail' var="pubExtDetailURL"/>
				<button class="btn btn-secondary btn-lg" type="button"  onclick="'<c:url value="${pubExtDetailURL }" />'">
					<spring:theme code="publicidad.exterior.detail.search" />
				</button>
				<c:if test="${ empty action }">
					<c:set var = "action" scope = "session" value = "prueba"/>
				</c:if>	
			</div>
		</div>

