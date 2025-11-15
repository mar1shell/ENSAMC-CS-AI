package ChainOfResponsibility;

public class StockHandler implements Handler {
    private Handler nextHandler;
    private int stockAvailable = 10;

    @Override
    public void setNext(Handler handler) {
        this.nextHandler = handler;
    }

    @Override
    public void handleRequest(Request request) {
        if (request.getType() == ETypes.BUY) {

            if (stockAvailable > 0 && request.getAmount() <= stockAvailable) {
                System.out.println("StockHandler: Stock available.");
                
                stockAvailable -= request.getAmount();

                if (nextHandler != null) {
                    nextHandler.handleRequest(request);
                }
            } else {
                System.out.println("StockHandler: Stock unavailable.");
            }
        
        }
    }
    
}
