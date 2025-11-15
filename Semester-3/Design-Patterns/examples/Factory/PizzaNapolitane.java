package Factory;

public class PizzaNapolitane implements IPizza {
    @Override
    public void prepare() {
        System.out.println("Preparing Napolitane Pizza with fresh tomatoes, mozzarella, and basil.");
    }

    @Override
    public void bake() {
        System.out.println("Baking Napolitane Pizza at 485°C for 90 seconds.");
    }

    @Override
    public void cut() {
        System.out.println("Cutting Napolitane Pizza into 6 slices.");
    }

    @Override
    public void box() {
        System.out.println("Boxing Napolitane Pizza in a traditional pizza box.");
    }
    
}
