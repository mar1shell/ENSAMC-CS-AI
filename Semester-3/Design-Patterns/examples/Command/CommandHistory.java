package Command;

import java.util.List;

public class CommandHistory {
    private List<Command> history;

    public CommandHistory() {
        this.history = new java.util.ArrayList<>();
    }

    public CommandHistory(List<Command> history) {
        this.history = history;
    }

    public void push(Command c) {
        history.add(c);
    }

    public Command pop() {
        if (history.isEmpty()) {
            return null;
        }

        return history.remove(history.size() - 1);
    }
    
}
