package com.example.valleyoflogic;
import android.content.Context;
import android.content.SharedPreferences;

public class LoginManager {
    private static final String PREF_NAME = "UserPrefs";
    private static final String PREF_IS_LOGGED_IN = "isLoggedIn";

    private SharedPreferences sharedPreferences;
    private Context context;

    public LoginManager(Context context) {
        this.context = context;
        sharedPreferences = context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
    }

    public void setLoggedIn(boolean isLoggedIn) {
        sharedPreferences.edit().putBoolean(PREF_IS_LOGGED_IN, isLoggedIn).apply();
    }

    public boolean isLoggedIn() {
        return sharedPreferences.getBoolean(PREF_IS_LOGGED_IN, false);
    }
}
