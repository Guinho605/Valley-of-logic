package com.example.valleyoflogic;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.example.valleyoflogic.dao.Dao;
import com.example.valleyoflogic.model.Usuario;

public class TelaPrincipal extends AppCompatActivity {

    public EditText edtNome, edtIdade;
    public Button btnCadastro, btnLogin;

    private Dao dao;
    private Usuario usuario;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_telaprincipal);
        btnCadastro = findViewById(R.id.btnCadastro);
        btnLogin = findViewById(R.id.btnLogin);
        dao = new Dao(this);
    }

    public void cadastrar(View view){
        Intent intent = new Intent(getApplicationContext(), Cadastro.class);
        startActivity(intent);
    }

    public void logar(View view){
        Intent intent = new Intent(getApplicationContext(), Login.class);
        startActivity(intent);
    }




}