package com.example.valleyoflogic;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.widget.ProgressBar;

public class MainActivity extends AppCompatActivity {

    private ProgressBar pbLoad;
    private int counter = 0;
    private Handler handler = new Handler(Looper.getMainLooper());

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        getSupportActionBar().hide();

        prog();
    }

    public void prog() {
        pbLoad = findViewById(R.id.pbLoad);

        // Execute a tarefa de carregamento
        new Thread(new Runnable() {
            @Override
            public void run() {
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

                // Após o carregamento, inicie a TelaPrincipal
                handler.post(new Runnable() {
                    @Override
                    public void run() {
                        abrirTelaPrincipal();
                    }
                });
            }
        }).start();
    }

    private void abrirTelaPrincipal() {
        // Use uma intenção para iniciar a TelaPrincipal
        Intent intent = new Intent(this, TelaPrincipal.class);
        startActivity(intent);

        // Finalize a atividade atual (MainActivity) se desejar
        finish();
    }
}
