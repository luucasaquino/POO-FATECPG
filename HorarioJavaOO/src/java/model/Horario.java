/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Calendar;

/**
 *
 * @author root
 */
public class Horario {
    
    private int horas;
    private int minutos;
    private int segundos;

    /**
     * Construtor para inicializar o horarário como 00:00:00
     */
    public Horario(){
        this.horas = 0;
        this.minutos = 0;
        this.segundos = 0;
    }
    /**
     * Construtor parametrizado com horas, minutos e segundos
     * @param horas
     * @param minutos
     * @param segundos 
     */
    public Horario(int horas, int minutos, int segundos) {
        setHorario(horas, minutos, segundos);
    }
    /**
     * Método parametrizado para definir os valores das variáveis
     * @param horas
     * @param minutos
     * @param segundos 
     */
    private void setHorario(int horas, int minutos, int segundos) {
        this.setHoras(horas);
        this.setMinutos(minutos);
        this.setSegundos(segundos);
    }
    /**
     * Método para obter os segundos
     * @return segundos
     */
    public int getSegundos(){
        return segundos;
    }

     /**
      * Método para definir os valores de segundos
      * @param segundos 
      */
    public void setSegundos(int segundos) {
        if(segundos < 0) this.segundos = 0;
        else if(segundos > 59) this.segundos = 59;
        else this.segundos = segundos;
    }

    /**
     * Método para obter o valor de horas
     * @return horas
     */
    public int getHoras() {
        return horas;
    }

    /**
     * Método para defnir o valor de horas
     * @param horas 
     */
    public void setHoras(int horas) {
        if(horas < 0) this.horas = 0;
        else if(horas > 23) this.horas = 23;
        else this.horas = horas;
    }

    /**
     * Méotodo para obter o valor de minutos
     * @return minutos
     */
    public int getMinutos() {
        return minutos;
    }

    /**
     * Método para definir o valor de minutos
     * @param minutos 
     */
    public void setMinutos(int minutos) {
        if(minutos < 0) this.minutos = 0;
        else if(minutos > 59) this.minutos = 59;
        else this.minutos = minutos;
    }
    
    /**
     * Método para obter o horário formatado
     * @return horario
     */
    public String getHorario(){
        String horario = "";
        if(this.horas < 10) horario +="0";
        horario += this.horas + ":";
        if(this.minutos < 10) horario += "0";
        horario += this.minutos + ":";
        if(this.segundos < 10) horario += "0";
        horario += this.segundos;
        
        return horario;
    }
    
    
}
