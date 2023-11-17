/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;
import java.util.ArrayList;

/**
 *
 * @author 182220040
 */
public class Pedidos {
    private Date data;
    private Date hora;
    private String observacoes;
    private int valor_total;
    private ArrayList<Produtos> listaProdutos = new ArrayList<>();
    private int tipoPagamento;

    public int getTipoPagamento() {
        return tipoPagamento;
    }

    public void setTipoPagamento(int tipoPagamento) {
        this.tipoPagamento = tipoPagamento;
    }
    
    public void incluirProdutos(Produtos prod){
        this.listaProdutos.add(prod);
    }
    
    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Date getHora() {
        return hora;
    }

    public void setHora(Date hora) {
        this.hora = hora;
    }

    public String getObservacoes() {
        return observacoes;
    }

    public void setObservacoes(String observacoes) {
        this.observacoes = observacoes;
    }

    public int getValor_total() {
        return valor_total;
    }

    public void setValor_total(int valor_total) {
        this.valor_total = valor_total;
    }
    
    public void imprimirPedido(){
        System.out.println(this.getData());
        System.out.println(this.getHora());
        System.out.println(this.getObservacoes());
        System.out.println(this.getValor_total());
        for (Produtos produto_para_imprimir : listaProdutos) {
            System.out.println(": "+produto_para_imprimir.getNome());
        }
               
    }
    
    
}
