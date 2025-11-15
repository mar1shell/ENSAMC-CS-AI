package Factory;

public class PizzaSeaFood implements IPizza {
    @Override
    public void prepare() {
        System.out.println("Preparing SeaFood Pizza with shrimp, calamari, and garlic sauce.");
    }

    @Override
    public void bake() {
        System.out.println("Baking SeaFood Pizza at 200°C for 20 minutes.");
    }

    @Override
    public void cut() {
        System.out.println("Cutting SeaFood Pizza into 8 slices.");
    }

    @Override
    public void box() {
        System.out.println("Boxing SeaFood Pizza in a seafood-themed pizza box.");
    }
    
}
