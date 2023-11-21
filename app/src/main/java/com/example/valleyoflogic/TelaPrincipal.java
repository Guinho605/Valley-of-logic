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
    public Button btnCadastro, btnLogin, btnPop;

    private Dao dao;
    private Usuario usuario;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // Esconder a barra de navegação e a barra de status
        hideSystemUI();
        // Esconder a titlebar
        setContentView(R.layout.activity_telaprincipal);
        getSupportActionBar().hide();
        setContentView(R.layout.activity_telaprincipal);
        btnCadastro = findViewById(R.id.btnCadastro);
        btnLogin = findViewById(R.id.btnLogin);
        btnPop = findViewById(R.id.btnPop);
        dao = new Dao(this);

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
    }

    private void hideSystemUI() {
        View decorView = getWindow().getDecorView();
        int uiOptions = View.SYSTEM_UI_FLAG_HIDE_NAVIGATION | View.SYSTEM_UI_FLAG_FULLSCREEN;
        decorView.setSystemUiVisibility(uiOptions);
    }

    public void cadastrar(View view){
        Intent intent = new Intent(getApplicationContext(), Cadastro.class);
        startActivity(intent);
    }

    public void logar(View view){
        Intent intent = new Intent(getApplicationContext(), Login.class);
        startActivity(intent);
    }

    public void pop(View view){
        Intent intent = new Intent(getApplicationContext(), Popup.class);
        startActivity(intent);
    }
}