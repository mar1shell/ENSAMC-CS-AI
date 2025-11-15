package State;

public class VendingMachine {
    private IState currentState;
    private int itemCount;

    public VendingMachine(int itemCount) {
        this.itemCount = itemCount;
        currentState = new WithoutCoin(this);
    }

    public void setState(IState state) {
        this.currentState = state;
    }

    public void addItems(int itemsCount) {
        this.itemCount += itemsCount;
    }

    public int getItemCount() {
        return itemCount;
    }

    public void insertCoin() {
        currentState.insertCoin();
    }

    public void refill(int itemsCount) {
        currentState.refill(itemsCount);
    }

    public void turnHandle() {
        currentState.turnHandle();
    }

    public void dispense() {
        currentState.dispense();
    }
}
