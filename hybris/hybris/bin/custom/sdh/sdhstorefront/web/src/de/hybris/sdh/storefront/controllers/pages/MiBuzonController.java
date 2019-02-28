/**
*
*/
package de.hybris.sdh.storefront.controllers.pages;

import de.hybris.platform.acceleratorstorefrontcommons.annotations.RequireHardLogIn;
import de.hybris.platform.acceleratorstorefrontcommons.breadcrumb.ResourceBreadcrumbBuilder;
import de.hybris.platform.acceleratorstorefrontcommons.controllers.ThirdPartyConstants;
import de.hybris.platform.acceleratorstorefrontcommons.controllers.pages.AbstractPageController;
import de.hybris.platform.cms2.exceptions.CMSItemNotFoundException;

import javax.annotation.Resource;

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
@RequestMapping("/contribuyentes/mibuzontributario/inicialmirit")
public class MiBuzonController extends AbstractPageController
{
	private static final String BREADCRUMBS_ATTR = "breadcrumbs";
	private static final String TEXT_ACCOUNT_PROFILE = "text.account.profile";

	// CMS Pages
	private static final String MI_BUZON_CMS_PAGE = "miBuzonPage";

	private static final String REDIRECT_TO_MI_BUZON_PAGE = REDIRECT_PREFIX + "/contribuyentes/mibuzontributario/inicial";

	@Resource(name = "accountBreadcrumbBuilder")
	private ResourceBreadcrumbBuilder accountBreadcrumbBuilder;

	@RequestMapping(value = "/contribuyentes/mibuzontributario/inicial", method = RequestMethod.GET)
	@RequireHardLogIn
	public String mibuzoninicial(final Model model) throws CMSItemNotFoundException
	{
		System.out.println("---------------- Hola entro al GET mi buzon inicial --------------------------");


		storeCmsPageInModel(model, getContentPageForLabelOrId(MI_BUZON_CMS_PAGE));
		setUpMetaDataForContentPage(model, getContentPageForLabelOrId(MI_BUZON_CMS_PAGE));
		model.addAttribute(BREADCRUMBS_ATTR, accountBreadcrumbBuilder.getBreadcrumbs(TEXT_ACCOUNT_PROFILE));
		model.addAttribute(ThirdPartyConstants.SeoRobots.META_ROBOTS, ThirdPartyConstants.SeoRobots.NOINDEX_NOFOLLOW);

		return getViewForPage(model);
	}

	@RequestMapping(value = "/contribuyentes/delineacionurbana/detalle", method = RequestMethod.POST)
	@RequireHardLogIn
	public String updateEmail(final BindingResult bindingResult, final Model model, final RedirectAttributes redirectAttributes)
			throws CMSItemNotFoundException
	{
		System.out.println("------------------Entro al POST de mi buzon inicial------------------------");

		return REDIRECT_TO_MI_BUZON_PAGE;
	}

}