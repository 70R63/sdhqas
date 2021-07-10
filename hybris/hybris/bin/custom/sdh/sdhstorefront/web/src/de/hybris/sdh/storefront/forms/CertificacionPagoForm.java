package de.hybris.sdh.storefront.forms;

import de.hybris.sdh.core.pojos.responses.CertificacionRIT;
import de.hybris.sdh.core.pojos.responses.ImpuestoPublicidadExterior;
import de.hybris.sdh.storefront.controllers.pages.InfoDelineacionInput;

import java.util.List;


public class CertificacionPagoForm
{


	private String bPredial;
	private String bVehicular;
	private String bIca;
	private String bPublicidadExt;
	private String bSobreGasolina;
	private String bDelineacionUrbana;


	private String numBP;
	private String tipoCert;
	private String tipoImp;
	private String aniograv;
	private String periodo;
	private String periodoICA;
	private String Idimp;
	private String Idper;
	private String Idanio;

	private List<ImpuestoPublicidadExterior> publicidadExt;
	private String numObjetoSel;

	private String idmsj;
	private String txtmsj;
	private CertificacionRIT rit;

	//Publicidad Data
	private String rowFrompublicidadTable;
	private String ctaContrato;
	private String numObjeto;
	private String clavePeriodo;
	private String referencia;
	private String fechaCompensa;
	private String importe;
	private String moneda;
	private String numfactForm;
	private String numDocPago;
	private String numResolu;
	private String tipoValla;

	//Delineacion Urbana
	private InfoDelineacionInput inputDelineacion;


	/**
	 * @return the numObjetoSel
	 */
	public String getNumObjetoSel()
	{
		return numObjetoSel;
	}

	/**
	 * @param numObjetoSel
	 *           the numObjetoSel to set
	 */
	public void setNumObjetoSel(final String numObjetoSel)
	{
		this.numObjetoSel = numObjetoSel;
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
	 * @return the tipoCert
	 */
	public String getTipoCert()
	{
		return tipoCert;
	}

	/**
	 * @param tipoCert
	 *           the tipoCert to set
	 */
	public void setTipoCert(final String tipoCert)
	{
		this.tipoCert = tipoCert;
	}

	/**
	 * @return the tipoImp
	 */
	public String getTipoImp()
	{
		return tipoImp;
	}

	/**
	 * @param tipoImp
	 *           the tipoImp to set
	 */
	public void setTipoImp(final String tipoImp)
	{
		this.tipoImp = tipoImp;
	}

	/**
	 * @return the aniograv
	 */
	public String getAniograv()
	{
		return aniograv;
	}

	/**
	 * @param aniograv
	 *           the aniograv to set
	 */
	public void setAniograv(final String aniograv)
	{
		this.aniograv = aniograv;
	}

	/**
	 * @return the periodo
	 */
	public String getPeriodo()
	{
		return periodo;
	}

	/**
	 * @param periodo
	 *           the periodo to set
	 */
	public void setPeriodo(final String periodo)
	{
		this.periodo = periodo;
	}

	/**
	 * @return the idmsj
	 */
	public String getIdmsj()
	{
		return idmsj;
	}

	/**
	 * @param idmsj
	 *           the idmsj to set
	 */
	public void setIdmsj(final String idmsj)
	{
		this.idmsj = idmsj;
	}

	/**
	 * @return the txtmsj
	 */
	public String getTxtmsj()
	{
		return txtmsj;
	}

	/**
	 * @param txtmsj
	 *           the txtmsj to set
	 */
	public void setTxtmsj(final String txtmsj)
	{
		this.txtmsj = txtmsj;
	}

	/**
	 * @return the rit
	 */
	public CertificacionRIT getRit()
	{
		return rit;
	}

	/**
	 * @param rit
	 *           the rit to set
	 */
	public void setRit(final CertificacionRIT rit)
	{
		this.rit = rit;
	}

	/**
	 * @return the bPredial
	 */
	public String getbPredial()
	{
		return bPredial;
	}

	/**
	 * @param bPredial
	 *           the bPredial to set
	 */
	public void setbPredial(final String bPredial)
	{
		this.bPredial = bPredial;
	}

	/**
	 * @return the bVehicular
	 */
	public String getbVehicular()
	{
		return bVehicular;
	}

	/**
	 * @param bVehicular
	 *           the bVehicular to set
	 */
	public void setbVehicular(final String bVehicular)
	{
		this.bVehicular = bVehicular;
	}

	/**
	 * @return the bIca
	 */
	public String getbIca()
	{
		return bIca;
	}

	/**
	 * @param bIca
	 *           the bIca to set
	 */
	public void setbIca(final String bIca)
	{
		this.bIca = bIca;
	}

	/**
	 * @return the bPublicidadExt
	 */
	public String getbPublicidadExt()
	{
		return bPublicidadExt;
	}

	/**
	 * @param bPublicidadExt
	 *           the bPublicidadExt to set
	 */
	public void setbPublicidadExt(final String bPublicidadExt)
	{
		this.bPublicidadExt = bPublicidadExt;
	}

	/**
	 * @return the bSobreGasolina
	 */
	public String getbSobreGasolina()
	{
		return bSobreGasolina;
	}

	/**
	 * @param bSobreGasolina
	 *           the bSobreGasolina to set
	 */
	public void setbSobreGasolina(final String bSobreGasolina)
	{
		this.bSobreGasolina = bSobreGasolina;
	}

	/**
	 * @return the bDelineacionUrbana
	 */
	public String getbDelineacionUrbana()
	{
		return bDelineacionUrbana;
	}

	/**
	 * @param bDelineacionUrbana
	 *           the bDelineacionUrbana to set
	 */
	public void setbDelineacionUrbana(final String bDelineacionUrbana)
	{
		this.bDelineacionUrbana = bDelineacionUrbana;
	}

	/**
	 * @return the periodoICA
	 */
	public String getPeriodoICA()
	{
		return periodoICA;
	}

	/**
	 * @param periodoICA
	 *           the periodoICA to set
	 */
	public void setPeriodoICA(final String periodoICA)
	{
		this.periodoICA = periodoICA;
	}

	/**
	 * @return the idimp
	 */
	public String getIdimp()
	{
		return Idimp;
	}

	/**
	 * @param idimp
	 *           the idimp to set
	 */
	public void setIdimp(final String idimp)
	{
		Idimp = idimp;
	}

	/**
	 * @return the idper
	 */
	public String getIdper()
	{
		return Idper;
	}

	/**
	 * @param idper
	 *           the idper to set
	 */
	public void setIdper(final String idper)
	{
		Idper = idper;
	}

	/**
	 * @return the idanio
	 */
	public String getIdanio()
	{
		return Idanio;
	}

	/**
	 * @param idanio
	 *           the idanio to set
	 */
	public void setIdanio(final String idanio)
	{
		Idanio = idanio;
	}

	/**
	 * @return the publicidadExt
	 */
	public List<ImpuestoPublicidadExterior> getPublicidadExt()
	{
		return publicidadExt;
	}

	/**
	 * @param publicidadExt
	 *           the publicidadExt to set
	 */
	public void setPublicidadExt(final List<ImpuestoPublicidadExterior> publicidadExt)
	{
		this.publicidadExt = publicidadExt;
	}

	/**
	 * @return the rowFrompublicidadTable
	 */
	public String getRowFrompublicidadTable()
	{
		return rowFrompublicidadTable;
	}

	/**
	 * @param rowFrompublicidadTable
	 *           the rowFrompublicidadTable to set
	 */
	public void setRowFrompublicidadTable(final String rowFrompublicidadTable)
	{
		this.rowFrompublicidadTable = rowFrompublicidadTable;
	}

	/**
	 * @return the ctaContrato
	 */
	public String getCtaContrato()
	{
		return ctaContrato;
	}

	/**
	 * @param ctaContrato
	 *           the ctaContrato to set
	 */
	public void setCtaContrato(final String ctaContrato)
	{
		this.ctaContrato = ctaContrato;
	}

	/**
	 * @return the numObjeto
	 */
	public String getNumObjeto()
	{
		return numObjeto;
	}

	/**
	 * @param numObjeto
	 *           the numObjeto to set
	 */
	public void setNumObjeto(final String numObjeto)
	{
		this.numObjeto = numObjeto;
	}

	/**
	 * @return the clavePeriodo
	 */
	public String getClavePeriodo()
	{
		return clavePeriodo;
	}

	/**
	 * @param clavePeriodo
	 *           the clavePeriodo to set
	 */
	public void setClavePeriodo(final String clavePeriodo)
	{
		this.clavePeriodo = clavePeriodo;
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

	/**
	 * @return the fechaCompensa
	 */
	public String getFechaCompensa()
	{
		return fechaCompensa;
	}

	/**
	 * @param fechaCompensa
	 *           the fechaCompensa to set
	 */
	public void setFechaCompensa(final String fechaCompensa)
	{
		this.fechaCompensa = fechaCompensa;
	}

	/**
	 * @return the importe
	 */
	public String getImporte()
	{
		return importe;
	}

	/**
	 * @param importe
	 *           the importe to set
	 */
	public void setImporte(final String importe)
	{
		this.importe = importe;
	}

	/**
	 * @return the moneda
	 */
	public String getMoneda()
	{
		return moneda;
	}

	/**
	 * @param moneda
	 *           the moneda to set
	 */
	public void setMoneda(final String moneda)
	{
		this.moneda = moneda;
	}

	/**
	 * @return the numfactForm
	 */
	public String getNumfactForm()
	{
		return numfactForm;
	}

	/**
	 * @param numfactForm
	 *           the numfactForm to set
	 */
	public void setNumfactForm(final String numfactForm)
	{
		this.numfactForm = numfactForm;
	}

	/**
	 * @return the numDocPago
	 */
	public String getNumDocPago()
	{
		return numDocPago;
	}

	/**
	 * @param numDocPago
	 *           the numDocPago to set
	 */
	public void setNumDocPago(final String numDocPago)
	{
		this.numDocPago = numDocPago;
	}

	/**
	 * @return the numResolu
	 */
	public String getNumResolu()
	{
		return numResolu;
	}

	/**
	 * @param numResolu
	 *           the numResolu to set
	 */
	public void setNumResolu(final String numResolu)
	{
		this.numResolu = numResolu;
	}

	/**
	 * @return the tipoValla
	 */
	public String getTipoValla()
	{
		return tipoValla;
	}

	/**
	 * @param tipoValla
	 *           the tipoValla to set
	 */
	public void setTipoValla(final String tipoValla)
	{
		this.tipoValla = tipoValla;
	}

	/**
	 * @return the inputDelineacion
	 */
	public InfoDelineacionInput getInputDelineacion()
	{
		return inputDelineacion;
	}

	/**
	 * @param inputDelineacion
	 *           the inputDelineacion to set
	 */
	public void setInputDelineacion(final InfoDelineacionInput inputDelineacion)
	{
		this.inputDelineacion = inputDelineacion;
	}









}