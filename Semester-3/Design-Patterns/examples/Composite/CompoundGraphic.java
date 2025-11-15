package Composite;
import java.util.List;
import java.util.ArrayList;

public class CompoundGraphic implements Graphic {
    private List<Graphic> children = new ArrayList<>();

    public void add(Graphic graphic) {
        children.add(graphic);
    }

    public void remove(Graphic graphic) {
        children.remove(graphic);
    }

    @Override
    public void draw() {
        System.out.println("Drawing CompoundGraphic:");
        for (Graphic child : children) {
            child.draw();
        }
    }

    @Override
    public void move(int x, int y) {
        System.out.println("Moving CompoundGraphic by (" + x + ", " + y + "):");
        
        for (Graphic child : children) {
            child.move(x, y);
        }
    }
    
}
