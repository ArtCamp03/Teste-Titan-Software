package model;

import javax.persistence.*;

@Entity
@Table(name="tbl_usuario")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String nome;
    private String usuario;
    private int senha;
    
    public Usuario(int id, String nome, String usuario, int senha){
        this.id = id;
        this.nome = nome;
        this.usuario = usuario;
        this.senha = senha;
    }
    
     public Usuario(){
        this.id = 0;
        this.nome = " ";
        this.usuario = " ";
        this.senha = null;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public int getSenha() {
        return senha;
    }

    public void setSenha(int senha) {
        this.senha = senha;
    }
}
