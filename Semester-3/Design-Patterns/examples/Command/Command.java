package Command;

public abstract class Command {
    protected Application app;
    protected Editor editor;
    protected String backup;

    public Command(Application app, Editor editor) {
        this.app = app;
        this.editor = editor;
    }

    public abstract void saveBackup();

    public abstract void undo();

    public abstract void execute();
}
