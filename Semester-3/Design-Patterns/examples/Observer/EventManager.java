package Observer;

import java.util.HashMap;
import java.util.Map;

public class EventManager {
    private Map<IEventListener, EventType> listeners;

    public EventManager() {
        this.listeners = new HashMap<>();
    }

    public void subscribe(EventType eventType, IEventListener listener) {
        listeners.put(listener, eventType);
    }

    public void unsubscribe(EventType eventType, IEventListener listener) {
        listeners.remove(listener);
    }

    public void notify(String filename, EventType eventType) {
        for (Map.Entry<IEventListener, EventType> entry : listeners.entrySet()) {
            if (entry.getValue() == eventType) {
                entry.getKey().update(filename);
            }
        }
    }

    public enum EventType {
        OPEN,
        SAVE
    }
}
