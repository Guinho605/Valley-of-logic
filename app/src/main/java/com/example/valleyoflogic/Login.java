package com.example.valleyoflogic;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.example.valleyoflogic.dao.Dao;
import com.example.valleyoflogic.model.Usuario;

public class Login extends AppCompatActivity {

    public EditText edtNome, edtApelido;

    public Button btnLogar;

    private Dao dao;

    private LoginManager loginManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // Esconder a barra de navegação e a barra de status
        hideSystemUI();
        // Esconder a titlebar
        setContentView(R.layout.activity_login);
        setContentView(R.layout.activity_login);
        getSupportActionBar().hide();
        edtNome = findViewById(R.id.edtNome2);
        edtApelido = findViewById(R.id.edtApelido2);
        btnLogar = findViewById(R.id.btnLogar);
        dao = new Dao(this);
        loginManager = new LoginManager(this);

        // Configurar um listener para ocultar novamente as barras de navegação e de status
        View decorView = getWindow().getDecorView();
        decorView.setOnSystemUiVisibilityChangeListener(new View.OnSystemUiVisibilityChangeListener() {
            @Override
            public void onSystemUiVisibilityChange(int visibility) {
                if ((visibility & View.SYSTEM_UI_FLAG_FULLSCREEN) == 0) {
                    // As barras de navegação e de status foram expostas novamente,
                    // portanto, oculte-as novamente.
                    hideSystemUI();
                }
            }
        });

        // Configurar um listener para ocultar as barras ao tocar na tela
        decorView.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                hideSystemUI();
                return false;
            }
        });

    }

    private void hideSystemUI() {
        View decorView = getWindow().getDecorView();
        int uiOptions = View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                | View.SYSTEM_UI_FLAG_FULLSCREEN
                | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY;
        decorView.setSystemUiVisibility(uiOptions);
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
            loginManager.setLoggedIn(true);
            Intent intent = new Intent(this, Selecao.class);
            startActivity(intent);
            finish();
        } else {
            // Credenciais inválidas, exibir mensagem de erro
            Toast.makeText(this, "Credenciais inválidas, tente novamente", Toast.LENGTH_SHORT).show();
        }

    }
}