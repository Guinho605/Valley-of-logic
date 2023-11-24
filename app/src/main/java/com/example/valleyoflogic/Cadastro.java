package com.example.valleyoflogic;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import com.example.valleyoflogic.dao.Dao;
import com.example.valleyoflogic.model.Usuario;
import com.example.valleyoflogic.utill.ConnectionFactory;

import java.sql.SQLException;

public class Cadastro extends AppCompatActivity {
    public EditText edtNome, edtApelido;
    public Spinner Idade;
    private Dao dao;

    private Usuario usuario;

    String[] opcoes = {"04 anos", "05 anos", "06 anos", "07 anos", "08 anos", "09 anos", "+10 anos"};

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // Esconder a barra de navegação e a barra de status
        hideSystemUI();
        // Esconder a titlebar
        setContentView(R.layout.activity_cadastro);
        setContentView(R.layout.activity_cadastro);
        getSupportActionBar().hide();
        edtNome = findViewById(R.id.edtNome);
        edtApelido = findViewById(R.id.edtApelido);
        Idade = findViewById(R.id.spinner);
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(getApplicationContext(), android.R.layout.simple_spinner_dropdown_item, opcoes);
        Idade.setAdapter(adapter);
        Idade.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {

            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {

            }
        });

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

    public void salvar(View view) {
        String nome = edtNome.getText().toString().trim();
        String apelido = edtApelido.getText().toString().trim();
        String selectedAgeString = Idade.getSelectedItem().toString().trim();

        // Verifica se algum campo obrigatório está vazio
        if (nome.isEmpty() || apelido.isEmpty() || selectedAgeString.isEmpty()) {
            Toast.makeText(getApplicationContext(), "Preencha todos os campos", Toast.LENGTH_LONG).show();
            return; // Interrompe a execução do método se algum campo estiver vazio
        }

        // Restante do código...

        try {
            int selectedAge = Integer.parseInt(selectedAgeString.replace(" anos", ""));

            SharedPreferences sharedPreferences = getSharedPreferences("UserPrefs", Context.MODE_PRIVATE);
            SharedPreferences.Editor editor = sharedPreferences.edit();
            editor.putString("nome", nome);
            editor.putString("apelido", apelido);
            editor.putInt("idade", selectedAge);
            editor.apply();

            Usuario novoUsuario = new Usuario();
            novoUsuario.setNome(nome);
            novoUsuario.setApelido(apelido);
            novoUsuario.setIdade(selectedAge);

            dao = new Dao(this);
            long id = dao.salvar(novoUsuario);

            if (id != -1) {
                Toast.makeText(getApplicationContext(), "Usuário inserido com sucesso, ID: " + id, Toast.LENGTH_LONG).show();
                Intent intent = new Intent(getApplicationContext(), Selecao.class);
                startActivity(intent);
            } else {
                Toast.makeText(getApplicationContext(), "Erro ao inserir o usuário", Toast.LENGTH_LONG).show();
                Intent intent = new Intent(getApplicationContext(), Cadastro.class);
                startActivity(intent);
            }

            // Logs para verificar os valores inseridos
            Log.d("DEBUG", "Nome: " + novoUsuario.getNome());
            Log.d("DEBUG", "Apelido: " + novoUsuario.getApelido());
            Log.d("DEBUG", "Idade: " + novoUsuario.getIdade());

            Log.d("DEBUG", "Usuário salvo no banco de dados");

        } catch (NumberFormatException e) {
            // Se ocorrer um erro ao converter a idade para inteiro
            Toast.makeText(getApplicationContext(), "Formato de idade inválido", Toast.LENGTH_LONG).show();
        }


    }

}


