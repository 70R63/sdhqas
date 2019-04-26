/**
*
*/
package de.hybris.sdh.storefront.controllers.pages;

import de.hybris.platform.acceleratorstorefrontcommons.annotations.RequireHardLogIn;
import de.hybris.platform.acceleratorstorefrontcommons.breadcrumb.ResourceBreadcrumbBuilder;
import de.hybris.platform.acceleratorstorefrontcommons.controllers.ThirdPartyConstants;
import de.hybris.platform.acceleratorstorefrontcommons.controllers.pages.AbstractPageController;
import de.hybris.platform.catalog.model.CatalogUnawareMediaModel;
import de.hybris.platform.cms2.exceptions.CMSItemNotFoundException;
import de.hybris.platform.core.model.user.CustomerModel;
import de.hybris.platform.servicelayer.media.MediaService;
import de.hybris.platform.servicelayer.model.ModelService;
import de.hybris.platform.servicelayer.user.UserService;
import de.hybris.sdh.core.pojos.requests.GeneraDeclaracionRequest;
import de.hybris.sdh.core.pojos.requests.ICACalculoImpRequest;
import de.hybris.sdh.core.pojos.requests.ICAInfObjetoRequest;
import de.hybris.sdh.core.pojos.responses.ErrorEnWS;
import de.hybris.sdh.core.pojos.responses.ErrorPubli;
import de.hybris.sdh.core.pojos.responses.GeneraDeclaracionResponse;
import de.hybris.sdh.core.pojos.responses.ICACalculoImpResponse;
import de.hybris.sdh.core.pojos.responses.ICAInfObjetoResponse;
import de.hybris.sdh.core.services.SDHCertificaRITService;
import de.hybris.sdh.core.services.SDHConsultaContribuyenteBPService;
import de.hybris.sdh.core.services.SDHGeneraDeclaracionService;
import de.hybris.sdh.core.services.SDHICACalculoImpService;
import de.hybris.sdh.core.services.SDHICAInfObjetoService;
import de.hybris.sdh.storefront.forms.GeneraDeclaracionForm;
import de.hybris.sdh.storefront.forms.ICACalculaDeclaracionForm;
import de.hybris.sdh.storefront.forms.ICAInfObjetoForm;

import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sun.misc.BASE64Decoder;


/**
 * @author Maria Luisa
 *
 */
@Controller

public class IcaPageController extends AbstractPageController
{
	private static final Logger LOG = Logger.getLogger(MiRitCertificacionPageController.class);


	private static final String VACIO = "";

	private static final String BREADCRUMBS_ATTR = "breadcrumbs";
	private static final String TEXT_ACCOUNT_PROFILE = "text.account.profile.ica";
	private static final String DECLARACION_ACCOUNT_PROFILE = "Declaracion ICA";

	// CMS Pages
	private static final String ICA_CMS_PAGE = "icaPage";
	private static final String ICA_DOS_CMS_PAGE = "icaDosPage";
	private static final String ICA_DECLARACION_CMS_PAGE = "icaDeclaracionPage";

	private static final String REDIRECT_TO_ICA_PAGE = REDIRECT_PREFIX + "/contribuyentes/ica";
	private static final String REDIRECT_TO_ICA_DOS_PAGE = REDIRECT_PREFIX + "/contribuyentes/icados";
	private static final String REDIRECT_TO_ICA_DECLARACION_PAGE = REDIRECT_PREFIX + "/contribuyentes/ica/declaracion";


	@Resource(name = "userService")
	UserService userService;

	@Resource(name = "modelService")
	ModelService modelService;

	@Resource(name = "mediaService")
	MediaService mediaService;

	@Resource(name = "accountBreadcrumbBuilder")
	private ResourceBreadcrumbBuilder accountBreadcrumbBuilder;

	@Resource(name = "sdhCertificaRITService")
	SDHCertificaRITService sdhCertificaRITService;

	@Resource(name = "sdhConsultaContribuyenteBPService")
	SDHConsultaContribuyenteBPService sdhConsultaContribuyenteBPService;

	@Resource(name = "sdhICAInfObjetoService")
	SDHICAInfObjetoService sdhICAInfObjetoService;

	@Resource(name = "sdhICACalculoImpService")
	SDHICACalculoImpService sdhICACalculoImpService;

	@Resource(name = "sdhGeneraDeclaracionService")
	SDHGeneraDeclaracionService sdhGeneraDeclaracionService;

	@RequestMapping(value = "/contribuyentes/ica", method = RequestMethod.GET)
	@RequireHardLogIn
	public String icainicial(final Model model, final RedirectAttributes redirectModel) throws CMSItemNotFoundException
	{
		System.out.println("---------------- Hola entro al GET ICA --------------------------");

		final CustomerModel customerModel = (CustomerModel) userService.getCurrentUser();
		final ICAInfObjetoRequest icaInfObjetoRequest = new ICAInfObjetoRequest();

		if (customerModel.getNumBP() != null)
		{
			icaInfObjetoRequest.setNumBP(customerModel.getNumBP());
		}
		else
		{
			icaInfObjetoRequest.setNumBP(VACIO);
		}

		if (customerModel.getIcaTaxList().getObjectNumber() != null)
		{
			icaInfObjetoRequest.setNumObjeto(customerModel.getIcaTaxList().getObjectNumber());
		}
		else
		{
			icaInfObjetoRequest.setNumBP(VACIO);
		}


		final Calendar now = Calendar.getInstance();
		final int year = now.get(Calendar.YEAR);
		icaInfObjetoRequest.setAnoGravable(String.valueOf(year));

		try
		{
			final ICAInfObjetoForm icaInfObjetoFormResp = new ICAInfObjetoForm();

			final ObjectMapper mapper = new ObjectMapper();
			mapper.configure(org.codehaus.jackson.map.DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);


			final String response = sdhICAInfObjetoService.consultaICAInfObjeto(icaInfObjetoRequest);

			final ICAInfObjetoResponse icaInfObjetoResponse = mapper
					.readValue(response, ICAInfObjetoResponse.class);

			icaInfObjetoFormResp.setDocumentType(customerModel.getDocumentType());
			icaInfObjetoFormResp.setDocumentNumber(customerModel.getDocumentNumber());
			icaInfObjetoFormResp.setCompleteName(customerModel.getFirstName() + " " + customerModel.getLastName());
			icaInfObjetoFormResp.setIcaInfObjetoResponse(icaInfObjetoResponse);

			model.addAttribute("icaInfObjetoFormResp", icaInfObjetoFormResp);
			model.addAttribute("numObjeto", icaInfObjetoRequest.getNumObjeto());


		}
		catch (final Exception e)
		{
			LOG.error("error getting customer info from SAP for ICA details page: " + e.getMessage());
		}


		storeCmsPageInModel(model, getContentPageForLabelOrId(ICA_CMS_PAGE));
		setUpMetaDataForContentPage(model, getContentPageForLabelOrId(ICA_CMS_PAGE));
		model.addAttribute(BREADCRUMBS_ATTR, accountBreadcrumbBuilder.getBreadcrumbs(TEXT_ACCOUNT_PROFILE));
		model.addAttribute(ThirdPartyConstants.SeoRobots.META_ROBOTS, ThirdPartyConstants.SeoRobots.NOINDEX_NOFOLLOW);

		return getViewForPage(model);
	}

	@RequestMapping(value = "/contribuyentes/ica", method = RequestMethod.POST)
	@RequireHardLogIn
	public String icapost(final BindingResult bindingResult, final Model model, final RedirectAttributes redirectAttributes)
			throws CMSItemNotFoundException
	{
		System.out.println("------------------Entro al POST de ICA------------------------");

		return REDIRECT_TO_ICA_PAGE;
	}


	@RequestMapping(value = "/contribuyentes/ica/declaracion", method = RequestMethod.POST)
	@RequireHardLogIn
	public String ica2post(final BindingResult bindingResult, final Model model, final RedirectAttributes redirectAttributes)
			throws CMSItemNotFoundException
	{
		System.out.println("------------------Entro al POST de ICA------------------------");

		return REDIRECT_TO_ICA_DOS_PAGE;
	}

	@RequestMapping(value = "/contribuyentes/ica/declaracion", method = RequestMethod.GET)
	@RequireHardLogIn
	public String icadeclarainicial(final Model model, @RequestParam(required = false, value = "anoGravable")
	final String anoGravable, @RequestParam(required = false, value = "numObjeto")
	final String numObjeto) throws CMSItemNotFoundException
	{

		if (StringUtils.isAllBlank(numObjeto, anoGravable))
		{
			return REDIRECT_TO_ICA_PAGE;
		}


		final CustomerModel customerModel = (CustomerModel) userService.getCurrentUser();
		final ICAInfObjetoRequest icaInfObjetoRequest = new ICAInfObjetoRequest();

		icaInfObjetoRequest.setNumBP(customerModel.getNumBP());
		icaInfObjetoRequest.setNumObjeto(numObjeto);
		icaInfObjetoRequest.setAnoGravable(anoGravable);

		try
		{
			final ICAInfObjetoForm icaInfObjetoFormResp = new ICAInfObjetoForm();

			final ObjectMapper mapper = new ObjectMapper();
			mapper.configure(org.codehaus.jackson.map.DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);


			final String response = sdhICAInfObjetoService.consultaICAInfObjeto(icaInfObjetoRequest);

			final ICAInfObjetoResponse icaInfObjetoResponse = mapper.readValue(response, ICAInfObjetoResponse.class);

			icaInfObjetoFormResp.setDocumentType(customerModel.getDocumentType());
			icaInfObjetoFormResp.setDocumentNumber(customerModel.getDocumentNumber());
			icaInfObjetoFormResp.setCompleteName(customerModel.getFirstName() + " " + customerModel.getLastName());
			icaInfObjetoFormResp.setIcaInfObjetoResponse(icaInfObjetoResponse);

			model.addAttribute("icaInfObjetoFormResp", icaInfObjetoFormResp);
			model.addAttribute("numObjeto", icaInfObjetoRequest.getNumObjeto());
			//redirectModel.addFlashAttribute("icaInfObjetoFormResp", icaInfObjetoFormResp);


		}
		catch (final Exception e)
		{
			LOG.error("error getting customer info from SAP for ICA details page: " + e.getMessage());
		}


		storeCmsPageInModel(model, getContentPageForLabelOrId(ICA_DECLARACION_CMS_PAGE));
		setUpMetaDataForContentPage(model, getContentPageForLabelOrId(ICA_DECLARACION_CMS_PAGE));
		model.addAttribute(BREADCRUMBS_ATTR, accountBreadcrumbBuilder.getBreadcrumbs(DECLARACION_ACCOUNT_PROFILE));
		model.addAttribute(ThirdPartyConstants.SeoRobots.META_ROBOTS, ThirdPartyConstants.SeoRobots.NOINDEX_NOFOLLOW);

		return getViewForPage(model);
	}


	@RequestMapping(value = "/contribuyentes/ica/declaracion/calculo", method = RequestMethod.POST)
	@ResponseBody
	public ICACalculoImpResponse calculo(@ModelAttribute("icaCalculaDeclaracionForm")
	final ICACalculaDeclaracionForm icaCalculaDeclaracionForm) throws CMSItemNotFoundException
	{
		ICACalculoImpResponse icaCalculoImpResponse = new ICACalculoImpResponse();


		final ICACalculoImpRequest icaCalculoImpRequest = new ICACalculoImpRequest();

		icaCalculoImpRequest.setNumObjeto(icaCalculaDeclaracionForm.getNumObjeto());
		icaCalculoImpRequest.setNumForm(icaCalculaDeclaracionForm.getNumForm());
		icaCalculoImpRequest.setAnoGravable(icaCalculaDeclaracionForm.getAnoGravable());
		icaCalculoImpRequest.setPeriodo(icaCalculaDeclaracionForm.getPeriodo());
		icaCalculoImpRequest.setNumBP(icaCalculaDeclaracionForm.getNumBP());
		icaCalculoImpRequest.setCantEstablec(icaCalculaDeclaracionForm.getCantEstablec());
		icaCalculoImpRequest.setEntFinanciera(icaCalculaDeclaracionForm.getEntFinanciera());
		icaCalculoImpRequest.setImpuestoAviso(icaCalculaDeclaracionForm.getImpuestoAviso());
		icaCalculoImpRequest.setTotalIngrPeriodo(icaCalculaDeclaracionForm.getTotalIngrPeriodo());
		icaCalculoImpRequest.setValorPagar(icaCalculaDeclaracionForm.getValorPagar());
		icaCalculoImpRequest.setCheckAporte(icaCalculaDeclaracionForm.getCheckAporte());
		icaCalculoImpRequest.setProyectoAporte(icaCalculaDeclaracionForm.getProyectoAporte());
		icaCalculoImpRequest.setTarifaAporte(icaCalculaDeclaracionForm.getTarifaAporte());

		try
		{
			final ObjectMapper mapper = new ObjectMapper();
			mapper.configure(org.codehaus.jackson.map.DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);

			icaCalculoImpResponse = mapper.readValue(sdhICACalculoImpService.consultaICACalculoImp(icaCalculoImpRequest),
					ICACalculoImpResponse.class);


		}


		catch (final Exception e)
		{
			LOG.error("error calculating ica declaration: " + e.getMessage());

			final ErrorEnWS error = new ErrorEnWS();

			error.setIdmsj("0");
			error.setTxtmsj("Hubo un error al realizar el cálculo, por favor intentalo más tarde");

			final List<ErrorEnWS> errores = new ArrayList<ErrorEnWS>();

			errores.add(error);

			icaCalculoImpResponse.setErrores(errores);

		}


		return icaCalculoImpResponse;

	}

	@RequestMapping(value = "/generar", method = RequestMethod.POST)
	@ResponseBody
	public GeneraDeclaracionResponse generar(final GeneraDeclaracionForm dataForm, final HttpServletResponse response,
			final HttpServletRequest request) throws CMSItemNotFoundException
	{
		GeneraDeclaracionResponse generaDeclaracionResponse = new GeneraDeclaracionResponse();
		final CustomerModel customerModel = (CustomerModel) userService.getCurrentUser();
		String numForm = request.getParameter("numForm");

		if (StringUtils.isBlank(numForm))
		{
			numForm = dataForm.getNumForm();
		}

		final GeneraDeclaracionRequest generaDeclaracionRequest = new GeneraDeclaracionRequest();


		generaDeclaracionRequest.setNumForm(numForm);

		try
		{
			final ObjectMapper mapper = new ObjectMapper();
			mapper.configure(org.codehaus.jackson.map.DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);

			generaDeclaracionResponse = mapper.readValue(sdhGeneraDeclaracionService.generaDeclaracion(generaDeclaracionRequest),
					GeneraDeclaracionResponse.class);

			if (generaDeclaracionResponse != null && generaDeclaracionResponse.getStringPDF() != null)
			{
				final String encodedBytes = generaDeclaracionResponse.getStringPDF();

				final BASE64Decoder decoder = new BASE64Decoder();
				byte[] decodedBytes;
				final FileOutputStream fop;
				decodedBytes = new BASE64Decoder().decodeBuffer(encodedBytes);



				final String fileName = numForm + "-" + customerModel.getNumBP() + ".pdf";

				final InputStream is = new ByteArrayInputStream(decodedBytes);


				final CatalogUnawareMediaModel mediaModel = modelService.create(CatalogUnawareMediaModel.class);
				mediaModel.setCode(System.currentTimeMillis() + "_" + fileName);
				mediaModel.setDeleteByCronjob(Boolean.TRUE.booleanValue());
				modelService.save(mediaModel);
				mediaService.setStreamForMedia(mediaModel, is, fileName, "application/pdf");
				modelService.refresh(mediaModel);

				generaDeclaracionResponse.setUrlDownload(mediaModel.getDownloadURL());


			}

		}
		catch (final Exception e)
		{
			LOG.error("error generating declaration : " + e.getMessage());

			final ErrorPubli error = new ErrorPubli();

			error.setIdmsj("0");
			error.setTxtmsj("Hubo un error al generar la declaración, por favor intentalo más tarde");

			final List<ErrorPubli> errores = new ArrayList<ErrorPubli>();

			errores.add(error);

			generaDeclaracionResponse.setErrores(errores);

		}

		return generaDeclaracionResponse;

	}


}
