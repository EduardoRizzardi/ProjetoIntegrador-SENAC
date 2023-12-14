/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import model.Produtos;

/**
 *
 * @author 182220040
 */
public class ProdDAO {
    public void incluir(Produtos prod) {
        String sql =  "INSERT INTO produto (nome, disponivel, valor_unitario, tipo, descricao) VALUES ( "
            + " '" + prod.getNome() + "' , "
            + " '" + prod.getDisponibilidade() + "' , "
            + " " + prod.getValor_unitario() + " , "
            + " '" + prod.getTipo() + "' , "
            + " '" + prod.getDescricao() + "' )";
        System.out.println(sql);
        Connection.executar( sql );
        JOptionPane.showMessageDialog(null, "Registro incluido com sucesso!!!");
    }
    
    public ArrayList<String> consultar(){
        ArrayList<String> lista = new ArrayList<>();
        String sql = "select * from produto";
        ResultSet rs = Connection.consultar(sql);
        if(rs != null){
            try{
                while(rs.next()){
                    lista.add(rs.getString(1));
                    lista.add(rs.getString(2));
                    lista.add(rs.getString(3));
                    lista.add(rs.getString(4));
                    lista.add(rs.getString(5));
                    lista.add(rs.getString(6));
                }
                rs.close();
            } catch(Exception e){
            }   
        }
        return lista;
    }
    
    public void alterar(){
        String sql = "UPDATE produto SET nome = '" + this.getNome() + "',"
                   + "disponivel = '" + this.getDisponibilidade() + "' ,"
                   + "valor_unitario = '" + this.getValor_unitario()()+ "' ,"
                   + "tipo = '" + this.getTipo()+ "' ,"
                   + "descricao = '" + this.getDescricao()+ "'"
                   + "WHERE id = '" + this.getId() + "'";
        System.out.println(sql);
        Conexao.executar(sql);
    }
}
