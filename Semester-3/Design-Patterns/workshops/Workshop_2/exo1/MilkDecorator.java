package workshops.Workshop_2.exo1;

public class MilkDecorator extends BeverageDecorator {

    public MilkDecorator(Beverage decoratedBeverage) {
        super(decoratedBeverage);
    }

    @Override
    public String getDescription() {
        return decoratedBeverage.getDescription() + ", Milk";
    }

    @Override
    public double getCost() {
        return decoratedBeverage.getCost() + 0.5;
    }
}