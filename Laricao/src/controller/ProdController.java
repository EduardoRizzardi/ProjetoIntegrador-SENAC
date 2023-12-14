/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.Produtos;

/**
 *
 * @author 182220040
 */
public class ProdController {
    public void Incluir(String nome, String descricao, String tipo, Float valor_unitario, String disponibilidade) {
        
        if(!nome.equals("")&&!descricao.equals("")&&!tipo.equals("Selecione")&&!valor_unitario.equals(0.00)&&!disponibilidade.equals(""))
        {
            Produtos prod = new Produtos(nome, valor_unitario, descricao, tipo, disponibilidade);
            prod.incluir(prod);
        }
    }
}
