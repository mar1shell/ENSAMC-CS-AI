package ChainOfResponsibility;

public class PaymentHandler implements Handler {
    private Handler nextHandler;

    @Override
    public void setNext(Handler handler) {
        this.nextHandler = handler;
    }

    @Override
    public void handleRequest(Request request) {
        if (request.getType() == ETypes.BUY) {
            System.out.println("PaymentHandler: Payment processed.");
            if (nextHandler != null) {
                nextHandler.handleRequest(request);
            }
        } else {
            System.out.println("PaymentHandler: Payment failed.");
        }
    }
    
}
