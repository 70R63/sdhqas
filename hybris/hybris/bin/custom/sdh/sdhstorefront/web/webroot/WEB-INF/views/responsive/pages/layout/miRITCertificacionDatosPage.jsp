<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<style>
#myDIV { }

input[type=radio] {
    border: 0px;
    width: 15pt;
    height: 15pt;
    vertical-align: -15pt;
}

.inner2 {
   
}
</style>

<div class="row">
 	<div class=" headline">
		<h2>
			<span tabindex="0"><spring:theme code="mirit.certificacion.titulo" /></span>
		</h2>
	</div>
</div>

 <form:form action="/sdhstorefront/es/contribuyentes/mirit/certificacion" method="post" commandName="miRitCertificacionForm" >
       
	<br>
	  <div class="row">  
	    <div class=" col-md-2">
	    	<div class="form-group ">
	    	    <label class="control-label" for="tipoCert"><spring:theme code="mirit.certificacion.textImp" /></label>
	    	    <form:select  id="tipoCert" path="tipoCert" onchange="Hide(this.value);" cssClass="form-control">
			        <form:option value="0"> <spring:theme code="mirit.certificacion.opSeleccionar"/> </form:option>
			  		<form:option value="1"> <spring:theme code="mirit.certificacion.opImpuesto"/> </form:option> 
			  		<form:option value="2"> <spring:theme code="mirit.certificacion.opSujeto"/> </form:option>
				</form:select>
			</div>
		</div>
		
		<div class="col-md-2" >
			<button class="btn btn-primary btn-block" type="submit" style="margin-top: 30px;margin-left: 40px">
				<spring:theme code="mirit.certificacion.btnGenerar" />
			</button>
		</div>
	  </div>	
	
  	<br>
  		
	<div id="myDIV"  style="display:none">
	
	    <div class="headline">				
			<h2>
				<span tabindex="0"><spring:theme code="mirit.certificacion.tituloImpuesto" /></span>
			</h2>			
		</div>
	
		<br>
	    
		<div class=" col-md-2">
		<c:if test="${miRitCertificacionForm.bPredial == 'X'}">
			<input type="radio" name="tipoImp" id="tipoImp" value="01" style="visibility: visible"><spring:theme code="mirit.certificacion.opPredial"/><br>
		</c:if>
		
		
		<c:if test="${miRitCertificacionForm.bVehicular == 'X'}">
			<input type="radio" name="tipoImp" id="tipoImp" value="02" style="visibility: visible"><spring:theme code="mirit.certificacion.opVehicular"/><br>
		</c:if>
		
		<c:if test="${miRitCertificacionForm.bIca == 'X'}">
			<input type="radio" name="tipoImp" id="tipoImp" value="03" style="visibility: visible"><spring:theme code="mirit.certificacion.opICA"/><br>	
    	</c:if>
    	
    	<c:if test="${miRitCertificacionForm.bPublicidadExt == 'X'}">
    		<input type="radio" name="tipoImp" id="tipoImp" value="07" style="visibility: visible"><spring:theme code="mirit.certificacion.opPublicidadExterior"/><br>
    	</c:if>
    	
    	<c:if test="${miRitCertificacionForm.bSobreGasolina == 'X'}">
    		<input type="radio" name="tipoImp" id="tipoImp" value="05" style="visibility: visible"><spring:theme code="mirit.certificacion.opSobretasaGasolina"/><br>
    	</c:if>
    	
    	<c:if test="${miRitCertificacionForm.bDelineacionUrbana == 'X'}">
    		<input type="radio" name="tipoImp" id="tipoImp" value="06" style="visibility: visible"><spring:theme code="mirit.certificacion.opDelineaci�nUrbana"/><br>
    	</c:if>
    	</div>
	 </div>    
    
  </form:form>

  <script>
    function Hide(val) {
	  var x = document.getElementById("myDIV");
	  if(val == "1"){
		  x.style.display = "block";	  
	  }
	  else{
		  x.style.display = "none";
	  }
	}
  </script>
  
