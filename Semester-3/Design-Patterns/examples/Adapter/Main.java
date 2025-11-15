package Adapter;

public class Main {
    public static void main(String[] args) {
        
        Shape rectangle = new Adapter(10, 20, 30, 40);
        rectangle.draw();
    }
}
