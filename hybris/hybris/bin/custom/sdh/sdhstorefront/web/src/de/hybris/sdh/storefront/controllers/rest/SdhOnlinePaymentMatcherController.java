package de.hybris.sdh.storefront.controllers.rest;

import de.hybris.platform.servicelayer.config.ConfigurationService;
import de.hybris.sdh.core.soap.pse.PseServices;
import de.hybris.sdh.core.soap.pse.beans.ConstantConnectionData;
import de.hybris.sdh.core.soap.pse.impl.MessageHeader;
import de.hybris.sdh.facades.online.payment.data.OnlinePaymentSelectInputBoxData;
import de.hybris.sdh.facades.online.payment.impl.DefaultSDHOnlinePaymentProviderMatcherFacade;

import java.util.Comparator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
@RestController
@RequestMapping("/onlinePaymentMatcher")
public class SdhOnlinePaymentMatcherController {

    @Resource(name = "sdhOnlinePaymentProviderMatcherFacade")
    DefaultSDHOnlinePaymentProviderMatcherFacade sdhOnlinePaymentProviderMatcherFacade;

	@Resource(name = "configurationService")
	private ConfigurationService configurationService;

	@Resource(name = "defaultPseServices")
	private PseServices pseServices;


    @RequestMapping("/getBanks")
	public List<OnlinePaymentSelectInputBoxData> getBanks(@RequestParam(value="tax", defaultValue="") final String tax,
                                                          @RequestParam(value="paymentMethod", defaultValue="") final String paymentMethod) {


		final List<OnlinePaymentSelectInputBoxData> result = sdhOnlinePaymentProviderMatcherFacade.getBankList(tax, paymentMethod);
		result.sort(Comparator.comparing(OnlinePaymentSelectInputBoxData::getDescription));

		return result;

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

	private ConstantConnectionData getConstantConnectionData()
	{
		final ConstantConnectionData constantConnectionData = new ConstantConnectionData();
		constantConnectionData.setPseurl(configurationService.getConfiguration().getString("sdh.pse.pseURL"));
		constantConnectionData.setPpeCode(configurationService.getConfiguration().getString("sdh.pse.ppeCode"));
		return constantConnectionData;
	}

}