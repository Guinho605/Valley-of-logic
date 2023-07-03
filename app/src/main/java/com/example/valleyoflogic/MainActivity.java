package com.example.valleyoflogic;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.example.valleyoflogic.dao.Dao;
import com.example.valleyoflogic.model.Usuario;

import java.sql.SQLException;


public class MainActivity extends AppCompatActivity {

    public EditText edtNome, edtIdade;
    public Button btnIniciar, btnContinue;

    private Dao dao;
    private Usuario usuario;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        edtNome = findViewById(R.id.txtNome);
        edtIdade = findViewById(R.id.txtIdade);
        btnIniciar = findViewById(R.id.btnIniciar);
        btnContinue = findViewById(R.id.btnContinue);

        dao = new Dao(this);

    }
    public void limpaEditText() {
        edtNome.setText(null);
        edtIdade.setText(null);
    }

    public void salvar(View view) throws SQLException {
        Usuario u = new Usuario();
        u.setNome(edtNome.getText().toString());
        u.setIdade(Integer.valueOf(edtIdade.getText().toString()));
        dao = new Dao(this);
        long id = dao.salvar(u);
        limpaEditText();
        //Intent intent = new Intent(getApplicationContext(), MainActivity2.class);
        //intent.putExtra("nome", usuario.getNome());
       // startActivity(intent);
    }
}