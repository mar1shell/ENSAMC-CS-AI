package Composite;

public class Dot implements Graphic {
    private int x;
    private int y;

    public Dot(int x, int y) {
        this.x = x;
        this.y = y;
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    @Override
    public void draw() {
        System.out.println("Drawing Dot at (" + x + ", " + y + ")");
    }

    @Override
    public void move(int x, int y) {
        this.x += x;
        this.y += y;
        System.out.println("Moved Dot to (" + this.x + ", " + this.y + ")");
    }
    
}
