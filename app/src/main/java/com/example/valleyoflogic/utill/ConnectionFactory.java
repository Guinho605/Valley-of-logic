package com.example.valleyoflogic.utill;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import androidx.annotation.Nullable;

public class ConnectionFactory extends SQLiteOpenHelper {


    private static final String NAME = "banco.db";
    private static final int VERSION = 1;

    public ConnectionFactory(@Nullable Context context) {
        super(context, NAME, null, VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase bd) {
        bd.execSQL("Create table usuario (id Integer primary key " + "autoincrement, nome varchar(50), idade Integer)");
    }

    @Override
    public void onUpgrade(SQLiteDatabase bd, int i, int i1) {
        String sql = "DROP TABLE IF EXISTS usuario";
        bd.execSQL(sql);
        onCreate(bd);
    }
}

