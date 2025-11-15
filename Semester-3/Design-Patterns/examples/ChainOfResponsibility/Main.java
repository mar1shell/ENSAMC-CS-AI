package ChainOfResponsibility;

public class Main {
    public static void main(String[] args) {
        // Create handlers
        Handler authHandler = new AuthenticationHandler();
        Handler paymentHandler = new PaymentHandler();
        Handler permissionsHandler = new PermissionsHandler();
        Handler stockHandler = new StockHandler();

        // Set up the chain of responsibility
        authHandler.setNext(paymentHandler);
        permissionsHandler.setNext(paymentHandler);
        paymentHandler.setNext(stockHandler);


        // Create a request
        Request request = new Request("user1", "password1", ETypes.BUY, ERole.USER, 5);

        // Start the handling process
        authHandler.handleRequest(request);
    }
}
