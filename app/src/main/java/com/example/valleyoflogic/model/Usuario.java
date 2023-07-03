package com.example.valleyoflogic.model;

public class Usuario {

    private Integer id;
    private String nome;
    private Integer idade;

    public Usuario() {
        this.id = id;
        this.nome = nome;
        this.idade = idade;
    }

    public Usuario(String string, int anInt) {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Integer getIdade() {
        return idade;
    }

    public void setIdade(Integer idade) {
        this.idade = idade;
    }
}
