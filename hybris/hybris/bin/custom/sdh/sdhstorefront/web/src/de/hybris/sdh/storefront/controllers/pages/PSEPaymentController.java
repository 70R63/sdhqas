package de.hybris.sdh.storefront.controllers.pages;

import de.hybris.platform.acceleratorstorefrontcommons.annotations.RequireHardLogIn;
import de.hybris.platform.acceleratorstorefrontcommons.controllers.ThirdPartyConstants;
import de.hybris.platform.acceleratorstorefrontcommons.controllers.pages.AbstractPageController;
import de.hybris.platform.acceleratorstorefrontcommons.controllers.util.GlobalMessages;
import de.hybris.platform.cms2.exceptions.CMSItemNotFoundException;
import de.hybris.platform.servicelayer.config.ConfigurationService;
import de.hybris.sdh.core.dao.PseBankListCatalogDao;
import de.hybris.sdh.core.dao.PseTransactionsLogDao;
import de.hybris.sdh.core.model.PseBankListCatalogModel;
import de.hybris.sdh.core.model.PseTransactionsLogModel;
import de.hybris.sdh.core.services.SDHPseTransactionsLogService;
import de.hybris.sdh.core.soap.pse.PseServices;
import de.hybris.sdh.core.soap.pse.beans.ConstantConnectionData;
import de.hybris.sdh.core.soap.pse.eanucc.AmountType;
import de.hybris.sdh.core.soap.pse.eanucc.CreateTransactionPaymentInformationType;
import de.hybris.sdh.core.soap.pse.eanucc.CreateTransactionPaymentResponseInformationType;
import de.hybris.sdh.core.soap.pse.eanucc.CreateTransactionPaymentResponseReturnCodeList;
import de.hybris.sdh.core.soap.pse.impl.MessageHeader;
import de.hybris.sdh.storefront.controllers.ControllerPseConstants;
import de.hybris.sdh.storefront.controllers.pages.forms.SelectAtomValue;
import de.hybris.sdh.storefront.forms.PSEPaymentForm;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.apache.axis.types.NonNegativeInteger;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


/**
 * @author Consultor
 *
 */
@Controller
@RequestMapping("/impuestos")
public class PSEPaymentController extends AbstractPageController
{
	private static final Logger LOG = Logger.getLogger(PSEPaymentController.class); //new
	private static final String CMS_SITE_PAGE_PAGO_PSE = "PagoPSEPage";
	private static final String CMS_SITE_PAGE_PAGO_EN_lINEA = "PagoEnLineaPSEPage";


	@Resource(name = "pseBankListCatalogDao")
	private PseBankListCatalogDao pseBankListCatalogDao;


	@Resource(name = "defaultPseServices")
	private PseServices pseServices;


	@Resource(name = "configurationService")
	private ConfigurationService configurationService;


	@Resource(name = "pseTransactionsLogService")
	private SDHPseTransactionsLogService pseTransactionsLogService;

	@Resource(name = "pseTransactionsLogDao")
	private PseTransactionsLogDao pseTransactionsLogDao;



	@ModelAttribute("tipoDeImpuesto")
	public List<SelectAtomValue> getIdTipoDeImpuesto()
	{

		final List<SelectAtomValue> tipoDeImpuesto = Arrays.asList(
				new SelectAtomValue(new ControllerPseConstants().getDELINEACION(), "Delineacion"),
				new SelectAtomValue(new ControllerPseConstants().getGASOLINA(), "Gasolina"),
				new SelectAtomValue(new ControllerPseConstants().getICA(), "ICA"),
				new SelectAtomValue(new ControllerPseConstants().getPREDIAL(), "Predial"),
				new SelectAtomValue(new ControllerPseConstants().getPUBLICIDAD(), "Publicidad"),
				new SelectAtomValue(new ControllerPseConstants().getVEHICULAR(), "Vehicular"));

		return tipoDeImpuesto;
	}

	@ModelAttribute("anoGravable")
	public List<SelectAtomValue> getIdAnoGravable()
	{

		final List<SelectAtomValue> anoGravable = Arrays.asList(
				new SelectAtomValue("2019", "2019"),
				new SelectAtomValue("2018", "2018"),
				new SelectAtomValue("2017", "2017"));

		return anoGravable;
	}

	@ModelAttribute("periodo")
	public List<SelectAtomValue> getIdPeriodo()
	{
		//Periodos para gasolina
		final List<SelectAtomValue> periodo = Arrays.asList(
				new SelectAtomValue("1901", "Enero"),
				new SelectAtomValue("1902", "Febrero"),
				new SelectAtomValue("1903", "Marzo"),
				new SelectAtomValue("1904", "Abril"),
				new SelectAtomValue("1905", "Mayo"),
				new SelectAtomValue("1906", "Junio"),
				new SelectAtomValue("1907", "Julio"),
				new SelectAtomValue("1908", "Agostp"),
				new SelectAtomValue("1909", "Septiembre"),
				new SelectAtomValue("1910", "Octubre"),
				new SelectAtomValue("1911", "Noviembre"),
				new SelectAtomValue("1912", "Diciembre"));

		return periodo;
	}

	@ModelAttribute("pagoAdicional")
	public List<SelectAtomValue> getIdPagoAdicional()
	{

		final List<SelectAtomValue> pagoAdicional = Arrays.asList(
				new SelectAtomValue("S", "Si"),
				new SelectAtomValue("N", "No"));

		return pagoAdicional;
	}

	@ModelAttribute("banco")
	public List<SelectAtomValue> getIdBanco()
	{
		final List<SelectAtomValue> banco = new ArrayList<SelectAtomValue>(); //
		for (final PseBankListCatalogModel bankEntry : pseBankListCatalogDao.getAllBankEntries().getResult())
		{
			banco.add(new SelectAtomValue(bankEntry.getFinancialInstitutionCode(), bankEntry.getFinancialInstitutionName()));
		}
		return banco;
	}

	@ModelAttribute("tipoDeTarjeta")
	public List<SelectAtomValue> getIdTipoDeTarjeta()
	{

		final List<SelectAtomValue> tipoDeTarjeta = Arrays.asList(
				new SelectAtomValue("01", "Cedito"),
				new SelectAtomValue("02", "Debito"));

		return tipoDeTarjeta;
	}

	@ModelAttribute("tipoDeIdentificacion")
	public List<SelectAtomValue> getIdTipoDeIdentificacion()
	{

		final List<SelectAtomValue> tipoDeIdentificacion = Arrays.asList(
				new SelectAtomValue("CC",  "Cedula De Ciudadania"),
				new SelectAtomValue("NIT", "NIT De La Empresa"),
				new SelectAtomValue("CE",  "Cedula De Extranjeria"),
				new SelectAtomValue("TI",  "Tarjeta De Identificacion"),
				new SelectAtomValue("PP",  "Pasaporte"));

		return tipoDeIdentificacion;
	}

	@RequestMapping(value = "/pagoEnLinea", method = RequestMethod.GET)
	@RequireHardLogIn
	public String pagoEnLinea(final Model model, final RedirectAttributes redirectModel,
			@RequestParam(required = false, defaultValue = "", value = "debugMode")
			final String debugMode) throws CMSItemNotFoundException
	{
		storeCmsPageInModel(model, getContentPageForLabelOrId(CMS_SITE_PAGE_PAGO_EN_lINEA));
		setUpMetaDataForContentPage(model, getContentPageForLabelOrId(CMS_SITE_PAGE_PAGO_EN_lINEA));
		model.addAttribute(ThirdPartyConstants.SeoRobots.META_ROBOTS, ThirdPartyConstants.SeoRobots.NOINDEX_NOFOLLOW);

		model.addAttribute("psePaymentForm", new PSEPaymentForm());
		model.addAttribute("debugMode", debugMode);
		LOG.info("debugMode[" + debugMode + "]");

		return getViewForPage(model);
	}


	@RequestMapping(value = "/pagoEnLinea/pseResponse", method = RequestMethod.GET)
	@RequireHardLogIn
	public String pseResponse(final Model model, final RedirectAttributes redirectModel,
			@RequestParam(required = false, defaultValue = "", value = "ticketId") final String ticketId)
			throws CMSItemNotFoundException
	{
		storeCmsPageInModel(model, getContentPageForLabelOrId(CMS_SITE_PAGE_PAGO_PSE));
		setUpMetaDataForContentPage(model, getContentPageForLabelOrId(CMS_SITE_PAGE_PAGO_PSE));
		model.addAttribute(ThirdPartyConstants.SeoRobots.META_ROBOTS, ThirdPartyConstants.SeoRobots.NOINDEX_NOFOLLOW);

		System.out.println("------ pseResponse ------- ");
		System.out.println(ticketId);

		/*
		 * final PSEPaymentForm psePaymentForm = new PSEPaymentForm();
		 * psePaymentForm.setTipoDeImpuesto(ControllerConstants.PSE.GASOLINA); psePaymentForm.setPeriodo("02");
		 * psePaymentForm.setAnoGravable("2019");
		 */

		final String codeResponse = pseTransactionsLogService.updateTransaction(ticketId);

		model.addAttribute("psePaymentForm", this.getPSEPaymentForm(ticketId));
		model.addAttribute("ControllerPseConstants", new ControllerPseConstants());
		model.addAttribute("disableFields", "true");

		GlobalMessages.addInfoMessage(model, "pse.message.info.success.transaction");
		/*
		 * GlobalMessages.addFlashMessage(redirectModel, GlobalMessages.INFO_MESSAGES_HOLDER,
		 * "pse.message.info.success.transaction", new Object[]{ codeResponse });
		 */

		return getViewForPage(model);
	}


	@RequestMapping(value = "/pagoEnLinea/form", method = RequestMethod.POST)
	@RequireHardLogIn
	public String pagoEnLineaForm(final Model model, final PSEPaymentForm psePaymentForm) throws CMSItemNotFoundException
	{
		storeCmsPageInModel(model, getContentPageForLabelOrId(CMS_SITE_PAGE_PAGO_PSE));
		setUpMetaDataForContentPage(model, getContentPageForLabelOrId(CMS_SITE_PAGE_PAGO_PSE));
		model.addAttribute(ThirdPartyConstants.SeoRobots.META_ROBOTS, ThirdPartyConstants.SeoRobots.NOINDEX_NOFOLLOW);

		model.addAttribute("psePaymentForm", psePaymentForm);
		model.addAttribute("ControllerPseConstants", new ControllerPseConstants());
		model.addAttribute("debugMode", psePaymentForm.getDebugMode());

		LOG.info("debugMode[" + psePaymentForm.getDebugMode() + "]");


		return getViewForPage(model);
	}

	@RequestMapping(value = "/pagoEnLinea/realizarPago", method = RequestMethod.POST)
	@RequireHardLogIn
	public String realizarPago(final Model model, final PSEPaymentForm psePaymentForm, final RedirectAttributes redirectModel)
			throws CMSItemNotFoundException
	{
		storeCmsPageInModel(model, getContentPageForLabelOrId(CMS_SITE_PAGE_PAGO_PSE));
		setUpMetaDataForContentPage(model, getContentPageForLabelOrId(CMS_SITE_PAGE_PAGO_PSE));
		model.addAttribute(ThirdPartyConstants.SeoRobots.META_ROBOTS, ThirdPartyConstants.SeoRobots.NOINDEX_NOFOLLOW);


		String redirecUrl = getViewForPage(model);

		final CreateTransactionPaymentResponseInformationType response = this.doPsePayment(psePaymentForm);

		if (response != null)
		{
			final String returnCode = response.getReturnCode().getValue();
			if (returnCode.equals(CreateTransactionPaymentResponseReturnCodeList._SUCCESS))
			{
				redirecUrl = "redirect:" + response.getBankurl();
			}
			this.savePseTransaction(this.getConstantConnectionData(psePaymentForm.getBanco(), psePaymentForm.getTipoDeImpuesto(),
					psePaymentForm.getNumeroDeReferencia()), response, psePaymentForm);
			GlobalMessages.addInfoMessage(model, "pse.message.info.done.transaction.with.status");
			/*
			 * GlobalMessages.addFlashMessage(redirectModel, GlobalMessages.INFO_MESSAGES_HOLDER,
			 * "pse.message.info.done.transaction.with.status", new Object[]{ returnCode });
			 */
		}
		else
		{
			GlobalMessages.addErrorMessage(model, "pse.message.error.no.connection");
			/*GlobalMessages.addFlashMessage(redirectModel, GlobalMessages.ERROR_MESSAGES_HOLDER,
					"pse.message.error.no.connection", new Object[] {});*/
		}


		LOG.info(response);
		LOG.info(psePaymentForm);
		LOG.info("Call PSE/Bank Web Service");
		model.addAttribute("psePaymentForm", psePaymentForm);
		model.addAttribute("ControllerPseConstants", new ControllerPseConstants());

		return redirecUrl;
	}


	private CreateTransactionPaymentResponseInformationType doPsePayment(final PSEPaymentForm psePaymentForm)
	{
		final CreateTransactionPaymentInformationType createTransactionPaymentInformationType = new CreateTransactionPaymentInformationType();

		LOG.info("----------- doPsePayment --------------");
		LOG.info(psePaymentForm);
		LOG.info("----------- doPsePayment --------------");

		createTransactionPaymentInformationType.setPaymentDescription("descripcion de ejemplo");
		createTransactionPaymentInformationType.setTicketId(new NonNegativeInteger(psePaymentForm.getNumeroDeReferencia()));
		createTransactionPaymentInformationType.setTransactionValue(this.getAmount("COP", psePaymentForm.getValorAPagar()));
		createTransactionPaymentInformationType.setVatValue(this.getAmount("COP", psePaymentForm.getValorAPagar()));
		createTransactionPaymentInformationType.setReferenceNumber(this.getReferences(
				psePaymentForm.getTipoDeIdentificacion() + " " + psePaymentForm.getNoIdentificacion(), "Dir. IP 172.18.39.46", "r3"));


		return pseServices
				.createTransactionPayment(
						this.getConstantConnectionData(psePaymentForm.getBanco(), psePaymentForm.getTipoDeImpuesto(),
								psePaymentForm.getNumeroDeReferencia()),
						this.getMessageHeader(), createTransactionPaymentInformationType);
	}

	private MessageHeader getMessageHeader()
	{
		final MessageHeader messageHeader = new MessageHeader();
		messageHeader.setTo(configurationService.getConfiguration().getString("sdh.pse.messageHeader.to"));
		messageHeader.setFrom(configurationService.getConfiguration().getString("sdh.pse.messageHeader.from"));
		messageHeader
				.setRepresentingParty(configurationService.getConfiguration().getString("sdh.pse.messageHeader.representingParty"));
		return messageHeader;
	}

	private ConstantConnectionData getConstantConnectionData(final String bankCode, final String serviceCode,
			final String ticketId)
	{
		final ConstantConnectionData constantConnectionData = new ConstantConnectionData();
		constantConnectionData.setPseurl(configurationService.getConfiguration().getString("sdh.pse.pseURL"));
		constantConnectionData.setPpeCode(configurationService.getConfiguration().getString("sdh.pse.ppeCode"));
		constantConnectionData
				.setEntityUrl(configurationService.getConfiguration().getString("sdh.pse.entityUrl") + "?ticketId=" + ticketId);
		constantConnectionData.setBankCode(bankCode);
		constantConnectionData.setServiceCode(serviceCode);
		return constantConnectionData;
	}

	private AmountType getAmount(final String currencyIso, final String value)
	{
		final AmountType amount = new AmountType();
		amount.setCurrencyISOcode(currencyIso);
		amount.setValue(new BigDecimal(value));
		return amount;
	}

	private String[] getReferences(final String r1, final String r2, final String r3)
	{
		final String[] references = new String[3];
		references[0] = r1;
		references[1] = r2;
		references[2] = r3;
		return references;
	}

	private void savePseTransaction(final ConstantConnectionData constantConnectionData,
			final CreateTransactionPaymentResponseInformationType transactionPaymentResponse, final PSEPaymentForm psePaymentForm)
	{
		pseTransactionsLogService.newLogTransactionEntry(constantConnectionData, transactionPaymentResponse,
				psePaymentForm.getNumeroDeReferencia(), psePaymentForm.getTipoDeImpuesto(), psePaymentForm.getImpuesto(),
				psePaymentForm.getAnoGravable(), psePaymentForm.getCHIP(), psePaymentForm.getPeriodo(), psePaymentForm.getCUD(),
				psePaymentForm.getTipoDeIdentificacion(), psePaymentForm.getNoIdentificacion(), psePaymentForm.getDV(),
				psePaymentForm.getFechaLimiteDePago(), psePaymentForm.getPagoAdicional(), psePaymentForm.getBanco(),
				psePaymentForm.getValorAPagar(), configurationService.getConfiguration().getString("sdh.pse.isoCodeCurrency"),
				psePaymentForm.getTipoDeTarjeta());
	}

	private PSEPaymentForm getPSEPaymentForm(final String ticketId)
	{
		final PSEPaymentForm form = new PSEPaymentForm();
		final PseTransactionsLogModel modelo = pseTransactionsLogDao.getTransaction(ticketId);

		if (modelo != null)
		{
			form.setTipoDeImpuesto(modelo.getTipoDeImpuesto());
			form.setNumeroDeReferencia(modelo.getNumeroDeReferencia());
			form.setImpuesto(modelo.getImpuesto());
			form.setAnoGravable(modelo.getAnoGravable());
			form.setCHIP(modelo.getCHIP());
			form.setPeriodo(modelo.getPeriodo());
			form.setCUD(modelo.getCUD());
			form.setNoIdentificacion(modelo.getNoIdentificacion());
			form.setDV(modelo.getDV());
			form.setTipoDeIdentificacion(modelo.getTipoDeIdentificacion());
			form.setFechaLimiteDePago(modelo.getFechaLimiteDePago());
			form.setPagoAdicional(modelo.getPagoAdicional());
			form.setBanco(modelo.getBanco());
			form.setValorAPagar(modelo.getValorAPagar());
			form.setTipoDeTarjeta(modelo.getTipoDeTarjeta());
		}

		return form;
	}

}
