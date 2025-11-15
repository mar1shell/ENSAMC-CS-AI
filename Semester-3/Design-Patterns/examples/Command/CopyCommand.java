package Command;

public class CopyCommand extends Command {

    public CopyCommand(Application app, Editor editor) {
        super(app, editor);
    }

    @Override
    public void saveBackup() {
        // Copy command does not modify state, so no backup needed
    }

    @Override
    public void undo() {
        // Copy command does not modify state, so nothing to undo
    }

    @Override
    public void execute() {
        editor.getSelection();
        System.out.println("Copied text to clipboard.");
    }
    
}
