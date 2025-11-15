package workshops.Workshop_2.exo2;

public class FileLogger implements Logger {
    @Override
    public void log(String message) {
        System.out.println("FileLogger: " + message);
    }
    
}
