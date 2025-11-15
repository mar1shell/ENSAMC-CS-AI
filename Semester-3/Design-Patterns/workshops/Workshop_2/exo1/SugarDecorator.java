package workshops.Workshop_2.exo1;

public class SugarDecorator extends BeverageDecorator {

    public SugarDecorator(Beverage decoratedBeverage) {
        super(decoratedBeverage);
    }

    @Override
    public String getDescription() {
        return decoratedBeverage.getDescription() + ", Sugar";
    }

    @Override
    public double getCost() {
        return decoratedBeverage.getCost() + 0.2;
    }
    
}
