package model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="tbl_movimentacao")
public class Movimentacao {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String placa;
    private String modelo;
    private Date data_entrada;
    private Date data_saida;
    private float tempo;
    private float valor_pago;

    
    public Movimentacao(int id, String placa, String modelo, Date data_entrada, Date data_saida, float tempo){
        this.id = id;
        this.placa = placa;
        this.modelo = modelo;
        this.data_entrada = data_entrada;
        this.data_saida = data_saida;
        this.tempo = tempo;
    }
    
     public Movimentacao(){
        this.id = 0;
        this.placa = " ";
        this.modelo = " ";
        this.data_entrada = null;
        this.data_saida = null;
        this.tempo = 0;
    }
            
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public Date getData_entrada() {
        return data_entrada;
    }

    public void setData_entrada(Date data_entrada) {
        this.data_entrada = data_entrada;
    }

    public Date getData_saida() {
        return data_saida;
    }

    public void setData_saida(Date data_saida) {
        this.data_saida = data_saida;
    }

    public Date getTempo() {
        return tempo;
    }

    public void setTempo(Date tempo) {
        this.tempo = tempo;
    }

    public float getValor_pago() {
        return valor_pago;
    }

    public void setValor_pago(float valor_pago) {
        this.valor_pago = valor_pago;
    }
}
