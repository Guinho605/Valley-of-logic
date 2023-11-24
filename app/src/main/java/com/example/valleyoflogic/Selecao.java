package com.example.valleyoflogic;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Toast;

public class Selecao extends AppCompatActivity {
    private LoginManager loginManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // Esconder a barra de navegação e a barra de status
        // sempre colocar no super
        hideSystemUI();
        // Esconder a titlebar
        setContentView(R.layout.activity_selecao);
        getSupportActionBar().hide();
        loginManager = new LoginManager(this);

        // colocar depois de "puxar" as variaveis
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

    public void realizarLogout(View view) {
        loginManager.setLoggedIn(false); // Define o usuário como deslogado
        Toast.makeText(this, "Usuário deslogado", Toast.LENGTH_SHORT).show();
        // Redireciona para a tela de login, por exemplo
        Intent intent = new Intent(this, TelaPrincipal.class);
        startActivity(intent);
        finish(); // Finaliza a atividade atual para evitar voltar à tela de logout
    }

    // resto do codigo vem em baixo
}