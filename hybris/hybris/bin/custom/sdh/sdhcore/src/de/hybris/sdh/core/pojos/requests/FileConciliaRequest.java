package de.hybris.sdh.core.pojos.requests;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class FileConciliaRequest {
    private String  idBanco;
    private String  tipoFile;
    private String  fileName;
    private String  fchRecep;
    private String  horRecep;
    private String  flag;
    private String  rutaarchivo;
    //private String registros;

    public FileConciliaRequest(){

    }

    public FileConciliaRequest(String idBanco, String tipoFile, String fileName, String flag, String rutaarchivo) {
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formatDateTime = now.format(formatter);

        this.idBanco = idBanco;
        this.tipoFile = tipoFile;
        this.fileName = fileName;
        this.fchRecep = formatDateTime.split(" ")[0];
        this.horRecep = formatDateTime.split(" ")[1];;
        this.flag = flag;
        this.rutaarchivo = rutaarchivo;
    }

    public String getIdBanco() {
        return idBanco;
    }

    public void setIdBanco(String idBanco) {
        this.idBanco = idBanco;
    }

    public String getTipoFile() {
        return tipoFile;
    }

    public void setTipoFile(String tipoFile) {
        this.tipoFile = tipoFile;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFchRecep() {
        return fchRecep;
    }

    public void setFchRecep(String fchRecep) {
        this.fchRecep = fchRecep;
    }

    public String getHorRecep() {
        return horRecep;
    }

    public void setHorRecep(String horRecep) {
        this.horRecep = horRecep;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getRutaarchivo() {
        return rutaarchivo;
    }

    public void setRutaarchivo(String rutaarchivo) {
        this.rutaarchivo = rutaarchivo;
    }

    @Override
    public String toString() {
        return "FileConciliaRequest{" +
                "idBanco='" + idBanco + '\'' +
                ", tipoFile='" + tipoFile + '\'' +
                ", fileName='" + fileName + '\'' +
                ", fchRecep='" + fchRecep + '\'' +
                ", horRecep='" + horRecep + '\'' +
                ", flag='" + flag + '\'' +
                ", rutaarchivo='" + rutaarchivo + '\'' +
                '}';
    }
}