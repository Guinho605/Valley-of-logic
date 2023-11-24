package com.example.valleyoflogic;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.MotionEvent;
import android.view.View;
import android.widget.ProgressBar;

public class MainActivity extends AppCompatActivity {

    private ProgressBar pbLoad;
    private int counter = 0;
    private Handler handler = new Handler(Looper.getMainLooper());

    private LoginManager loginManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // Esconder a barra de navegação e a barra de status
        hideSystemUI();
        // Esconder a titlebar
        setContentView(R.layout.activity_main);
        getSupportActionBar().hide();
        loginManager = new LoginManager(this);

        if (loginManager.isLoggedIn()) {
            abrirSelecao();
        } else {
            prog(); // Inicie o progresso apenas se não estiver logado
        }

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

    private void prog() {
        pbLoad = findViewById(R.id.pbLoad);

        // Execute a tarefa de carregamento
        new Thread(new Runnable() {
            @Override
            public void run() {
                // Verificar se o usuário está logado antes de começar o carregamento
                if (loginManager.isLoggedIn()) {
                    abrirSelecao();
                    return;
                }

                while (counter < 100) {
                    counter++;

                    // Atualize a barra de progresso na thread principal usando o Handler
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            pbLoad.setProgress(counter);
                        }
                    });

                    try {
                        Thread.sleep(100); // Ajuste o tempo de acordo com suas necessidades
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }

                // Verificar o login após o carregamento
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        if (loginManager.isLoggedIn()) {
                            abrirSelecao();
                        } else {
                            abrirTelaPrincipal();
                        }
                    }
                });
            }
        }).start();
    }

    private void abrirTelaPrincipal() {
        // Use uma intenção para iniciar a Tela de Login
        Intent intent = new Intent(this, TelaPrincipal.class);
        startActivity(intent);
        finish();
    }

    private void abrirSelecao() {
        // Use uma intenção para iniciar a Tela de Seleção
        Intent intent = new Intent(this, Selecao.class);
        startActivity(intent);
        finish();
    }
}
