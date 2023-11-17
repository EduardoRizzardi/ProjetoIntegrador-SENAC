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
public class Pix extends FormasDePagamento {
    
    private String chave;

    private String getChave() {
        return chave;
    }

    public void setChave(String chave) {
        this.chave = chave;
    }
    public void imprimeChave(){
        System.out.println("Essa é a chave PIX: "+this.getChave());
        
    }
}
