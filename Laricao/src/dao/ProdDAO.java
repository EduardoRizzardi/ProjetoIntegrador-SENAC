/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import javax.swing.JOptionPane;
import model.Produtos;

/**
 *
 * @author 182220040
 */
public class ProdDAO {
    public void Incluir(Produtos prod) {
        String sql =  "INSERT INTO produto (nome, disponivel, valor_unitario, tipo, descricao) VALUES ( "
            + " '" + prod.getNome() + "' , "
            + " " + prod.isDisponibilidade() + " , "
            + " " + prod.getValor_unitario()+ " , "
            + " '" + prod.getTipo() + "' , "
            + " '" + prod.getDescricao() + "' )";
        System.out.println(sql);
        Connection.executar( sql );
        JOptionPane.showMessageDialog(null, "Registro incluido com sucesso!!!");
    }
}
