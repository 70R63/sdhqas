/**
 *
 */
package de.hybris.sdh.core.pojos.responses;

import java.util.List;


/**
 * @author hybris
 *
 */
public class InfoContribResponse
{
	private String numBP;
	private String tipoDoc;
	private String numDoc;
	private String fchExp;
	private String primNom;
	private String segNom;
	private String primApe;
	private String segApe;
	private String departExp;
	private String municipio;

	private ContribAdicionales adicionales;
	private List<ContribDireccion> direccion;
	private List<ContribTelefono> telefono;
	private List<ContribRedSocial> redsocial;

	/**
	 * @return the adicionales
	 */
	public ContribAdicionales getAdicionales()
	{
		return adicionales;
	}

	/**
	 * @param adicionales
	 *           the adicionales to set
	 */
	public void setAdicionales(final ContribAdicionales adicionales)
	{
		this.adicionales = adicionales;
	}

	/**
	 *
	 */
	public InfoContribResponse()
	{
		// XXX Auto-generated constructor stub
	}

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
	 * @return the tipoDoc
	 */
	public String getTipoDoc()
	{
		return tipoDoc;
	}

	/**
	 * @param tipoDoc
	 *           the tipoDoc to set
	 */
	public void setTipoDoc(final String tipoDoc)
	{
		this.tipoDoc = tipoDoc;
	}

	/**
	 * @return the numDoc
	 */
	public String getNumDoc()
	{
		return numDoc;
	}

	/**
	 * @param numDoc
	 *           the numDoc to set
	 */
	public void setNumDoc(final String numDoc)
	{
		this.numDoc = numDoc;
	}

	/**
	 * @return the fchExp
	 */
	public String getFchExp()
	{
		return fchExp;
	}

	/**
	 * @param fchExp
	 *           the fchExp to set
	 */
	public void setFchExp(final String fchExp)
	{
		this.fchExp = fchExp;
	}

	/**
	 * @return the primNom
	 */
	public String getPrimNom()
	{
		return primNom;
	}

	/**
	 * @param primNom
	 *           the primNom to set
	 */
	public void setPrimNom(final String primNom)
	{
		this.primNom = primNom;
	}

	/**
	 * @return the segNom
	 */
	public String getSegNom()
	{
		return segNom;
	}

	/**
	 * @param segNom
	 *           the segNom to set
	 */
	public void setSegNom(final String segNom)
	{
		this.segNom = segNom;
	}

	/**
	 * @return the segApe
	 */
	public String getSegApe()
	{
		return segApe;
	}

	/**
	 * @param segApe
	 *           the segApe to set
	 */
	public void setSegApe(final String segApe)
	{
		this.segApe = segApe;
	}

	/**
	 * @return the departExp
	 */
	public String getDepartExp()
	{
		return departExp;
	}

	/**
	 * @param departExp
	 *           the departExp to set
	 */
	public void setDepartExp(final String departExp)
	{
		this.departExp = departExp;
	}

	/**
	 * @return the municipio
	 */
	public String getMunicipio()
	{
		return municipio;
	}

	/**
	 * @param municipio
	 *           the municipio to set
	 */
	public void setMunicipio(final String municipio)
	{
		this.municipio = municipio;
	}



	/**
	 * @return the direccion
	 */
	public List<ContribDireccion> getDireccion()
	{
		return direccion;
	}

	/**
	 * @param direccion
	 *           the direccion to set
	 */
	public void setDireccion(final List<ContribDireccion> direccion)
	{
		this.direccion = direccion;
	}

	/**
	 * @return the telefono
	 */
	public List<ContribTelefono> getTelefono()
	{
		return telefono;
	}

	/**
	 * @param telefono
	 *           the telefono to set
	 */
	public void setTelefono(final List<ContribTelefono> telefono)
	{
		this.telefono = telefono;
	}

	/**
	 * @return the primApe
	 */
	public String getPrimApe()
	{
		return primApe;
	}

	/**
	 * @param primApe
	 *           the primApe to set
	 */
	public void setPrimApe(final String primApe)
	{
		this.primApe = primApe;
	}

	/**
	 * @return the redsocial
	 */
	public List<ContribRedSocial> getRedsocial()
	{
		return redsocial;
	}

	/**
	 * @param redsocial
	 *           the redsocial to set
	 */
	public void setRedsocial(final List<ContribRedSocial> redsocial)
	{
		this.redsocial = redsocial;
	}



}
