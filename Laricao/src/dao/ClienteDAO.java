/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import model.Cliente;

/**
 *
 * @author felip
 */
public class ClienteDAO {
    public void incluir(Cliente cli) {
        String sql =  "INSERT INTO cliente (cpf, nome, senha, email, telefone, dataNasc, endereco, numEndereco, bairro, cidade, complemento, unidade_federativa) VALUES ( "
            + " '" + cli.getCpf() + "' , "
            + " '" + cli.getNome() + "' , "
            + " '" + cli.getSenha() + "' , "
            + " '" + cli.getEmail() + "' , "
            + " '" + cli.getTelefone() + "' , "
            + " '" + cli.getDataNasc() + "' , "
            + " '" + cli.getEndereco() + "' , "
            + " '" + cli.getNumEndereco() + "' , "
            + " '" + cli.getBairro() + "' , "
            + " '" + cli.getCidade() + "' , "
            + " '" + cli.getComplemento() + "' , "
            + " '" + cli.getUnidade_federativa()+ "' )";
        System.out.println(sql);
        Connection.executar( sql );
        JOptionPane.showMessageDialog(null, "Cadastro realizado com sucesso!");
    }
    
    public ArrayList<String> consultar(){
        ArrayList<String> lista = new ArrayList<>();
        String sql = "select cpf, nome, email, telefone, dataNasc, endereco, numEndereco, cidade, unidade_federativa, bairro, complemento from cliente";
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
                    lista.add(rs.getString(7));
                    lista.add(rs.getString(8));
                    lista.add(rs.getString(9));
                    lista.add(rs.getString(10));
                    lista.add(rs.getString(11));
                }
                rs.close();
            } catch(Exception e){
            }   
        }
        return lista;
    }
    
    public void deletar(Cliente cli){
        String sql = "DELETE FROM cliente WHERE cpf = '" + cli.getCpf() + "'";
        Connection.executar(sql);
    }
    
    public ArrayList<String> consultarParaEditar(Cliente cli){
        ArrayList<String> lista = new ArrayList<>();
        String sql = "select cpf, nome, email, telefone, dataNasc, endereco, numEndereco, cidade, unidade_federativa, bairro, complemento from cliente where cpf = '" + cli.getCpf() + "'";
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
                    lista.add(rs.getString(7));
                    lista.add(rs.getString(8));
                    lista.add(rs.getString(9));
                    lista.add(rs.getString(10));
                    lista.add(rs.getString(11));
                }
                rs.close();
            } catch(Exception e){
            }   
        }
        return lista;
    }
    
    public void editar(Cliente cli) {
        String sql = "UPDATE cliente SET nome = '" + cli.getNome() + "',"
                + "senha = '" + cli.getSenha() + "', "
                + "email = '" + cli.getEmail() + "', "
                + "telefone = '" + cli.getTelefone() + "', "
                + "dataNasc = '" + cli.getDataNasc() + "', "
                + "endereco = '" + cli.getEndereco() + "', "
                + "numEndereco = '" + cli.getNumEndereco() + "', "
                + "bairro = '" + cli.getBairro() + "', "
                + "cidade = '" + cli.getCidade() + "', "
                + "complemento = '" + cli.getComplemento() + "' "
                + "WHERE cpf = '" + cli.getCpf() + "'";
        System.out.println(sql);
        Connection.executar( sql );
        JOptionPane.showMessageDialog(null, "Edição realizada com sucesso!");
    }
}
