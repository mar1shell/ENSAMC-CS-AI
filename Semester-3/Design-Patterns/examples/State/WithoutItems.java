package State;

public class WithoutItems implements IState {
    private VendingMachine vendingMachine;

    public WithoutItems(VendingMachine vendingMachine) {
        this.vendingMachine = vendingMachine;
    }

    @Override
    public void insertCoin() {
        System.out.println("Machine is out of items. Cannot insert coin.");
    }

    @Override
    public void refill(int itemsCount) {
        System.out.println("Refilling the machine...");
        vendingMachine.addItems(itemsCount);
        vendingMachine.setState(new WithoutCoin(vendingMachine));
    }

    @Override
    public void turnHandle() {
        System.out.println("Machine is out of items. Cannot turn handle.");
    }

    @Override
    public void dispense() {
        System.out.println("Machine is out of items. Cannot dispense.");
    }
    
}
