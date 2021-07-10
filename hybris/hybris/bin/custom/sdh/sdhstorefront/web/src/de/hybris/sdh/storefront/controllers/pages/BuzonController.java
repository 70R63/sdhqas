/**
*
*/
package de.hybris.sdh.storefront.controllers.pages;

import de.hybris.platform.acceleratorstorefrontcommons.annotations.RequireHardLogIn;
import de.hybris.platform.acceleratorstorefrontcommons.controllers.ThirdPartyConstants;
import de.hybris.platform.acceleratorstorefrontcommons.controllers.pages.AbstractPageController;
import de.hybris.platform.acceleratorstorefrontcommons.controllers.util.GlobalMessages;
import de.hybris.platform.cms2.exceptions.CMSItemNotFoundException;
import de.hybris.platform.commercefacades.customer.CustomerFacade;
import de.hybris.platform.core.GenericSearchConstants.LOG;
import de.hybris.platform.core.model.user.CustomerModel;
import de.hybris.platform.servicelayer.config.ConfigurationService;
import de.hybris.platform.servicelayer.media.MediaService;
import de.hybris.platform.servicelayer.model.ModelService;
import de.hybris.platform.servicelayer.user.UserService;
import de.hybris.sdh.core.customBreadcrumbs.ResourceBreadcrumbBuilder;
import de.hybris.sdh.core.pojos.requests.BuzonTributarioRequest;
import de.hybris.sdh.core.pojos.requests.ConsultaContribuyenteBPRequest;
import de.hybris.sdh.core.pojos.responses.BuzonMensajes2;
import de.hybris.sdh.core.pojos.responses.BuzonTributarioMsgResponse;
import de.hybris.sdh.core.pojos.responses.SDHValidaMailRolResponse;
import de.hybris.sdh.core.services.SDHBuzonTributarioService;
import de.hybris.sdh.core.services.SDHCertificaRITService;
import de.hybris.sdh.core.services.SDHConsultaContribuyenteBPService;
import de.hybris.sdh.storefront.forms.MiBuzon;

import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
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
public class BuzonController extends AbstractPageController
{
	private static final Logger LOG = Logger.getLogger(MiRitCertificacionPageController.class);

	private static final String BREADCRUMBS_ATTR = "breadcrumbs";
	private static final String TEXT_ACCOUNT_PROFILE = "text.account.profile.buzon";
	private static final String TEXT_ACCOUNT_PROFILE_RETE = "text.account.profile.buzonRETE";

	// CMS Pages
	private static final String MI_BUZON_CMS_PAGE = "buzonPage";

	private static final String REDIRECT_TO_MI_BUZON_PAGE = REDIRECT_PREFIX + "/contribuyentes/mibuzon_tributario";

	@Resource(name = "customBreadcrumbBuilder")
	private ResourceBreadcrumbBuilder accountBreadcrumbBuilder;

	@Resource(name = "sdhCertificaRITService")
	SDHCertificaRITService sdhCertificaRITService;

	@Resource(name = "sdhConsultaContribuyenteBPService")
	SDHConsultaContribuyenteBPService sdhConsultaContribuyenteBPService;

	@Resource(name = "sdhBuzonTributarioService")
	SDHBuzonTributarioService sdhBuzonTributarioService;

	@Resource(name = "customerFacade")
	CustomerFacade customerFacade;

	@Resource(name = "configurationService")
	private ConfigurationService configurationService;

	@Resource(name = "userService")
	UserService userService;

	@Resource(name = "modelService")
	ModelService modelService;

	@Resource(name = "mediaService")
	MediaService mediaService;


	@RequestMapping(value =
	{ "/contribuyentes/mibuzon_tributario", "/agenteRetenedor/mibuzon_tributario" }, method = RequestMethod.GET)
	@RequireHardLogIn
	public String buzoninicizl(final Model model, final HttpServletRequest request) throws CMSItemNotFoundException
	{
		System.out.println("---------------- Hola entro al GET mi buzon inicial --------------------------");

		final String referrer = request.getHeader("referer");

		final ConsultaContribuyenteBPRequest consultaContribuyenteBPRequest = new ConsultaContribuyenteBPRequest();
		final MiBuzon miBuzon = new MiBuzon();
		final BuzonTributarioRequest buzonrequest = new BuzonTributarioRequest();
		final CustomerModel customerModel = (CustomerModel) userService.getCurrentUser();

		//		final ConsultaContribuyenteBPRequest consultaContribuyenteBPRequest = new ConsultaContribuyenteBPRequest();


		consultaContribuyenteBPRequest.setNumBP(customerModel.getNumBP());

		final Calendar fecha = new GregorianCalendar();
		final int anio = fecha.get(Calendar.YEAR);
		//	int mes = fecha.get(Calendar.MONTH);
		//	int dia = fecha.get(Calendar.DAY_OF_MONTH);
		//	int hora = fecha.get(Calendar.HOUR_OF_DAY);
		//	int minuto = fecha.get(Calendar.MINUTE);
		//	int segundo = fecha.get(Calendar.SECOND);

		final String anioact = Integer.toString(anio);

		buzonrequest.setNumBP(customerModel.getNumBP());
		buzonrequest.setVigencia(anioact);
		buzonrequest.setCheckLectura("x");

		final ObjectMapper mapper = new ObjectMapper();
		mapper.configure(org.codehaus.jackson.map.DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);


		try
			{
				final SDHValidaMailRolResponse sdhConsultaContribuyenteBPResponse = mapper.readValue(
						sdhConsultaContribuyenteBPService.consultaContribuyenteBP(consultaContribuyenteBPRequest),
						SDHValidaMailRolResponse.class);

			final BuzonTributarioMsgResponse buzonTributarioMsgResponse = mapper
					.readValue(sdhBuzonTributarioService.buzonTributarioRequest(buzonrequest), BuzonTributarioMsgResponse.class);

			miBuzon.setMensajesMsg(buzonTributarioMsgResponse.getMensajes());
			int Buzon = sdhConsultaContribuyenteBPResponse.getInfoContrib().getAdicionales().getZZAUTOBUZONE();

			miBuzon.setBuzActivo(Buzon);

			int Mi = 1;
			int Ni = 1;

			for (final BuzonMensajes2 eachTipMensaje : buzonTributarioMsgResponse.getMensajes())
				{
				if ("2".equals(eachTipMensaje.getTipoMensaje()))
				{
					miBuzon.setContMsj(Mi);
					Mi++;
				}
				else if ("1".equals(eachTipMensaje.getTipoMensaje()))
					{
					miBuzon.setContNot(Ni);
					Ni++;
					}
				}

				model.addAttribute("miBuzon", miBuzon);

			}
			catch (final Exception s)
			{

			LOG.error("error getting customer info from SAP for rit page: " + s.getMessage());
				GlobalMessages.addErrorMessage(model, "mirit.error.getInfo");
				model.addAttribute("miBuzon", miBuzon);
			}

		storeCmsPageInModel(model, getContentPageForLabelOrId(MI_BUZON_CMS_PAGE));
		setUpMetaDataForContentPage(model, getContentPageForLabelOrId(MI_BUZON_CMS_PAGE));


		model.addAttribute(ThirdPartyConstants.SeoRobots.META_ROBOTS, ThirdPartyConstants.SeoRobots.NOINDEX_NOFOLLOW);

		if (referrer.contains("contribuyentes"))
		{
			model.addAttribute(BREADCRUMBS_ATTR, accountBreadcrumbBuilder.getBreadcrumbs(TEXT_ACCOUNT_PROFILE));
		}
		else if (referrer.contains("retenedor") || referrer.contains("agenteRetenedor"))
		{
			model.addAttribute(BREADCRUMBS_ATTR, accountBreadcrumbBuilder.getBreadcrumbs(TEXT_ACCOUNT_PROFILE_RETE));
		}
		else
		{
			model.addAttribute(BREADCRUMBS_ATTR, accountBreadcrumbBuilder.getBreadcrumbs(TEXT_ACCOUNT_PROFILE));
		}


		return getViewForPage(model);
	}

	@RequestMapping(value =
	{ "/contribuyentes/mibuzon_tributario", "/agenteRetenedor/mibuzon_tributario" }, method = RequestMethod.POST)
	@RequireHardLogIn
	public String buzonpost(final BindingResult bindingResult, final HttpServletRequest request, final Model model,
			final RedirectAttributes redirectAttributes)
			throws CMSItemNotFoundException
	{
		System.out.println("------------------Entro al POST de mi buzon inicial------------------------");

		final String referrer = request.getHeader("referer");

		return REDIRECT_TO_MI_BUZON_PAGE;
	}

}