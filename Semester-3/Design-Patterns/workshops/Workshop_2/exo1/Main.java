package workshops.Workshop_2.exo1;

public class Main {
    public static void main(String[] args) {
        Beverage beverage = new Coffee("Espresso", 2.0);
        System.out.println(beverage.getDescription() + " -> $" + beverage.getCost());

        beverage = new MilkDecorator(beverage);
        System.out.println(beverage.getDescription() + " -> $" + beverage.getCost());

        beverage = new SugarDecorator(beverage);
        System.out.println(beverage.getDescription() + " -> $" + beverage.getCost());

        beverage = new WhippedCreamDecorator(beverage);
        System.out.println(beverage.getDescription() + " -> $" + beverage.getCost());
    }
}
