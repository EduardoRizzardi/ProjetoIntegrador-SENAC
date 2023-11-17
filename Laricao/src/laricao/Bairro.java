/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package laricao.src;

/**
 *
 * @author 182220040
 */
public class Bairro {
    private String nome;
    
    public void nomeBairro(){
        System.out.println("Informe o nome do bairro: ");
        String nome = Input.leiaCadeia();
        this.setNome(nome);
    }

        public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
    
       
}

    

   
