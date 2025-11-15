package State;

public class Main {
    public static void main(String[] args) {
        VendingMachine vendingMachine = new VendingMachine(2);

        vendingMachine.insertCoin();
        vendingMachine.turnHandle();
        vendingMachine.dispense();

        vendingMachine.insertCoin();
        vendingMachine.turnHandle();
        vendingMachine.dispense();

        vendingMachine.insertCoin();
        vendingMachine.refill(3);
    }
}
