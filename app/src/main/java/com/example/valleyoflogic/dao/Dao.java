package com.example.valleyoflogic.dao;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

import com.example.valleyoflogic.model.Usuario;
import com.example.valleyoflogic.utill.ConnectionFactory;

public class Dao {
    private final ConnectionFactory conexao;

    public Dao(Context context)
    {
        conexao = new ConnectionFactory(context);
    }

    public long salvar(Usuario usuario) {
        SQLiteDatabase banco = conexao.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put("nome", usuario.getNome());
        values.put("apelido", usuario.getApelido());
        long id = banco.insert(ConnectionFactory.TABLE_USUARIOS, null, values);
        banco.close();
        return id;
    }
    public boolean verificarCredenciais(String nome, String apelido) {
        SQLiteDatabase bd = conexao.getReadableDatabase();

        // Consulta SQL para verificar as credenciais com base no nome E apelido
        String query = "SELECT * FROM " + ConnectionFactory.TABLE_USUARIOS + " WHERE " +
                ConnectionFactory.COLUMN_NOME + " = ? AND " +
                ConnectionFactory.COLUMN_APELIDO + " = ?";

        // Argumentos da consulta
        String[] args = {nome, apelido};

        // Executa a consulta
        Cursor cursor = bd.rawQuery(query, args);

        // Verifica se a consulta retornou algum resultado
        boolean credenciaisValidas = cursor.moveToFirst();

        // Fecha o cursor e o banco de dados
        cursor.close();
        bd.close();

        return credenciaisValidas;
    }
}
