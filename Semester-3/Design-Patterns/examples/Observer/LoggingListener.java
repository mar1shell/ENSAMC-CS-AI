package Observer;

public class LoggingListener implements IEventListener {
    @Override
    public void update(String filename) {
        System.out.println("Logging: File changed: " + filename);
    }
}
