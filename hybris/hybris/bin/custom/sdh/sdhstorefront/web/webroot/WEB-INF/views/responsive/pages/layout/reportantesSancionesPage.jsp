<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="reportantes"
	tagdir="/WEB-INF/tags/responsive/reportantesInformacion"%>

<div class="loader"></div>
<div class="cargandoSpinner" id="cargandoSpinner" style="display: none;"></div>

<div class="container_new_page">
	<reportantes:reportantesSancionesInicial />

	<div id="idPredial" style="display: none;">
		<reportantes:reportantesSancionesPredial />
	</div>
	<div id="idOpain" style="display: none;">
		<reportantes:reportantesSancionesOpain />
	</div>
	<div id="idIca" style="display: none;">
		<reportantes:reportantesSancionesIca />
	</div>
	<div id="idVehicular" style="display: none;">
		<reportantes:reportantesSancionesVehiculos />
	</div>
	<div id="idVerDetalle" style="display: none;">
		<reportantes:reportantesSancionesVerDetalle />
	</div>
	<div id="idLiquidador" style="display: none;">
		<reportantes:reportantesSancionesLiquidacion />
	</div>
	<div id="idTotalPagar" style="display: none;">
		<reportantes:reportantesSancionesTotalPagar />
	</div>
</div>

<script type="text/javascript">
window.onload = function() {
	
    $(".loader").fadeOut("slow");
}

	function ShowSelected(selectObject) {
		var value = selectObject.value;
		document.getElementById("Idinrepor").value = value;
	}

	function myFunction() {

		var x = document.getElementById('Idinrepor').value;
		var idPredial = document.getElementById('idPredial');
		var idOpain = document.getElementById('idOpain');
		var idIca = document.getElementById('idIca');
		var idVehicular = document.getElementById('idVehicular');
		var idDetalle = document.getElementById('idVerDetalle');

		if (x == '1') {
			idPredial.style.display = 'block';
			idOpain.style.display = 'none';
			idIca.style.display = 'none';
			idVehicular.style.display = 'none';
			idVehicular.style.display = 'none';

		} else if (x == '2') {
			idPredial.style.display = 'none';
			idOpain.style.display = 'block';
			idIca.style.display = 'none';
			idDetalle.style.display = 'none';

		} else if (x == '3') {
			idPredial.style.display = 'none';
			idOpain.style.display = 'none';
			idIca.style.display = 'block';
			idVehicular.style.display = 'none';
			idDetalle.style.display = 'none';

		} else if (x == '4') {
			idPredial.style.display = 'none';
			idOpain.style.display = 'none';
			idIca.style.display = 'none';
			idVehicular.style.display = 'block';
			idDetalle.style.display = 'none';

		} else {
			idPredial.style.display = 'none';
			idOpain.style.display = 'none';
			idIca.style.display = 'none';
			idVehicular.style.display = 'none';
			idDetalle.style.display = 'none';
		}

	}

	function datatable(e) {
		if ($.fn.dataTable.isDataTable('#example')) {
			table = $('#example').DataTable();
			table.destroy();
		}
		var tabla = $("#example")
				.DataTable(
						{
							"sPaginationType" : "full_numbers",
							"oLanguage" : {
								"oPaginate" : {
									"sPrevious" : "Anterior",
									"sNext" : "Siguiente",
									"sLast" : "�ltima",
									"sFirst" : "Primera"
								},
								"sLengthMenu" : 'Mostrar <select>'
										+ '<option value="5">5</option>'
										+ '<option value="10">10</option>'
										+ '<option value="15">15</option>'
										+ '<option value="20">20</option>'
										+ '<option value="30">30</option>'
										+ '</select> registros',
								"sInfo" : "Mostrando del START a END (Total: TOTAL resultados)",
								"sInfoFiltered" : " Filtrados de MAX registros",
								"sInfoEmpty" : " ",
								"sZeroRecords" : "No se encontraron registros",
								"sProcessing" : "Espere, por favor...",
								"sSearch" : "Buscar:",
							}
						});
	}
	
	function showDetail() {
		
		var idDetalle = document.getElementById('idVerDetalle');
		idDetalle.style.display = 'block';

	}
	
	function goBack() {
		window.history.back();
	}
	
	function showTotal() {
		
		var idtotal = document.getElementById('idTotalPagar');
		idtotal.style.display = 'block';

	}

</script>

