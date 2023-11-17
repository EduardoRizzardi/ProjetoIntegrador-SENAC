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
public class Endereco {
    private int numero;
    private String nome;
    private String complemento;
    private String logradouro;
    
    public void InformeEndereco(){
        System.out.println("Informe o nome da sua rua: ");
        String nome = Input.leiaCadeia();
        this.setNome(nome);
        
        System.out.println("Informe numero da sua casa: ");
        int numero = Input.leiaInteiro();
        this.setNumero(numero);
        
        System.out.println("Complemento: ");
        String complemento = Input.leiaCadeia();
        this.setComplemento(complemento);
        
        System.out.println("Informe o logradouro:");
        String logradouro = Input.leiaCadeia();
        this.setLogradouro(logradouro);
    }
    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getLogradouro() {
        return logradouro;
    }

    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }
    
}
