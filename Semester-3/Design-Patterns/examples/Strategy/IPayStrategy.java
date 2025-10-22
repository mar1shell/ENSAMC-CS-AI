package Strategy;

public interface IPayStrategy {
    void collectPayment();
    boolean pay(int paymentAmount);
}
