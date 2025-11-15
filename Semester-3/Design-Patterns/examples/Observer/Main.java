package Observer;

public class Main {
    public static void main(String[] args) {
        Editor editor = new Editor();

        editor.openFile("test.txt");
        editor.saveFile("test.txt");
    }
}
