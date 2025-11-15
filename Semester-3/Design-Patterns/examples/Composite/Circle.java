package Composite;

public class Circle extends Dot {
    private int radius;

    public Circle(int x, int y, int radius) {
        super(x, y);
        this.radius = radius;
    }

    @Override
    public void draw() {
        System.out.println("Drawing Circle with radius " + radius + " at (" + getX() + ", " + getY() + ")");
    }

    @Override
    public void move(int x, int y) {
        System.out.println("Moved Circle to (" + getX() + ", " + getY() + ")");
    }
    
}
