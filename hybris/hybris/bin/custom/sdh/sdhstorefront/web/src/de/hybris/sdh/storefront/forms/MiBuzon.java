/**
 *
 */
package de.hybris.sdh.storefront.forms;

import de.hybris.sdh.core.pojos.responses.BuzonDocumentos;
import de.hybris.sdh.core.pojos.responses.BuzonErrores;
import de.hybris.sdh.core.pojos.responses.BuzonMensajes;
import de.hybris.sdh.core.pojos.responses.BuzonMensajes2;

import java.util.List;


/**
 * @author Consultor
 *
 */
public class MiBuzon
{


	private String bPredial;
	private String bVehicular;
	private String bIca;
	private String bPublicidadExt;
	private String bSobreGasolina;
	private String bDelineacionUrbana;


	private String idRadicado;
	private String autoridadEmisora;
	private String tipoMensaje;
	private String fechaNotificacion;
	private String asunto;
	private String checkBoxLectura;
	private List<BuzonDocumentos> documentos;
	private List<BuzonErrores> errores;

	private String numBP;
	private String vigencia;
	private String checkLectura;

	private int contMsj;
	private int contNot;
	private String pdfimprimir;

	private BuzonMensajes mensajes;

	private List<BuzonMensajes2> mensajesMsg;

	private int buzActivo;



	/**
	 * @return the pdfimprimir
	 */
	public String getPdfimprimir()
	{
		return pdfimprimir;
	}

	/**
	 * @param pdfimprimir
	 *           the pdfimprimir to set
	 */
	public void setPdfimprimir(final String pdfimprimir)
	{
		this.pdfimprimir = pdfimprimir;
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
	 * @return the idRadicado
	 */
	public String getIdRadicado()
	{
		return idRadicado;
	}

	/**
	 * @param idRadicado
	 *           the idRadicado to set
	 */
	public void setIdRadicado(final String idRadicado)
	{
		this.idRadicado = idRadicado;
	}

	/**
	 * @return the autoridadEmisora
	 */
	public String getAutoridadEmisora()
	{
		return autoridadEmisora;
	}

	/**
	 * @param autoridadEmisora
	 *           the autoridadEmisora to set
	 */
	public void setAutoridadEmisora(final String autoridadEmisora)
	{
		this.autoridadEmisora = autoridadEmisora;
	}

	/**
	 * @return the tipoMensaje
	 */
	public String getTipoMensaje()
	{
		return tipoMensaje;
	}

	/**
	 * @param tipoMensaje
	 *           the tipoMensaje to set
	 */
	public void setTipoMensaje(final String tipoMensaje)
	{
		this.tipoMensaje = tipoMensaje;
	}

	/**
	 * @return the fechaNotificacion
	 */
	public String getFechaNotificacion()
	{
		return fechaNotificacion;
	}

	/**
	 * @param fechaNotificacion
	 *           the fechaNotificacion to set
	 */
	public void setFechaNotificacion(final String fechaNotificacion)
	{
		this.fechaNotificacion = fechaNotificacion;
	}

	/**
	 * @return the asunto
	 */
	public String getAsunto()
	{
		return asunto;
	}

	/**
	 * @param asunto
	 *           the asunto to set
	 */
	public void setAsunto(final String asunto)
	{
		this.asunto = asunto;
	}

	/**
	 * @return the checkBoxLectura
	 */
	public String getCheckBoxLectura()
	{
		return checkBoxLectura;
	}

	/**
	 * @param checkBoxLectura
	 *           the checkBoxLectura to set
	 */
	public void setCheckBoxLectura(final String checkBoxLectura)
	{
		this.checkBoxLectura = checkBoxLectura;
	}

	/**
	 * @return the documentos
	 */
	public List<BuzonDocumentos> getDocumentos()
	{
		return documentos;
	}

	/**
	 * @param documentos
	 *           the documentos to set
	 */
	public void setDocumentos(final List<BuzonDocumentos> documentos)
	{
		this.documentos = documentos;
	}

	/**
	 * @return the errores
	 */
	public List<BuzonErrores> getErrores()
	{
		return errores;
	}

	/**
	 * @param errores
	 *           the errores to set
	 */
	public void setErrores(final List<BuzonErrores> errores)
	{
		this.errores = errores;
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
	 * @return the vigencia
	 */
	public String getVigencia()
	{
		return vigencia;
	}

	/**
	 * @param vigencia
	 *           the vigencia to set
	 */
	public void setVigencia(final String vigencia)
	{
		this.vigencia = vigencia;
	}

	/**
	 * @return the checkLectura
	 */
	public String getCheckLectura()
	{
		return checkLectura;
	}

	/**
	 * @param checkLectura
	 *           the checkLectura to set
	 */
	public void setCheckLectura(final String checkLectura)
	{
		this.checkLectura = checkLectura;
	}


	/**
	 * @return the contMsj
	 */
	public int getContMsj()
	{
		return contMsj;
	}

	/**
	 * @param contMsj
	 *           the contMsj to set
	 */
	public void setContMsj(final int contMsj)
	{
		this.contMsj = contMsj;
	}

	/**
	 * @return the contNot
	 */
	public int getContNot()
	{
		return contNot;
	}

	/**
	 * @param contNot
	 *           the contNot to set
	 */
	public void setContNot(final int contNot)
	{
		this.contNot = contNot;
	}

	/**
	 * @return the mensajes
	 */
	public BuzonMensajes getMensajes()
	{
		return mensajes;
	}

	/**
	 * @param mensajes
	 *           the mensajes to set
	 */
	public void setMensajes(final BuzonMensajes mensajes)
	{
		this.mensajes = mensajes;
	}

	/**
	 * @return the mensajesMsg
	 */
	public List<BuzonMensajes2> getMensajesMsg()
	{
		return mensajesMsg;
	}

	/**
	 * @param mensajesMsg
	 *           the mensajesMsg to set
	 */
	public void setMensajesMsg(final List<BuzonMensajes2> mensajesMsg)
	{
		this.mensajesMsg = mensajesMsg;
	}

	/**
	 * @return the buzActivo
	 */
	public int getBuzActivo()
	{
		return buzActivo;
	}

	/**
	 * @param buzActivo
	 *           the buzActivo to set
	 */
	public void setBuzActivo(final int buzActivo)
	{
		this.buzActivo = buzActivo;
	}


	//*->FIN dev-eduardo ajuste de menu impuestos

}
