package State;

public class Distribution implements IState {
    private VendingMachine vendingMachine;

    public Distribution(VendingMachine vendingMachine) {
        this.vendingMachine = vendingMachine;
    }

    @Override
    public void insertCoin() {
        System.out.println("Please wait, dispensing in progress.");
    }

    @Override
    public void refill(int itemsCount) {
        System.out.println("Please wait, dispensing in progress.");
    }

    @Override
    public void turnHandle() {
        System.out.println("Please wait, dispensing in progress.");
    }

    @Override
    public void dispense() {
        System.out.println("Dispensing item...");
        vendingMachine.addItems(-1);
        if (vendingMachine.getItemCount() > 0) {
            System.out.println("Item dispensed. You can insert a new coin.");
            vendingMachine.setState(new WithoutCoin(vendingMachine));
        } else {
            System.out.println("Machine is out of items.");
            vendingMachine.setState(new WithoutItems(vendingMachine));
        }
    }
    
}
