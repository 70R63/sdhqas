/**
 *
 */
package de.hybris.sdh.core.services.impl;

import de.hybris.platform.servicelayer.config.ConfigurationService;
import de.hybris.sdh.core.pojos.requests.ConsultaContribuyenteBPRequest;
import de.hybris.sdh.core.pojos.requests.ValidaContribuyenteRequest;
import de.hybris.sdh.core.pojos.responses.ImpuestoPublicidadExterior;
import de.hybris.sdh.core.pojos.responses.SDHValidaMailRolResponse;
import de.hybris.sdh.core.services.SDHValidaContribuyenteService;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.annotation.Resource;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.http.HttpEntity;
import org.springframework.http.client.support.BasicAuthorizationInterceptor;
import org.springframework.web.client.RestTemplate;


/**
 * @author hybris
 *
 */
public class DefaultSDHValidaContribuyenteService implements SDHValidaContribuyenteService
{

	private static final Logger LOG = Logger.getLogger(DefaultSDHValidaContribuyenteService.class);

	@Resource(name = "configurationService")
	private ConfigurationService configurationService;

	/* (non-Javadoc)
	 * @see de.hybris.sdh.core.services.SDHValidaContribuyente#validaContribuyente(de.hybris.sdh.core.pojos.requests.ValidaContribuyenteRequest)
	 */
	@Override
	public String validaContribuyente(final ValidaContribuyenteRequest request)
	{
		final String urlString = configurationService.getConfiguration().getString("sdh.validacontribuyente.url");
		final String user = configurationService.getConfiguration().getString("sdh.validacontribuyente.user");
		final String password = configurationService.getConfiguration().getString("sdh.validacontribuyente.password");

		if (StringUtils.isAnyBlank(urlString, user, password))
		{
			throw new RuntimeException("Error while validating contribuyente: Empty credentials");
		}

		try
		{
			final URL url = new URL(urlString);

			final HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");

			final String authString = user + ":" + password;
			final String authStringEnc = new String(Base64.encodeBase64(authString.getBytes()));
			conn.setRequestProperty("Authorization", "Basic " + authStringEnc);
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setUseCaches(false);
			conn.setDoInput(true);
			conn.setDoOutput(true);
			LOG.info("connection to: " + conn.toString());

			final String requestJson = request.toString();
			LOG.info("request: " + requestJson);

			final OutputStream os = conn.getOutputStream();
			os.write(requestJson.getBytes());
			os.flush();
			if (conn.getResponseCode() != HttpURLConnection.HTTP_OK)
			{
				throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
			}

			final BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
			final StringBuilder builder = new StringBuilder();

			String inputLine;
			while ((inputLine = br.readLine()) != null)
			{
				builder.append(inputLine);
			}


			final String result = builder.toString();
			LOG.info("response: " + result);

			return result;

		}
		catch (final Exception e)
		{
			LOG.error("There was an error validating a contribuyente: " + e.getMessage());
		}
		return null;
	}

	/*
	 * (non-Javadoc)
	 *
	 * @see
	 * de.hybris.sdh.core.services.SDHValidaContribuyenteService#validaContibuyente(de.hybris.sdh.core.pojos.requests.
	 * ConsultaContribuyenteBPRequest)
	 */
	@Override
	public SDHValidaMailRolResponse validaContribuyente(final String stringBp)
	{
		final String usuario = configurationService.getConfiguration().getString("sdh.validacontribuyente.user");
		final String password = configurationService.getConfiguration().getString("sdh.validacontribuyente.password");
		final String urlService = configurationService.getConfiguration().getString("sdh.validacontribuyente.url");

		final ConsultaContribuyenteBPRequest bp = new ConsultaContribuyenteBPRequest();
		bp.setNumBP(stringBp);

		final RestTemplate restTemplate = new RestTemplate();
		restTemplate.getInterceptors().add(new BasicAuthorizationInterceptor(usuario, password));

		final HttpEntity<ConsultaContribuyenteBPRequest> request = new HttpEntity<>(bp);
		return restTemplate.postForObject(urlService, request, SDHValidaMailRolResponse.class);
	}

	/*
	 * (non-Javadoc)
	 *
	 * @see de.hybris.sdh.core.services.SDHValidaContribuyenteService#getpublicidadExtListByBpAndYear(java.lang.String,
	 * java.lang.String)
	 */
	@Override
	public List<ImpuestoPublicidadExterior> getpublicidadExtListByBpAndYear(final String stringBp, final String stringYear)
	{
		final SDHValidaMailRolResponse contribuyente = this.validaContribuyente(stringBp);
		final List<ImpuestoPublicidadExterior> returnList = new ArrayList<>();
		if (Objects.nonNull(contribuyente))
		{
			for (final ImpuestoPublicidadExterior pExterior : contribuyente.getPublicidadExt())
			{
				if (Objects.nonNull(pExterior.getAnoGravable()))
				{
					if (pExterior.getAnoGravable().equals(stringYear))
					{
						returnList.add(pExterior);
					}
				}
			}
		}
		// XXX Auto-generated method stub
		return returnList;
	}



}
