/**
 *
 */
package de.hybris.sdh.facades.impl;

import de.hybris.sdh.core.pojos.requests.UpdateRitRequest;
import de.hybris.sdh.core.pojos.responses.UpdateRitResponse;
import de.hybris.sdh.core.services.SDHUpdateRitService;
import de.hybris.sdh.facades.SDHUpdateRitFacade;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;


/**
 * @author hybris
 *
 */
public class DefaultSDHUpdateRitFacade implements SDHUpdateRitFacade
{

	private static final Logger LOG = Logger.getLogger(DefaultSDHUpdateRitFacade.class);

	@Resource(name = "sdhUpdateRitService")
	SDHUpdateRitService sdhUpdateRitService;


	/*
	 * (non-Javadoc)
	 *
	 * @see de.hybris.sdh.facades.SDHUpdateRitFacade#updateRit(de.hybris.sdh.core.pojos.requests.UpdateRitRequest)
	 */
	@Override
	public UpdateRitResponse updateRit(final UpdateRitRequest request)
	{
		UpdateRitResponse response = new UpdateRitResponse();
		response.setRitUpdated(false);
		final String strinResponse = sdhUpdateRitService.updateRit(request);

		if (StringUtils.isNotBlank(strinResponse))
		{
			try
			{
				final ObjectMapper mapper = new ObjectMapper();
				mapper.configure(org.codehaus.jackson.map.DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
				response = mapper.readValue(strinResponse, UpdateRitResponse.class);
				response.setRitUpdated(true);
			}
			catch (final Exception e)
			{
				LOG.error("there was an error while parsing update rit reponse: " + e.getMessage());
			}
		}

		return response;
	}


}