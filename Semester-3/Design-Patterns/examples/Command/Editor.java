package Command;

public class Editor {
    private String text;

    public Editor(String text) {
        this.text = text;
    }

    public String getSelection() {
        System.out.println("Selected text: " + text);
        return text;
    }

    public void deleteSelection() {
        System.out.println("Deleted text: " + text);
        text = "";
    }

    public void replaceSelection(String newText) {
        System.out.println("Replaced text: " + text + " with " + newText);
        text = newText;
    }
}
