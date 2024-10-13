package com.github.arseeenyyy.util;

public class Checker {
    public static boolean isHit(int x, float y, int r) {
        return inTriangle(x, y, r) && inSquare(x, y, r) && inCircle(x, y, r);
    }

    public static boolean inTriangle(int x, float y, int r) {
        return x <= 0 && y <= 0 && y >= x - r && -x <= r && -y <= r;
    }
    public static boolean inSquare(int x, float y, int r) {
        return x <= 0 && y >= 0 && -x <= r && y <= r;
    }
    public static boolean inCircle(int x, float y, int r) {
        return x >= 0 && y <= 0 && x <= r && -y <= r && (Math.pow(x, 2) + Math.pow(y, 2) <= Math.pow(r, 2));
    }
}
