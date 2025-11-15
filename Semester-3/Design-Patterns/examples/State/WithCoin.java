package State;

public class WithCoin implements IState {
    private VendingMachine vendingMachine;

    public WithCoin(VendingMachine vendingMachine) {
        this.vendingMachine = vendingMachine;
    }

    @Override
    public void insertCoin() {
        System.out.println("Coin already inserted. Please turn the handle.");
    }

    @Override
    public void refill(int itemsCount) {
        System.out.println("Refilling the machine...");
        vendingMachine.setState(new WithoutCoin(vendingMachine));
    }

    @Override
    public void turnHandle() {
        System.out.println("Handle turned. Dispensing item...");
        vendingMachine.setState(new Distribution(vendingMachine));
    }

    @Override
    public void dispense() {
        System.out.println("Please turn the handle to dispense the item.");
    }
}
