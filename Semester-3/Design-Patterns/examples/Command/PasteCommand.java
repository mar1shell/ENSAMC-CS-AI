package Command;

public class PasteCommand extends Command {
    public PasteCommand(Application app, Editor editor) {
        super(app, editor);
    }

    @Override
    public void saveBackup() {
        backup = editor.getSelection();
    }

    @Override
    public void undo() {
        editor.replaceSelection(backup);
    }

    @Override
    public void execute() {
        saveBackup();
        String clipboardText = app.getClipboard();
        editor.replaceSelection(clipboardText);
        System.out.println("Pasted text from clipboard.");
    }
    
}
