package Strategy;

public class PayByPayPalStrategy implements IPayStrategy{

    @Override
    public void collectPayment() {
        System.out.println("Paying by PayPal");
    }

    @Override
    public boolean pay(int paymentAmount) {
        return true;
    }
}