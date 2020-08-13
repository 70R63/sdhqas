<%@ tag body-content="empty" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="formElement"
	tagdir="/WEB-INF/tags/addons/sdhpsaddon/responsive/formElement"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<spring:htmlEscape defaultHtmlEscape="true" />

<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<div class="item_container_holder ">
				<div class="forgotten-password item_container ">
					<c:url var="action" value="/register/newcustomer" />

					<form:form method="post" commandName="SDHRegisterForm"
						action="${action}">
						<fieldset>
							<div class="headline">
								<h2>
									<span tabindex="0"><spring:theme
											code="register.personalData.title" /></span>
								</h2>
							</div>
							<div class="description">
								<spring:theme code="register.emailUser" htmlEscape="false" />
							</div>
							<input name="titleCode" id="titleCode" value="mr" type="hidden" />

							<formElement:formInputBox idKey="register.email"
								labelKey="register.email" path="email" inputCSS="form-control"
								mandatory="true" />
							<formElement:formInputBox idKey="register.confirmEmail"
								labelKey="register.confirmEmail" path="confirmEmail"
								inputCSS="form-control" mandatory="true" />
							<formElement:formPasswordBox idKey="password"
								labelKey="register.pwd" path="pwd"
								inputCSS="form-control password-strength" mandatory="true" />
							<formElement:formPasswordBox idKey="register.checkPwd"
								labelKey="register.checkPwd" path="checkPwd"
								inputCSS="form-control" mandatory="true" />

							<div class="description">
								<spring:theme code="register.passwordRequirements"
									htmlEscape="false" />
							</div>
<div class="row"  id="mensaggeBuzon">
					<div class="col-md-12">
						<div class="form-group ">
							<label class="control-label" for="" > <spring:theme
									code="buzon.mirit.mensaje" /><button id="terminosPopUpRegister" class="terminosPopUpRegister" style="background: #fff; border: 0px">t�rminos y condiciones</button>
							</label>
						</div>
					</div>
				</div>
				<div style=" cursor: not-allowed; pointer-events: none;">
							<formElement:formCheckbox idKey="useEmailForNotifications"
								labelKey="register.activateInbox"
								path="useEmailForNotifications" inputCSS="form-control disabled" labelCSS="disabled"/>
								</div>
							<formElement:formCheckbox
								idKey="useInformationForInstitutionalPurposes"
								labelKey="register.personalDataAuthorization"
								path="useInformationForInstitutionalPurposes"
								inputCSS="form-control" />
								

							<div class="text-right">
								<ycommerce:testId code="login_forgotPasswordSubmit_button">
									<button class="btn btn-primary btn-lg" type="submit">
										<spring:theme code="register.send" />
									</button>
									<button class="btn btn-secondary btn-lg" type="button"
										onclick="window.location.href = '<c:url value="/" />'">
										<spring:theme code="register.cancel" />
									</button>
								</ycommerce:testId>
							</div>

						</fieldset>
					</form:form>



				</div>
			</div>
		</div>
	</div>
</div>

<div class="terminosycondiciones" style="display: none;">
	<div class="js-terminos-facet" id="js-terminos-facet">
		<div class="facet js-facet-veh">
			<div class="facet__name js-facet-name-veh">
				<spring:theme code="" />
		<spring:theme
						code="Aqu� van los t�rminos y condiciones" />
			</div>
		</div>
	</div>
	</div>

<!-- <script type="text/javascript"> -->
<!-- // document.getElementById('useEmailForNotifications').onclick = function(){ -->
<!-- // 	debugger; -->
<!-- // 	var chulo3 = document.getElementById("useEmailForNotifications").checked; -->
<!-- // 	if(chulo3 == true){ -->
<!-- // 		alert("Usted NO esta aceptando los t�rminos y condiciones. \n Aqu� van los t�rminos y condiciones."); -->
<!-- // 	}else{ -->
<!-- // 		alert("Usted esta aceptando los t�rminos y condiciones. \n Aqu� van los t�rminos y condiciones."); -->
<!-- // 	} -->
<!-- // } -->
<!-- </script> -->