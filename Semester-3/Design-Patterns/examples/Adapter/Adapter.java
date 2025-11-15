package Adapter;

public class Adapter implements Shape {
    private LegacyRectangle legacyRectangle;
    private int x1, y1, x2, y2;

    public Adapter(int x1, int y1, int x2, int y2) {
        this.legacyRectangle = new LegacyRectangle();
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;
    }

    @Override
    public void draw() {
        legacyRectangle.display(x1, y1, x2, y2);
    }
    
}
