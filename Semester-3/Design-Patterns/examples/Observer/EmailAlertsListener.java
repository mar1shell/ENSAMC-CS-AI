package Observer;

public class EmailAlertsListener implements IEventListener {
    private String email;

    public EmailAlertsListener(String email) {
        this.email = email;
    }

    @Override
    public void update(String filename) {
        System.out.println("Email to " + email + ": Someone has changed the file: " + filename);
    }
    
}
