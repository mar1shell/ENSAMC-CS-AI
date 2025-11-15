package Factory;

public class Main {
    public static void main(String[] args) {
        PizzaFactory napoliFactory = new NapoliFactory();
        IPizza pizza1 = napoliFactory.createPizza("Fromage");
        pizza1.prepare();
        pizza1.bake();
        pizza1.cut();
        pizza1.box();

        PizzaFactory casaFactory = new CasaFactory();
        IPizza pizza2 = casaFactory.createPizza("SeaFood");
        pizza2.prepare();
        pizza2.bake();
        pizza2.cut();
        pizza2.box();
    }
}
