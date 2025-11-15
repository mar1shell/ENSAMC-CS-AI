package State;

public class WithoutCoin implements IState {
    private VendingMachine vendingMachine;

    public WithoutCoin(VendingMachine vendingMachine) {
        this.vendingMachine = vendingMachine;
    }

    @Override
    public void insertCoin() {
        System.out.println("Coin inserted. You can now turn the handle.");
        vendingMachine.setState(new WithCoin(vendingMachine));
    }

    @Override
    public void refill(int itemsCount) {
        System.out.println("Refilling the machine...");
        vendingMachine.addItems(itemsCount);
    }

    @Override
    public void turnHandle() {
        System.out.println("Please insert a coin first.");
    }

    @Override
    public void dispense() {
        System.out.println("Please insert a coin first.");
    }
    
}
