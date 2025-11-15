package Factory;

public class NapoliFactory implements PizzaFactory {
    @Override
    public IPizza createPizza(String type) {
        System.out.println("Creating pizza of type: " + type + " in NapoliFactory");

        if (type.equalsIgnoreCase("Fromage")) {
            return new PizzaFromage();
        } else if (type.equalsIgnoreCase("SeaFood")) {
            return new PizzaSeaFood();
        } else if (type.equalsIgnoreCase("Napolitaine")) {
            return new PizzaNapolitane();
        }

        return null;    
    }
}
