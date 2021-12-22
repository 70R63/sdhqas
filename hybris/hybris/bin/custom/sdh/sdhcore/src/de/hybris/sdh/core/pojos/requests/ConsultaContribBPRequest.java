/**
 *
 */
package de.hybris.sdh.core.pojos.requests;

/**
 * @author hybris
 *
 */
public class ConsultaContribBPRequest
{
	private String numBP;
	private String indicador;

	/**
	 * @return the numBP
	 */
	public String getNumBP()
	{
		return numBP;
	}

	/**
	 * @param numBP
	 *           the numBP to set
	 */
	public void setNumBP(final String numBP)
	{
		this.numBP = numBP;
	}

	/**
	 * @return the indicador
	 */
	public String getIndicador()
	{
		return indicador;
	}

	/**
	 * @param indicador
	 *           the indicador to set
	 */
	public void setIndicador(final String indicador)
	{
		this.indicador = indicador;
	}

	/*
	 * (non-Javadoc)
	 *
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString()
	{
		final StringBuilder stringBuilder = new StringBuilder();

		stringBuilder.append("{");
		stringBuilder.append(obtenerValorJson("\"numBP\":\"", this.getNumBP(), "\","));
		stringBuilder.append(obtenerValorJson("\"indicador\":\"", this.getIndicador(), "\""));
		stringBuilder.append("}");



		return stringBuilder.toString();
	}

	private String obtenerValorJson(final String cadena1, final String valor, final String cadena2)
	{
		String valorVariable = "";

		valorVariable = (valor != null) ? cadena1 + valor + cadena2 : cadena1 + cadena2;


		return valorVariable;
	}
}
