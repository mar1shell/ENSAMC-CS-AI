package ChainOfResponsibility;

import java.util.Map;

public class AuthenticationHandler implements Handler {
    private Handler nextHandler;

    private final Map<String, String> validUsers = Map.of(
        "user1", "password1",
        "admin", "adminpass"
    );

    @Override
    public void setNext(Handler handler) {
        this.nextHandler = handler;
    }

    private boolean isAuthenticated(Request request) {
        String validPassword = validUsers.get(request.getUsername());
        return validPassword != null && validPassword.equals(request.getPassword());
    }

    @Override
    public void handleRequest(Request request) {
        if (isAuthenticated(request)) {
            System.out.println("Authentication successful for user: " + request.getUsername());
            if (nextHandler != null) {
                nextHandler.handleRequest(request);
            }
        } else {
            System.out.println("Authentication failed for user: " + request.getUsername());
        }
    }
    
}
