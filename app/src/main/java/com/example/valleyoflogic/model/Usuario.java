package com.example.valleyoflogic.model;

public class Usuario {

    private Integer id;
    private String nome;

    private String apelido;
    private Integer idade;


    public Usuario() {
        this.id = id;
        this.nome = nome;
        this.idade = idade;
        this.apelido = apelido;
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

    public void setIdade(int idade) {
        this.idade = idade;
    }
    public int getIdade() {
        return idade;
    }
    public String getIdadeString() {
        return String.valueOf(idade);
    }
    public String getApelido(){return apelido;}

    public void setApelido(String apelido) {
        this.apelido = apelido;
    }
}
