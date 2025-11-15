package Singleton;

public class Logger {
    private static Logger instance;

    private Logger() {
        // Private constructor to prevent instantiation
    }

    public static Logger getInstance() {
        if (instance == null) {
            instance = new Logger();
        }
        
        return instance;
    }

    public void log(String message) {
        System.out.println("Log: " + message);
    }
}
