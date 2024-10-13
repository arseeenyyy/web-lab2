package com.github.arseeenyyy.util;

public class Validator {
    public static boolean validateX(int x) {
        return x >= -5 && x <= 3; 
    }
    public static boolean validateY(float y) {
        return y >= -5 && y <= 5;
    }
    public static boolean validateR(int r) {
        return r >= 1 && r <= 5;
    }
}
