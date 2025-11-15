package workshops.Workshop_2.exo1;

public class Coffee implements Beverage {
    private String description;
    private double cost;

    public Coffee(String description, double cost) {
        this.description = description;
        this.cost = cost;
    }

    @Override
    public String getDescription() {
        return description;
    }

    @Override
    public double getCost() {
        return cost;
    }
    
}
