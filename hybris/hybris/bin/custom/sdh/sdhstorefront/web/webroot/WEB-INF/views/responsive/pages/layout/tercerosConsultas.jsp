<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tercero"
	tagdir="/WEB-INF/tags/responsive/terceroconsulta"%>

<tercero:consultainicial/>
<div id="tabla" style="display: none;">
<tercero:consultaTable/>
</div>
<script type="text/javascript">
window.onload = function() {
	
    $(".loader").fadeOut("slow");
}

	function goBack() {
		window.history.back();
	}
	document.onreadystatechange = function() {
		if (document.readyState == "complete") {
			datatable();
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
									"sPrevious" : " Anterior ",
									"sNext" : " Siguiente ",
									"sLast" : " �ltima ",
									"sFirst" : " Primera "
								},
								"sLengthMenu" : 'Mostrar <select>'
										+ '<option value="5">5</option>'
										+ '<option value="10">10</option>'
										+ '<option value="15">15</option>'
										+ '<option value="20">20</option>'
										+ '<option value="30">30</option>'
										+ '</select> registros',
								"sInfo" : "Mostrando _START_ al _END_ de _TOTAL_ registros",
								"sInfoFiltered" : " Filtrados de MAX registros",
								"sInfoEmpty" : " ",
								"sZeroRecords" : "No se encontraron registros",
								"sProcessing" : "Espere, por favor...",
								"sSearch" : "Buscar:",
							}
						});
	}

	function show() {
		var tab = document.getElementById('tabla');
		tab.style.display = 'block';

	}
</script>

