package model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="tbl_valor")
public class Valor {

    @Id
    private int id;

    private float valor_primeira_hora;
    private float valor_demais_horas;
    private Date data_fim;

    public Valor(int id, float valor_primeira_hora, float valor_demais_horas,Date data_fim){
        this.id = id;
        this.valor_primeira_hora = valor_primeira_hora;
        this.valor_demais_horas = valor_demais_horas;
        this.data_fim = data_fim;
    }
    
     public Valor(){
         this.id = 0;
        this.valor_primeira_hora = 0.00;
        this.valor_demais_horas = 0.00;
        this.data_fim = null;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getValor_primeira_hora() {
        return valor_primeira_hora;
    }

    public void setValor_primeira_hora(float valor_primeira_hora) {
        this.valor_primeira_hora = valor_primeira_hora;
    }

    public float getValor_demais_horas() {
        return valor_demais_horas;
    }

    public void setValor_demais_horas(float valor_demais_horas) {
        this.valor_demais_horas = valor_demais_horas;
    }

    public Date getData_fim() {
        return data_fim;
    }

    public void setData_fim(Date data_fim) {
        this.data_fim = data_fim;
    }
}
