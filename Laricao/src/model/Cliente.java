/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dao.ClienteDAO;

/**
 *
 * @author felip
 */
public class Cliente {
    private String cpf;
    private String nome;
    private String senha;
    private String email;
    private String telefone;
    private String dataNasc;
    private String endereco;
    private String numEndereco;
    private String bairro;
    private String cidade;
    private String complemento;
    private String unidade_federativa;

    public Cliente(String cpf, String nome, String senha, String email, String telefone, String dataNasc, String endereco, String numEndereco, String bairro, String cidade, String complemento, String unidade_federativa) {
        this.cpf = cpf;
        this.nome = nome;
        this.senha = senha;
        this.email = email;
        this.telefone = telefone;
        this.dataNasc = dataNasc;
        this.endereco = endereco;
        this.numEndereco = numEndereco;
        this.bairro = bairro;
        this.cidade = cidade;
        this.complemento = complemento;
        this.unidade_federativa = unidade_federativa;
    }

    public Cliente(String cpf) {
        this.cpf = cpf;
    }

    public Cliente() {
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getDataNasc() {
        return dataNasc;
    }

    public void setDataNasc(String dataNasc) {
        this.dataNasc = dataNasc;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getNumEndereco() {
        return numEndereco;
    }

    public void setNumEndereco(String numEndereco) {
        this.numEndereco = numEndereco;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getUnidade_federativa() {
        return unidade_federativa;
    }

    public void setUnidade_federativa(String unidade_federativa) {
        this.unidade_federativa = unidade_federativa;
    }
    
    public void incluir(Cliente cli) {
        ClienteDAO cliDAO = new ClienteDAO();System.out.println(cli);
        cliDAO.incluir(cli);
    }
        
    public void deletar(Cliente cli) {
        ClienteDAO cliDAO = new ClienteDAO();
        cliDAO.deletar(cli);
    }
    
    public void editar(Cliente cli) {
        ClienteDAO cliDAO = new ClienteDAO();
        cliDAO.editar(cli);
    }
}
