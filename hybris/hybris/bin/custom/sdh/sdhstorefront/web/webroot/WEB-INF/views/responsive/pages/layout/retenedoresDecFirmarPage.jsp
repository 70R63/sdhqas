<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="retenedores"
	tagdir="/WEB-INF/tags/responsive/retenedores"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<sf:form>
	<retenedores:retenedoresDecFirmar/>
</sf:form>




<script type="text/javascript">
	function goBack() {
		window.history.back();
	}
</script>