/**
*
*/
package de.hybris.sdh.storefront.controllers.pages;

import de.hybris.platform.acceleratorstorefrontcommons.annotations.RequireHardLogIn;
import de.hybris.platform.acceleratorstorefrontcommons.breadcrumb.ResourceBreadcrumbBuilder;
import de.hybris.platform.acceleratorstorefrontcommons.controllers.ThirdPartyConstants;
import de.hybris.platform.acceleratorstorefrontcommons.controllers.pages.AbstractPageController;
import de.hybris.platform.cms2.exceptions.CMSItemNotFoundException;
import de.hybris.sdh.core.services.SDHCertificaRITService;
import de.hybris.sdh.core.services.SDHConsultaContribuyenteBPService;

import javax.annotation.Resource;

import de.hybris.sdh.facades.SDHConsultaFirmasFacade;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


/**
 * @author Maria Luisa
 *
 */
@Controller
//@RequestMapping("")
public class AgentesAutorizadosautorizadosListaDeclaracionesPageController extends AbstractPageController
{
	private static final Logger LOG = Logger.getLogger(MiRitCertificacionPageController.class);

	private static final String BREADCRUMBS_ATTR = "breadcrumbs";
	private static final String TEXT_ACCOUNT_PROFILE = "Lista declaraciones a firmar";

	@Resource(name="sdhConsultaFirmasFacade")
	SDHConsultaFirmasFacade sdhConsultaFirmasFacade;

	// CMS Pages
	private static final String AUTORIZADOS_LISDECLA_CMS_PAGE = "autorizadosListadeclaracionesPage";

	private static final String REDIRECT_TO_AUTORIZADOS_LISDECLA_PAGE = REDIRECT_PREFIX
			+ "/autorizados/contribuyente/listadeclaraciones";

	@Resource(name = "accountBreadcrumbBuilder")
	private ResourceBreadcrumbBuilder accountBreadcrumbBuilder;

	@Resource(name = "sdhCertificaRITService")
	SDHCertificaRITService sdhCertificaRITService;

	@Resource(name = "sdhConsultaContribuyenteBPService")
	SDHConsultaContribuyenteBPService sdhConsultaContribuyenteBPService;

	@RequestMapping(value = "/autorizados/contribuyente/listadeclaraciones", method = RequestMethod.GET)
	@RequireHardLogIn
	public String autorizadoslisdecla(final Model model) throws CMSItemNotFoundException
	{
		System.out.println("---------------- Hola entro al GET Agentes Lista declaraciones --------------------------");



		storeCmsPageInModel(model, getContentPageForLabelOrId(AUTORIZADOS_LISDECLA_CMS_PAGE));
		setUpMetaDataForContentPage(model, getContentPageForLabelOrId(AUTORIZADOS_LISDECLA_CMS_PAGE));

		model.addAttribute(BREADCRUMBS_ATTR, accountBreadcrumbBuilder.getBreadcrumbs(TEXT_ACCOUNT_PROFILE));
		model.addAttribute(ThirdPartyConstants.SeoRobots.META_ROBOTS, ThirdPartyConstants.SeoRobots.NOINDEX_NOFOLLOW);

		return getViewForPage(model);
	}

	@RequestMapping(value = "/autorizados/contribuyente/listadeclaraciones", method = RequestMethod.POST)
	@RequireHardLogIn
	public String autorizadoslisdeclapost(final BindingResult bindingResult, final Model model,
			final RedirectAttributes redirectAttributes)
			throws CMSItemNotFoundException
	{
		System.out.println("------------------Entro al POST de Agentes Lista declaracones-----------------------");

		return REDIRECT_TO_AUTORIZADOS_LISDECLA_PAGE;
	}

}
