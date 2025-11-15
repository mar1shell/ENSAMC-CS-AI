package ChainOfResponsibility;

public class PermissionsHandler implements Handler {
    private Handler nextHandler;

    @Override
    public void setNext(Handler handler) {
        this.nextHandler = handler;
    }

    private boolean isAuthorized(Request request) {
        if (request.getType() == ETypes.ADMIN_TOOL) {
            return "admin".equals(request.getUsername());
        }
        
        return true;
    }

    @Override
    public void handleRequest(Request request) {
        if (isAuthorized(request)) {
            System.out.println("Authorization successful for user: " + request.getUsername());
            if (nextHandler != null) {
                nextHandler.handleRequest(request);
            }
        } else {
            System.out.println("Authorization failed for user: " + request.getUsername());
        }
    }
    
}
