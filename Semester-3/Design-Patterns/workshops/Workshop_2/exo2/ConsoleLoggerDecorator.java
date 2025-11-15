package workshops.Workshop_2.exo2;

public class ConsoleLoggerDecorator extends LoggerDecorator {
    public ConsoleLoggerDecorator(Logger logger) {
        super(logger);
    }

    @Override
    public void log(String message) {
        System.out.println("ConsoleLogger: " + message);
        super.log(message);
    }
    
}
