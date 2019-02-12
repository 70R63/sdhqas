

package de.hybris.sdh.storefront.controllers.impuestoGasolina;

import de.hybris.platform.acceleratorstorefrontcommons.annotations.RequireHardLogIn;
import de.hybris.platform.acceleratorstorefrontcommons.breadcrumb.ResourceBreadcrumbBuilder;
import de.hybris.platform.acceleratorstorefrontcommons.controllers.ThirdPartyConstants;
import de.hybris.platform.acceleratorstorefrontcommons.controllers.pages.AbstractSearchPageController;
import de.hybris.platform.cms2.exceptions.CMSItemNotFoundException;
import de.hybris.platform.core.model.user.CustomerModel;
import de.hybris.platform.servicelayer.user.UserService;
import de.hybris.sdh.core.pojos.requests.CalculaGasolinaRequest;
import de.hybris.sdh.core.pojos.requests.ConsultaContribuyenteBPRequest;
import de.hybris.sdh.core.pojos.requests.DetalleGasolinaRequest;
import de.hybris.sdh.core.pojos.responses.CalculaGasolinaResponse;
import de.hybris.sdh.core.pojos.responses.DetGasInfoDeclaraResponse;
import de.hybris.sdh.core.pojos.responses.DetGasResponse;
import de.hybris.sdh.core.pojos.responses.DetGasRevisorDeclaranteResponse;
import de.hybris.sdh.core.pojos.responses.SDHValidaMailRolResponse;
import de.hybris.sdh.core.services.SDHConsultaContribuyenteBPService;
import de.hybris.sdh.core.services.SDHDetalleGasolina;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


/**
 * @author fede
 *
 */

@Controller
@SessionAttributes("dataForm")

public class SobreTasaGasolina extends AbstractSearchPageController
{

	private static final Logger LOG = Logger.getLogger(SobreTasaGasolina.class);

	//Example Controller
	private static final String BREADCRUMBS_ATTR = "breadcrumbs";
	private static final String TEXT_ACCOUNT_PROFILE = "text.account.profile";

	// CMS Pages
	private static final String SOBRETASA_GASOLINA_CMS_PAGE = "sobretasa-gasolina";
	private static final String REDIRECT_TO_SOBRETASA_GASOLINA_PAGE = REDIRECT_PREFIX + "/contribuyentes/sobretasa-gasolina";
	private static final String DECLARACIONES_GASOLINA_CMS_PAGE = "declaracion-gasolina";
	private static final String REDIRECT_TO_DECLARACIONES_GASOLINA_PAGE = REDIRECT_PREFIX
			+ "/contribuyentes/sobretasa-gasolina/declaracion-gasolina";


	@Resource(name = "accountBreadcrumbBuilder")
	private ResourceBreadcrumbBuilder accountBreadcrumbBuilder;

	@Resource(name = "userService")
	UserService userService;

	@Resource(name = "sdhDetalleGasolina")
	SDHDetalleGasolina sdhDetalleGasolinaWS;

	@Resource(name = "sdhConsultaContribuyenteBPService")
	SDHConsultaContribuyenteBPService sdhConsultaContribuyenteBPService;



	//-----------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/contribuyentes/sobretasa-gasolina", method = RequestMethod.POST)
	@RequireHardLogIn
	public String handlePOST_ST(@ModelAttribute("dataForm")
	final SobreTasaGasolinaForm dataForm, @RequestParam(value = "action")
	final String action, final BindingResult bindingResult, final Model model, final RedirectAttributes redirectAttributes)
			throws CMSItemNotFoundException
	{
		System.out.println("---------------- En Menu sobretasa gasolina POST --------------------------");
		final CustomerModel customerModel = (CustomerModel) userService.getCurrentUser();
		String returnURL = REDIRECT_TO_DECLARACIONES_GASOLINA_PAGE;
		String numBP = "";
		String numDoc = "";
		String tipoDoc = "";
		String anioGravable = "";
		String periodo = "";
		final int indiceSeleccionado = 0;
		final SobreTasaGasolinaService gasolinaService = new SobreTasaGasolinaService();
		final DetalleGasolinaRequest detalleGasolinaRequest = new DetalleGasolinaRequest();
		final DetGasResponse detalleResponse;


		numBP = customerModel.getNumBP();
		numDoc = customerModel.getDocumentNumber();
		if (dataForm.getListaDocumentos() != null)
		{
			for (int i = 0; i < dataForm.getListaDocumentos().size(); i++)
			{
				if (!dataForm.getListaDocumentos().get(i).toString().isEmpty())
				{
					tipoDoc = dataForm.getListaDocumentos().get(indiceSeleccionado).getTipoDocumento();
					break;
				}
			}
		}
		anioGravable = dataForm.getAnoGravable();
		periodo = dataForm.getPeriodo();

		detalleGasolinaRequest.setNumBP(numBP);
		detalleGasolinaRequest.setNumDoc(numDoc);
		detalleGasolinaRequest.setTipoDoc(tipoDoc);
		detalleGasolinaRequest.setAnoGravable(anioGravable);
		detalleGasolinaRequest.setPeriodo(periodo);

		detalleResponse = gasolinaService.consultaDetGasolina(detalleGasolinaRequest, sdhDetalleGasolinaWS, LOG);
		System.out.println(detalleResponse);

		dataForm.setNumBP(numBP);
		dataForm.setNumDoc(numDoc);
		dataForm.setTipoDoc(tipoDoc);
		dataForm.setAnoGravable(anioGravable);
		dataForm.setPeriodo(periodo);
		dataForm.setDataForm(detalleResponse);

		model.addAttribute("dataForm", dataForm);

		if (action.equals("buscar"))
		{
			storeCmsPageInModel(model, getContentPageForLabelOrId(SOBRETASA_GASOLINA_CMS_PAGE));
			setUpMetaDataForContentPage(model, getContentPageForLabelOrId(SOBRETASA_GASOLINA_CMS_PAGE));
			model.addAttribute(BREADCRUMBS_ATTR, accountBreadcrumbBuilder.getBreadcrumbs(TEXT_ACCOUNT_PROFILE));
			model.addAttribute(ThirdPartyConstants.SeoRobots.META_ROBOTS, ThirdPartyConstants.SeoRobots.NOINDEX_NOFOLLOW);

			returnURL = getViewForPage(model);
		}
		else
		{
			if (action.equals("declarar"))
			{
				storeCmsPageInModel(model, getContentPageForLabelOrId(DECLARACIONES_GASOLINA_CMS_PAGE));
				setUpMetaDataForContentPage(model, getContentPageForLabelOrId(DECLARACIONES_GASOLINA_CMS_PAGE));
				model.addAttribute(BREADCRUMBS_ATTR, accountBreadcrumbBuilder.getBreadcrumbs(TEXT_ACCOUNT_PROFILE));
				model.addAttribute(ThirdPartyConstants.SeoRobots.META_ROBOTS, ThirdPartyConstants.SeoRobots.NOINDEX_NOFOLLOW);

				returnURL = REDIRECT_TO_DECLARACIONES_GASOLINA_PAGE;
			}
		}

		return returnURL;
	}






	//-----------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/contribuyentes/sobretasa-gasolina", method = RequestMethod.GET)
	@RequireHardLogIn
	public String handleGET_ST(final Model model) throws CMSItemNotFoundException
	{
		System.out.println("---------------- En Menu sobretasa gasolina GET --------------------------");
		final CustomerModel customerModel = (CustomerModel) userService.getCurrentUser();
		final ConsultaContribuyenteBPRequest consultaContribuyenteBPRequest = new ConsultaContribuyenteBPRequest();
		final SobreTasaGasolinaService gasolinaService = new SobreTasaGasolinaService();
		final ConsultaContribuyenteBPRequest contribuyenteRequest = new ConsultaContribuyenteBPRequest();
		final SobreTasaGasolinaForm dataForm = new SobreTasaGasolinaForm();
		String numBP = "";
		SDHValidaMailRolResponse detalleContribuyente;


		numBP = customerModel.getNumBP();
		contribuyenteRequest.setNumBP(numBP);

		detalleContribuyente = gasolinaService.consultaContribuyente(contribuyenteRequest, sdhConsultaContribuyenteBPService, LOG);
		dataForm.setListaDocumentos(gasolinaService.prepararTablaDeclaracion(detalleContribuyente.getGasolina()));
		dataForm.setNAME_ORG1(detalleContribuyente.getInfoContrib().getAdicionales().getNAME_ORG1());
		dataForm.setCatalogosSo(gasolinaService.prepararCatalogos());

		model.addAttribute("dataForm", dataForm);

		storeCmsPageInModel(model, getContentPageForLabelOrId(SOBRETASA_GASOLINA_CMS_PAGE));
		setUpMetaDataForContentPage(model, getContentPageForLabelOrId(SOBRETASA_GASOLINA_CMS_PAGE));
		model.addAttribute(BREADCRUMBS_ATTR, accountBreadcrumbBuilder.getBreadcrumbs(TEXT_ACCOUNT_PROFILE));
		model.addAttribute(ThirdPartyConstants.SeoRobots.META_ROBOTS, ThirdPartyConstants.SeoRobots.NOINDEX_NOFOLLOW);

		return getViewForPage(model);
	}




	//-----------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/contribuyentes/sobretasa-gasolina/declaracion-gasolina", method = RequestMethod.GET)
	@RequireHardLogIn
	public String handleGET_DEC(@ModelAttribute("dataForm")
	final SobreTasaGasolinaForm dataForm, final Model model) throws CMSItemNotFoundException
	{
		System.out.println("---------------- En Declaracion gasolina GET --------------------------");

		final CustomerModel customerModel = (CustomerModel) userService.getCurrentUser();
		String numBP = ""; //= customerModel.getNumBP();
		String numDoc = ""; //= customerModel.getDocumentNumber();
		String tipoDoc = ""; //= "NIT";
		String anoGravable = ""; //= "2019";
		String periodo = ""; //= "1";


		numBP = customerModel.getNumBP();
		if (dataForm != null)
		{
			anoGravable = dataForm.getAnoGravable();
			periodo = dataForm.getPeriodo();
			numDoc = dataForm.getNumDoc();
			tipoDoc = dataForm.getTipoDoc();
		}


		final SobreTasaGasolinaService gasolinaService = new SobreTasaGasolinaService();
		final DetalleGasolinaRequest detalleGasolinaRequest = new DetalleGasolinaRequest();
		final DetGasResponse wsResponse;
		final String tipoRevisor = "1";
		final String tipoDeclarante = "2";
		final List<DetGasInfoDeclaraResponse> infoDeclaraDefault = new ArrayList<DetGasInfoDeclaraResponse>();
		List<DetGasInfoDeclaraResponse> infoDeclaraDefaultTMP;


		detalleGasolinaRequest.setNumBP(numBP);
		detalleGasolinaRequest.setNumDoc(numDoc);
		detalleGasolinaRequest.setTipoDoc(tipoDoc);
		detalleGasolinaRequest.setAnoGravable(anoGravable);
		detalleGasolinaRequest.setPeriodo(periodo);

		wsResponse = gasolinaService.consultaDetGasolina(detalleGasolinaRequest, sdhDetalleGasolinaWS, LOG);
		dataForm.setAnoGravable(anoGravable);
		dataForm.setPeriodo(periodo);
		dataForm.setNumDoc(numDoc);

		infoDeclaraDefaultTMP = wsResponse.getInfoDeclara();
		if (infoDeclaraDefaultTMP != null)
		{
			for (int i = 0; i < infoDeclaraDefaultTMP.size(); i++)
			{
				infoDeclaraDefault.add(infoDeclaraDefaultTMP.get(i));
			}
		}
		for (int i = 0; i < 5; i++)
		{
			infoDeclaraDefault.add(new DetGasInfoDeclaraResponse());
		}


		dataForm.getDataForm().setInfoDeclara(infoDeclaraDefault);

		dataForm.setValoresDeclara(wsResponse.getValoresDeclara());
		if (wsResponse.getRevisorDeclarante() != null)
		{
			for (int i = 0; i < wsResponse.getRevisorDeclarante().size(); i++)
			{
				if (wsResponse.getRevisorDeclarante().get(i).getTipoInterloc().equals(tipoRevisor) == true)
				{
					dataForm.getRevisor().setTipoDoc(wsResponse.getRevisorDeclarante().get(i).getTipoDoc());
					dataForm.getRevisor().setNumDoc(wsResponse.getRevisorDeclarante().get(i).getNumDoc());
					dataForm.getRevisor().setNombres(wsResponse.getRevisorDeclarante().get(i).getNombres());
					dataForm.getRevisor().setTarjetaProf(wsResponse.getRevisorDeclarante().get(i).getTarjetaProf());
				}
				else
				{
					dataForm.getDeclarante().setTipoDoc(wsResponse.getRevisorDeclarante().get(i).getTipoDoc());
					dataForm.getDeclarante().setNumDoc(wsResponse.getRevisorDeclarante().get(i).getNumDoc());
					dataForm.getDeclarante().setNombres(wsResponse.getRevisorDeclarante().get(i).getNombres());
					dataForm.getDeclarante().setTarjetaProf(wsResponse.getRevisorDeclarante().get(i).getTarjetaProf());
				}
			}
		}
		dataForm.setCatalogosSo(gasolinaService.prepararCatalogos());
		System.out.println(dataForm);


		model.addAttribute("dataForm", dataForm);

		storeCmsPageInModel(model, getContentPageForLabelOrId(DECLARACIONES_GASOLINA_CMS_PAGE));
		setUpMetaDataForContentPage(model, getContentPageForLabelOrId(DECLARACIONES_GASOLINA_CMS_PAGE));
		model.addAttribute(BREADCRUMBS_ATTR, accountBreadcrumbBuilder.getBreadcrumbs(TEXT_ACCOUNT_PROFILE));
		model.addAttribute(ThirdPartyConstants.SeoRobots.META_ROBOTS, ThirdPartyConstants.SeoRobots.NOINDEX_NOFOLLOW);

		return getViewForPage(model);
	}






	//-----------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/contribuyentes/sobretasa-gasolina/declaracion-gasolina", method = RequestMethod.POST)
	@RequireHardLogIn
	public String handlePOST_DEC(@ModelAttribute("dataForm")
	final SobreTasaGasolinaForm dataForm, final BindingResult bindingResult, final Model model,
			final RedirectAttributes redirectAttributes) throws CMSItemNotFoundException
	{
		System.out.println("---------------- En Declaracion gasolina POST --------------------------");

		List<DetGasInfoDeclaraResponse> infoDeclaraDefault;
		List<DetGasRevisorDeclaranteResponse> revisorDeclaranteDefault;
		final CustomerModel customerModel = (CustomerModel) userService.getCurrentUser();
		final SobreTasaGasolinaService gasolinaService = new SobreTasaGasolinaService();
		final CalculaGasolinaRequest consultaGasolinaRequest = new CalculaGasolinaRequest();
		final CalculaGasolinaResponse wsResponse;

		String numBP = customerModel.getNumBP();
		String numDoc = customerModel.getDocumentNumber();
		String tipoDoc = "";
		String anoGravable = "";
		String periodo = "";
		String numForm = "";
		String opcionUso = "";
		String calidResp = "";
		infoDeclaraDefault = new ArrayList<DetGasInfoDeclaraResponse>();
		infoDeclaraDefault.add(new DetGasInfoDeclaraResponse());
		revisorDeclaranteDefault = new ArrayList<DetGasRevisorDeclaranteResponse>();
		revisorDeclaranteDefault.add(new DetGasRevisorDeclaranteResponse());
		final String tipoRevisor = "1";
		final String tipoDeclarante = "2";


		numBP = customerModel.getNumBP();
		if (dataForm != null)
		{
			numDoc = dataForm.getNumDoc();
			tipoDoc = dataForm.getTipoDoc();
			if (dataForm.getListaDocumentos() != null)
			{
				if (dataForm.getListaDocumentos().get(0) != null)
				{
					tipoDoc = dataForm.getListaDocumentos().get(0).getTipoDocumento();
					numDoc = dataForm.getListaDocumentos().get(0).getNumeroDocumento();
				}
			}
			anoGravable = dataForm.getAnoGravable();
			periodo = dataForm.getPeriodo();
		}
		if (dataForm.getDataForm().getInfoDeclara() != null)
		{
			infoDeclaraDefault = new ArrayList<DetGasInfoDeclaraResponse>();
			for (int i = 0; i < dataForm.getDataForm().getInfoDeclara().size(); i++)
			{
				if (dataForm.getDataForm().getInfoDeclara().get(i).getGalonesGra().equals("") != true
						&& dataForm.getDataForm().getInfoDeclara().get(i).getGalonesGra().equals("") != true)
				{
					infoDeclaraDefault.add(dataForm.getDataForm().getInfoDeclara().get(i));
				}
			}
		}

		if (dataForm.getDataForm().getRevisorDeclarante() != null)
		{
			revisorDeclaranteDefault = dataForm.getDataForm().getRevisorDeclarante();
		}
		numForm = dataForm.getNumForm();
		opcionUso = dataForm.getOpcionUso();
		calidResp = dataForm.getDataForm().getCalidResp();

		consultaGasolinaRequest.setNumBP(numBP);
		consultaGasolinaRequest.setNumDoc(numDoc);
		consultaGasolinaRequest.setTipoDoc(tipoDoc);
		consultaGasolinaRequest.setAnoGravable(anoGravable);
		consultaGasolinaRequest.setPeriodo(periodo);
		consultaGasolinaRequest.setNumForm(numForm);
		consultaGasolinaRequest.setOpcionUso(opcionUso);
		consultaGasolinaRequest.setInfoDeclara(infoDeclaraDefault);
		consultaGasolinaRequest.setRevisorDeclarante(revisorDeclaranteDefault);


		System.out.println(consultaGasolinaRequest);
		wsResponse = gasolinaService.consultaCalGasolina(consultaGasolinaRequest, sdhDetalleGasolinaWS, LOG);
		System.out.println(wsResponse);
		if (wsResponse.getInfoDeclara() == null && dataForm.getDataForm().getInfoDeclara() == null)
		{
			infoDeclaraDefault = new ArrayList<DetGasInfoDeclaraResponse>();
			infoDeclaraDefault.add(new DetGasInfoDeclaraResponse());

			dataForm.getDataForm().setInfoDeclara(infoDeclaraDefault);
		}
		else
		{
			dataForm.getDataForm().setInfoDeclara(wsResponse.getInfoDeclara());
		}

		dataForm.getDataForm().setValoresDeclara(wsResponse.getValoresDeclara());
		if (wsResponse.getRevisorDeclarante() != null)
		{
			for (int i = 0; i < wsResponse.getRevisorDeclarante().size(); i++)
			{
				if (wsResponse.getRevisorDeclarante().get(i).getTipoInterloc().equals(tipoRevisor) == true)
				{
					dataForm.getRevisor().setTipoDoc(wsResponse.getRevisorDeclarante().get(i).getTipoDoc());
					dataForm.getRevisor().setNumDoc(wsResponse.getRevisorDeclarante().get(i).getNumDoc());
					dataForm.getRevisor().setNombres(wsResponse.getRevisorDeclarante().get(i).getNombres());
					dataForm.getRevisor().setTarjetaProf(wsResponse.getRevisorDeclarante().get(i).getTarjetaProf());
				}
				else
				{
					dataForm.getDeclarante().setTipoDoc(wsResponse.getRevisorDeclarante().get(i).getTipoDoc());
					dataForm.getDeclarante().setNumDoc(wsResponse.getRevisorDeclarante().get(i).getNumDoc());
					dataForm.getDeclarante().setNombres(wsResponse.getRevisorDeclarante().get(i).getNombres());
					dataForm.getDeclarante().setTarjetaProf(wsResponse.getRevisorDeclarante().get(i).getTarjetaProf());
				}
			}
		}
		dataForm.setCatalogosSo(gasolinaService.prepararCatalogos());
		System.out.println(dataForm);
		model.addAttribute("dataForm", dataForm);


		return REDIRECT_TO_DECLARACIONES_GASOLINA_PAGE;
	}

}

