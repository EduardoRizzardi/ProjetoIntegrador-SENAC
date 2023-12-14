
package model;

import dao.ProdDAO;



public class Produtos {
    private String nome;
    private float valor_unitario;
    private String descricao;          
    private String tipo;          
    private String disponibilidade;
    private String id;

    public Produtos(String nome, float valor_unitario, String descricao, String tipo, String disponibilidade) {
        this.nome = nome;
        this.valor_unitario = valor_unitario;
        this.descricao = descricao;
        this.tipo = tipo;
        this.disponibilidade = disponibilidade;
    }

    public Produtos() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public float getValor_unitario() {
        return valor_unitario;
    }

    public void setValor_unitario(float valor_unitario) {
        this.valor_unitario = valor_unitario;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getDisponibilidade() {
        return disponibilidade;
    }

    public void setDisponibilidade(String disponibilidade) {
        this.disponibilidade = disponibilidade;
    }
    
    public void incluir(Produtos prod) {
        ProdDAO prodDAO = new ProdDAO();
        prodDAO.incluir(prod);
    }
            
}

    
