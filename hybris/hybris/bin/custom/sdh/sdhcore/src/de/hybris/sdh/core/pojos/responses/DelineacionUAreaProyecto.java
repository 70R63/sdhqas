/**
 *
 */
package de.hybris.sdh.core.pojos.responses;

/**
 * @author Federico Flores Dimas
 *
 */
public class DelineacionUAreaProyecto
{

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString()
	{
		return "DelineacionUAreaProyecto [areaProy=" + areaProy + ", aream2=" + aream2 + "]";
	}

	private String areaProy;
	private String aream2;

	/**
	 * @return the areaProy
	 */
	public String getAreaProy()
	{
		return areaProy;
	}

	/**
	 * @param areaProy
	 *           the areaProy to set
	 */
	public void setAreaProy(final String areaProy)
	{
		this.areaProy = areaProy;
	}

	/**
	 * @return the aream2
	 */
	public String getAream2()
	{
		return aream2;
	}

	/**
	 * @param aream2
	 *           the aream2 to set
	 */
	public void setAream2(final String aream2)
	{
		this.aream2 = aream2;
	}


}
