package Strategy;

public class PayByCreditCardStrategy implements IPayStrategy{

    @Override
    public void collectPayment() {
        System.out.println("Paying by Credit Card");
    }

    @Override
    public boolean pay(int paymentAmount) {
        return true;
    }
}