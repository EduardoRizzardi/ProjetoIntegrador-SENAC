/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import model.Cliente;

/**
 *
 * @author felip
 */
public class CliController {
    public void Incluir(String cpf, String nome, String senha, String email, String telefone, String dataNasc, String endereco, String numEndereco, String bairro, String cidade, String complemento, String unidade_federativa) {
        
        if(!cpf.equals("") && !nome.equals("") && !senha.equals("") && !email.equals("") && !telefone.equals("") && !dataNasc.equals(0.00) && !endereco.equals("") && !numEndereco.equals("") && !bairro.equals("") && !cidade.equals("") && !complemento.equals("") && !unidade_federativa.equals(""))
        {
            Cliente cli = new Cliente(cpf, nome, senha, email, telefone, dataNasc, endereco, numEndereco, bairro, cidade, complemento, unidade_federativa);
            System.out.println(cli);
            cli.incluir(cli);
        }
    }
    
    public void Deletar(String cpf){
        Cliente cli = new Cliente(cpf);
        cli.deletar(cli);
    }
    
    public void Editar(String cpf, String nome, String senha, String email, String telefone, String dataNasc, String endereco, String numEndereco, String bairro, String cidade, String complemento, String unidade_federativa){
        if(!nome.equals("") && !senha.equals("") && !email.equals("") && !telefone.equals("") && !dataNasc.equals(0.00) && !endereco.equals("") && !numEndereco.equals("") && !bairro.equals("") && !cidade.equals("") && !complemento.equals("") && !unidade_federativa.equals(""))
        {
            Cliente cli = new Cliente(cpf, nome, senha, email, telefone, dataNasc, endereco, numEndereco, bairro, cidade, complemento, unidade_federativa);
            cli.editar(cli);
        }
    }
}
