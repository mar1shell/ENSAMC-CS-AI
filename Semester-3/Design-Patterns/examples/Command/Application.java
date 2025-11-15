package Command;

import java.util.List;

public class Application {
    private List<Editor> editors;
    private Editor activeEditor;
    private CommandHistory history;
    private String clipboard;

    public Application(List<Editor> editors, Editor activeEditor, CommandHistory history, String clipboard) {
        this.editors = editors;
        this.activeEditor = activeEditor;
        this.history = history;
        this.clipboard = clipboard;
    }

    public String getClipboard() {
        return clipboard;
    }

    public void createUI() {
        System.out.println("Application UI created.");
    }

    public void executeCommand(Command command) {
        command.execute();
    };

    public void undo() {
        Command command = history.pop();
        
        if (command != null) {
            command.undo();
        }
    }
    
}
