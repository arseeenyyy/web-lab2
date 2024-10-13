package com.github.arseeenyyy;

public class Point {
    private int x; 
    private float y;
    private int r; 
    private boolean result;
    private long executionTime;
    
    public Point(int x, float y, int r, boolean result, long executionTime) {
        this.x = x;
        this.y = y; 
        this.r = r; 
        this.result = result;
        this.executionTime = executionTime;
    }

    public int getX() {
        return x;
    }
    public float getY() {
        return y;
    }
    public int getR() {
        return r;
    }
    public boolean getResult() {
        return result;
    }
    public long getExecutionTime() {
        return executionTime;
    }
}