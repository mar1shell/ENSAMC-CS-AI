package Factory;

public class PizzaFromage implements IPizza {
    @Override
    public void prepare() {
        System.out.println("Preparing Fromage Pizza with a blend of cheeses.");
    }

    @Override
    public void bake() {
        System.out.println("Baking Fromage Pizza at 220°C for 15 minutes.");
    }

    @Override
    public void cut() {
        System.out.println("Cutting Fromage Pizza into 8 slices.");
    }

    @Override
    public void box() {
        System.out.println("Boxing Fromage Pizza in a standard pizza box.");
    }
    
}
