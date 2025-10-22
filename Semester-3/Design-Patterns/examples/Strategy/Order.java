package Strategy;

public class Order {
    private IPayStrategy strategy;

    public Order() {
        this.strategy = null;
    }

    public Order(IPayStrategy strategy) {
        this.strategy = strategy;
    }

    public void setStrategy(IPayStrategy strategy) {
        this.strategy = strategy;
    }

    public void collectPayment() {
        strategy.collectPayment();
    }

    public boolean pay(int paymentAmount) {
        return strategy.pay(paymentAmount);
    }
}
