package State;

public interface IState {
    void insertCoin();
    void refill(int itemsCount);
    void turnHandle();
    void dispense();
}
