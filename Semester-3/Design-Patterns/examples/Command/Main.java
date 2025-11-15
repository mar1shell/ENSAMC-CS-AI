package Command;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        Editor editor = new Editor("Initial text");
        CommandHistory history = new CommandHistory();

        Application app = new Application(List.of(editor), editor, history, "Clipboard text");
        
        Command copyCommand = new CopyCommand(app, editor);
        Command pasteCommand = new PasteCommand(app, editor);
        
        app.executeCommand(copyCommand);
        app.executeCommand(pasteCommand);
        
        app.undo();
    }
}
