<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="mibuzon" tagdir="/WEB-INF/tags/responsive/buzon"%>




<mibuzon:buzonInicio />
<div id="idNotifi" style="display: none;">
	<mibuzon:buzonNotificaciones />
</div>
<div id="idMsn" style="display: none;">
	<mibuzon:buzonMensajes />
</div>


<script>
	function myFunction(idButton) {

		var idNotifi = document.getElementById('idNotifi');
		var idMsn = document.getElementById('idMsn');

		switch (idButton) {
		case 1:

			idNotifi.style.display = 'block';
			idMsn.style.display = 'none';

			break;

		case 2:
			idNotifi.style.display = 'none';
			idMsn.style.display = 'block';

			break;

		default:
			alert("")
		}

	}
</script>

