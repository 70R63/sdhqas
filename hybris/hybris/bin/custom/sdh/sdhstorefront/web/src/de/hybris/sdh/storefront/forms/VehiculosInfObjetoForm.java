/**
 *
 */
package de.hybris.sdh.storefront.forms;

import de.hybris.sdh.core.pojos.requests.DetalleVehiculosRequest;
import de.hybris.sdh.core.pojos.responses.DetalleVehiculosResponse;
import de.hybris.sdh.core.pojos.responses.ImpuestoVehiculos;
import de.hybris.sdh.core.pojos.responses.SDHValidaMailRolResponse;

import java.util.List;


/**
 * @author Consultor
 *
 */
public class VehiculosInfObjetoForm
{
	private String numBP;
	private String tipiden;
	private String numide;
	private String name;
	private String bpNum;
	private String placa;
	private String anioGravable;

	private SDHValidaMailRolResponse vehiculos;

	private List<ImpuestoVehiculos> impvehicular;
	private DetalleVehiculosRequest detallerequest;
	private DetalleVehiculosResponse detalle;

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
	 * @return the tipiden
	 */
	public String getTipiden()
	{
		return tipiden;
	}

	/**
	 * @param tipiden
	 *           the tipiden to set
	 */
	public void setTipiden(final String tipiden)
	{
		this.tipiden = tipiden;
	}

	/**
	 * @return the numide
	 */
	public String getNumide()
	{
		return numide;
	}

	/**
	 * @param numide
	 *           the numide to set
	 */
	public void setNumide(final String numide)
	{
		this.numide = numide;
	}

	/**
	 * @return the name
	 */
	public String getName()
	{
		return name;
	}

	/**
	 * @param name
	 *           the name to set
	 */
	public void setName(final String name)
	{
		this.name = name;
	}

	/**
	 * @return the vehiculos
	 */
	public SDHValidaMailRolResponse getVehiculos()
	{
		return vehiculos;
	}

	/**
	 * @param vehiculos
	 *           the vehiculos to set
	 */
	public void setVehiculos(final SDHValidaMailRolResponse vehiculos)
	{
		this.vehiculos = vehiculos;
	}

	/**
	 * @return the impvehicular
	 */
	public List<ImpuestoVehiculos> getImpvehicular()
	{
		return impvehicular;
	}

	/**
	 * @param impvehicular
	 *           the impvehicular to set
	 */
	public void setImpvehicular(final List<ImpuestoVehiculos> impvehicular)
	{
		this.impvehicular = impvehicular;
	}

	/**
	 * @return the detallerequest
	 */
	public DetalleVehiculosRequest getDetallerequest()
	{
		return detallerequest;
	}

	/**
	 * @param detallerequest
	 *           the detallerequest to set
	 */
	public void setDetallerequest(final DetalleVehiculosRequest detallerequest)
	{
		this.detallerequest = detallerequest;
	}

	/**
	 * @return the detalle
	 */
	public DetalleVehiculosResponse getDetalle()
	{
		return detalle;
	}

	/**
	 * @param detalle
	 *           the detalle to set
	 */
	public void setDetalle(final DetalleVehiculosResponse detalle)
	{
		this.detalle = detalle;
	}

	/**
	 * @return the bpNum
	 */
	public String getBpNum()
	{
		return bpNum;
	}

	/**
	 * @param bpNum
	 *           the bpNum to set
	 */
	public void setBpNum(final String bpNum)
	{
		this.bpNum = bpNum;
	}

	/**
	 * @return the placa
	 */
	public String getPlaca()
	{
		return placa;
	}

	/**
	 * @param placa
	 *           the placa to set
	 */
	public void setPlaca(final String placa)
	{
		this.placa = placa;
	}

	/**
	 * @return the anioGravable
	 */
	public String getAnioGravable()
	{
		return anioGravable;
	}

	/**
	 * @param anioGravable
	 *           the anioGravable to set
	 */
	public void setAnioGravable(final String anioGravable)
	{
		this.anioGravable = anioGravable;
	}



}
