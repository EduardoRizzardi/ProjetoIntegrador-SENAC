/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package laricao.src;

import java.util.Date;

/**
 *
 * @author 182220040
 */
public class  Cartao extends FormasDePagamento {
    private String nome_titular;
    private int codigo_seguranca;
    private String numero_cartao;          
    private Date validade;

    public String getNome_titular() {
        return nome_titular;
    }

    public void setNome_titular(String nome_titular) {
        this.nome_titular = nome_titular;
    }

    public int getCodigo_seguranca() {
        return codigo_seguranca;
    }

    public void setCodigo_seguranca(int codigo_seguranca) {
        this.codigo_seguranca = codigo_seguranca;
    }

    public String getNumero_cartao() {
        return numero_cartao;
    }

    public void setNumero_cartao(String numero_cartao) {
        this.numero_cartao = numero_cartao;
    }

    public Date getValidade() {
        return validade;
    }

    public void setValidade(Date validade) {
        this.validade = validade;
    }
    
    
}
