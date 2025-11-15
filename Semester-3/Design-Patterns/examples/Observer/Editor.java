package Observer;

public class Editor {
    private EventManager eventManager;

    public Editor() {
        this.eventManager = new EventManager();
        this.eventManager.subscribe(EventManager.EventType.OPEN, new LoggingListener());
        this.eventManager.subscribe(EventManager.EventType.SAVE, new EmailAlertsListener("user@example.com"));
    }

    public void openFile(String filename) {
        eventManager.notify(filename, EventManager.EventType.OPEN);
    }

    public void saveFile(String filename) {
        eventManager.notify(filename, EventManager.EventType.SAVE);
    }
}
