package com.example.valleyoflogic;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.example.valleyoflogic.dao.Dao;

public class Login extends AppCompatActivity {

    public EditText edtNome, edtApelido;

    public Button btnLogar;

    private Dao dao;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        setContentView(R.layout.activity_login);
        getSupportActionBar().hide();
        edtNome = findViewById(R.id.edtNome2);
        edtApelido = findViewById(R.id.edtApelido2);
        btnLogar = findViewById(R.id.btnLogar);
        dao = new Dao(this);

    }
    public void realizarLogin(View view) {
        String nome = edtNome.getText().toString();
        String apelido = edtApelido.getText().toString();

        // Verificar se o nome e apelido estão vazios
        if (nome.isEmpty() || apelido.isEmpty()) {
            Toast.makeText(this, "Por favor, preencha todos os campos", Toast.LENGTH_SHORT).show();
            return;
        }

        // Verificar se as credenciais são válidas usando a classe Dao
        dao = new Dao(this);
        boolean credenciaisValidas = dao.verificarCredenciais(nome, apelido);

        if (credenciaisValidas) {
            // Credenciais válidas, permitir o acesso à próxima tela
            Toast.makeText(this, "Login realizado com sucesso", Toast.LENGTH_SHORT).show();
            Intent intent = new Intent(this, Selecao.class);
            startActivity(intent);
        } else {
            // Credenciais inválidas, exibir mensagem de erro
            Toast.makeText(this, "Credenciais inválidas, tente novamente", Toast.LENGTH_SHORT).show();
        }
    }
}