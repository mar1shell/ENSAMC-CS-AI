package Strategy;

public class Main {
    public static void main(String[] args) {
        IPayStrategy paypalStrategy = new PayByPayPalStrategy();
        IPayStrategy creditCardStrategy = new PayByCreditCardStrategy();

        Order order = new Order();

        order.setStrategy(creditCardStrategy);
        order.collectPayment();

        order.setStrategy(paypalStrategy);
        order.collectPayment();
    }
}
