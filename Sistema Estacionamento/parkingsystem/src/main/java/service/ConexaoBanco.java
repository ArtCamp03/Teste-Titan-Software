package service;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import model.Movimentacao;
import model.Usuario;
import model.Valor;

public class ConexaoBanco {
    public static void main(String[] args) {
        
        // inicializa banco de dados
        Movimentacao moviment = new Movimentacao();
        Usuario user = new Usuario("admin","admin", 123456);
        Valor val = new Valor(1, 6.00, 4.00, null);
        
        // instancia o entityManagerFactory para conexao com o banco e contexto de persistencia
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("sistema");
        EntityManager em = emf.createEntityManager();
        
        // salva no banco
        em.getTransaction().begin();
        em.persist(user);
        em.persist(val);
        em.persist(moviment);
        em.getTransaction().commit();
        System.out.println("Concluido!! ...");
        
        em.clear();
        emf.close();
    }
}
