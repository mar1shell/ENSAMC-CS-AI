package Composite;

public class Main {
    public static void main(String[] args) {
        // Create individual shapes
        Dot dot = new Dot(1, 2);
        Circle circle = new Circle(3, 4, 5);

        // Create a composite shape
        CompoundGraphic compositeShape = new CompoundGraphic();
        compositeShape.add(dot);
        compositeShape.add(circle);

        // Draw all shapes
        System.out.println("Drawing all shapes:");
        compositeShape.draw();

        // Move all shapes
        System.out.println("\nMoving all shapes by (10, 10):");
        compositeShape.move(10, 10);

        // Draw all shapes again to see updated positions
        System.out.println("\nDrawing all shapes after moving:");
        compositeShape.draw();
    }
}
