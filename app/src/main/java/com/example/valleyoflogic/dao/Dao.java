package com.example.valleyoflogic.dao;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

import com.example.valleyoflogic.model.Usuario;
import com.example.valleyoflogic.utill.ConnectionFactory;

import java.util.ArrayList;
import java.util.List;

public class Dao {
    private ConnectionFactory conexao;
    private SQLiteDatabase banco;

    public Dao(Context context)
    {

        conexao = new ConnectionFactory(context);
        banco = conexao.getWritableDatabase();
    }

    public long salvar(Usuario usuario)
    {
        ContentValues values = new ContentValues();
        values.put("nome", usuario.getNome());
        values.put("idade", usuario.getIdade());

        return (banco.insert("aluno",null,values));
    }



    }


