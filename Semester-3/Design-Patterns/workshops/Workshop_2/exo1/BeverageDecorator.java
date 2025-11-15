package workshops.Workshop_2.exo1;

public abstract class BeverageDecorator implements Beverage {
    protected Beverage decoratedBeverage;

    public BeverageDecorator(Beverage decoratedBeverage) {
        this.decoratedBeverage = decoratedBeverage;
    }

    @Override
    public abstract String getDescription(); 

    @Override
    public abstract double getCost();
}
