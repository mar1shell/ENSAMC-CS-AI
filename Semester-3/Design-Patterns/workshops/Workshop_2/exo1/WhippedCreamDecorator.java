package workshops.Workshop_2.exo1;

public class WhippedCreamDecorator extends BeverageDecorator {

    public WhippedCreamDecorator(Beverage decoratedBeverage) {
        super(decoratedBeverage);
    }

    @Override
    public String getDescription() {
        return decoratedBeverage.getDescription() + ", Whipped Cream";
    }

    @Override
    public double getCost() {
        return decoratedBeverage.getCost() + 0.5; 
    }
}
