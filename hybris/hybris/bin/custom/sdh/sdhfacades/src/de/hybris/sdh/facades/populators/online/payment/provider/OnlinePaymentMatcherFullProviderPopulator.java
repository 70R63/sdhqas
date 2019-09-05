package de.hybris.sdh.facades.populators.online.payment.provider;

import de.hybris.platform.converters.Populator;
import de.hybris.platform.servicelayer.dto.converter.ConversionException;
import de.hybris.sdh.core.model.OlnPymntPvdMatcherModel;
import de.hybris.sdh.facades.online.payment.data.OnlinePaymentSelectInputBoxData;

public class OnlinePaymentMatcherFullProviderPopulator implements Populator<OlnPymntPvdMatcherModel, OnlinePaymentSelectInputBoxData> {

    @Override
    public void populate(OlnPymntPvdMatcherModel olnPymntPvdMatcherModel, OnlinePaymentSelectInputBoxData onlinePaymentSelectInputBoxData) throws ConversionException {
        onlinePaymentSelectInputBoxData.setCode(olnPymntPvdMatcherModel.getOnlinePaymentProviderType().getCode());
        onlinePaymentSelectInputBoxData.setDescription(olnPymntPvdMatcherModel.getOnlinePaymentProviderType().getName());
    }
}