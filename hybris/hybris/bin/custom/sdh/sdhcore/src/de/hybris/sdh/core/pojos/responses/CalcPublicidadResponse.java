/**
 *
 */
package de.hybris.sdh.core.pojos.responses;

import java.util.List;


/**
 * @author Maria Luisa
 *
 */
public class CalcPublicidadResponse
{


	private List<errorPubli> errores;
	private String numForm;
	private String impCargo;
	private String vlrSancion;
	private String vlrPagar;
	private String interesMora;
	private String totalPagar;
	private String referencia;

	/**
	 * @return the errores
	 */
	public List<errorPubli> getErrores()
	{
		return errores;
	}

	/**
	 * @param errores
	 *           the errores to set
	 */
	public void setErrores(final List<errorPubli> errores)
	{
		this.errores = errores;
	}

	/**
	 * @return the numForm
	 */
	public String getNumForm()
	{
		return numForm;
	}

	/**
	 * @param numForm
	 *           the numForm to set
	 */
	public void setNumForm(final String numForm)
	{
		this.numForm = numForm;
	}

	/**
	 * @return the impCargo
	 */
	public String getImpCargo()
	{
		return impCargo;
	}

	/**
	 * @param impCargo
	 *           the impCargo to set
	 */
	public void setImpCargo(final String impCargo)
	{
		this.impCargo = impCargo;
	}

	/**
	 * @return the vlrSancion
	 */
	public String getVlrSancion()
	{
		return vlrSancion;
	}

	/**
	 * @param vlrSancion
	 *           the vlrSancion to set
	 */
	public void setVlrSancion(final String vlrSancion)
	{
		this.vlrSancion = vlrSancion;
	}

	/**
	 * @return the vlrPagar
	 */
	public String getVlrPagar()
	{
		return vlrPagar;
	}

	/**
	 * @param vlrPagar
	 *           the vlrPagar to set
	 */
	public void setVlrPagar(final String vlrPagar)
	{
		this.vlrPagar = vlrPagar;
	}

	/**
	 * @return the interesMora
	 */
	public String getInteresMora()
	{
		return interesMora;
	}

	/**
	 * @param interesMora
	 *           the interesMora to set
	 */
	public void setInteresMora(final String interesMora)
	{
		this.interesMora = interesMora;
	}

	/**
	 * @return the totalPagar
	 */
	public String getTotalPagar()
	{
		return totalPagar;
	}

	/**
	 * @param totalPagar
	 *           the totalPagar to set
	 */
	public void setTotalPagar(final String totalPagar)
	{
		this.totalPagar = totalPagar;
	}

	/**
	 * @return the referencia
	 */
	public String getReferencia()
	{
		return referencia;
	}

	/**
	 * @param referencia
	 *           the referencia to set
	 */
	public void setReferencia(final String referencia)
	{
		this.referencia = referencia;
	}

}