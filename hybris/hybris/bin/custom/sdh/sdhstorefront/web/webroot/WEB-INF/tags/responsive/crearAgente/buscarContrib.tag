<%@ tag body-content="empty" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<spring:htmlEscape defaultHtmlEscape="true" />
<div class="container_new_page">
	<div class="row mt-3">
		<div class="col-md-12 mt-3">
			<div class="headline">
				<h2>
					<span><spring:theme code="autorizado.crear.inicial.titulo" /></span>
				</h2>
			</div>
		</div>
	</div>
	<div class="row mt-3">
		<div class="col-md-12"
			style="background: #d2d2d2; margin-top: 20px !important;">
			<div class="form-group">
				<label class="control-label"><spring:theme
						code="autorizado.crear.inicial.nota" /></label>
			</div>
		</div>
	</div>
</div>
<div id="acordeon" class="container">
	<div class="card cardmirit ">
		<div class="card-header" id="head0">
			<h5 class="mb-0 cardtitle">
				<button class="btn btn-link miritmenu" data-toggle="collapse"
					data-target="#collapse0" aria-expanded="true"
					aria-controls="collapse0">
					<h4>
						<span tabindex="0"><spring:theme
								code="autorizado.crear.buscar.titulo" text="" /></span>
					</h4>
				</button>
			</h5>
		</div>
		<div id="collapse0" class="collapse" aria-ladelledby="head0"
			data-parent="#acordeon">
			<div class="card-body">
				<div class="row">
					<div class="col-md-2">
						<div class="form-group ">
							<label class="control-label"> <spring:theme
									code="autorizado.crear.buscar.tipdoc" text="" /></label> <select id=""
								class="newalto form-control">
								<option value="">Seleccionar</option>
								<option value="">Cedula de Ciudadania</option>
								<option value="">Cedula de Extranjer�a</option>
								<option value="">N.I.T</option>
								<option value="">Pasaporte</option>
							</select>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group ">
							<label class="control-label required" for="numDoc"> <spring:theme
									code="autorizado.crear.buscar.numdoc" />
							</label> <input id="" name="" class="newalto form-control"
								aria-required="true" type="text" value="" maxlength="240">
						</div>
					</div>

					<div class="col-md-2">
						<div class="form-group ">
							<label class="control-label required"> <spring:theme
									code="autorizado.crear.buscar.fecexpe" />
							</label> <input id="" name="" class="newalto form-control"
								aria-required="true" type="text" value="" maxlength="240"
								placeholder="dd/mm/aaaa">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2">
						<button class="btn btn-secondary" type="button" id="">
							<spring:theme code="autorizado.crear.buscar.cancelar" />
						</button>
					</div>
					<div class="col-md-2">
						<button class="btn btn-primary" type="button" id="" onclick="detalleBP()">
							<spring:theme code="autorizado.crear.buscar.buscar" />
						</button>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>