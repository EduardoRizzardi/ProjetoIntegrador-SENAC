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
public class Cidade {
    private String nome;

    public void cidadeCliente(){
        
        System.out.println("Informe o nome da cidade: ");
        String cidade = Input.leiaCadeia();
        this.setNome(cidade);
    }
    
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
    
}
