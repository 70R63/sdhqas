/**
 *
 */
package de.hybris.sdh.core.pojos.requests;

import com.fasterxml.jackson.annotation.JsonSetter;


/**
 * @author Maria Torres
 *
 */
public class ConcesionariosRequest
{
	private String eRNAM;
	private String bUDAT;
	private String aUGUST;
	/**
	 * @return the eRNAM
	 */
	public String geteRNAM()
	{
		return eRNAM;
	}

	/**
	 * @param eRNAM
	 *           the eRNAM to set
	 */
	@JsonSetter("ERNAM")
	public void seteRNAM(final String eRNAM)
	{
		this.eRNAM = eRNAM;
	}
	/**
	 * @return the bUDAT
	 */
	public String getbUDAT()
	{
		return bUDAT;
	}

	/**
	 * @param bUDAT
	 *           the bUDAT to set
	 */
	@JsonSetter("BUDAT")
	public void setbUDAT(final String bUDAT)
	{
		this.bUDAT = bUDAT;
	}
	/**
	 * @return the aUGUST
	 */
	public String getaUGUST()
	{
		return aUGUST;
	}

	/**
	 * @param aUGUST
	 *           the aUGUST to set
	 */
	@JsonSetter("AUGUST")
	public void setaUGUST(final String aUGUST)
	{
		this.aUGUST = aUGUST;
	}

	@Override
	public String toString()
	{
		return "ConcesionariosRequest [eRNAM=" + eRNAM + ", bUDAT=" + bUDAT + ", aUGUST=" + aUGUST + "]";
	}

}
