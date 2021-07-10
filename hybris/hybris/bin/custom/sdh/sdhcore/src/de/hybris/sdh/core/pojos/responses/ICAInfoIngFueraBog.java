/**
 *
 */
package de.hybris.sdh.core.pojos.responses;

/**
 * @author hybris
 *
 */
public class ICAInfoIngFueraBog
{
	private String codCIIU;
	private String codMunicipio;
	private String desMunicipio;
	private String ingresos;


	/**
	 * @return the codCIIU
	 */
	public String getCodCIIU()
	{
		return codCIIU;
	}

	/**
	 * @param codCIIU
	 *           the codCIIU to set
	 */
	public void setCodCIIU(final String codCIIU)
	{
		this.codCIIU = codCIIU;
	}

	/**
	 * @return the codMunicipio
	 */
	public String getCodMunicipio()
	{
		return codMunicipio;
	}

	/**
	 * @param codMunicipio
	 *           the codMunicipio to set
	 */
	public void setCodMunicipio(final String codMunicipio)
	{
		this.codMunicipio = codMunicipio;
	}

	/**
	 * @return the desMunicipio
	 */
	public String getDesMunicipio()
	{
		return desMunicipio;
	}

	/**
	 * @param desMunicipio
	 *           the desMunicipio to set
	 */
	public void setDesMunicipio(final String desMunicipio)
	{
		this.desMunicipio = desMunicipio;
	}

	/**
	 * @return the ingresos
	 */
	public String getIngresos()
	{
		return ingresos;
	}

	/**
	 * @param ingresos
	 *           the ingresos to set
	 */
	public void setIngresos(final String ingresos)
	{
		this.ingresos = ingresos;
	}

	/**
	 *
	 */
	public ICAInfoIngFueraBog(final String str)
	{
		super();
	}

	/**
	 *
	 */
	public ICAInfoIngFueraBog()
	{
		super();
	}



}