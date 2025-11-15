package workshops.Workshop_2.exo2;

public class RemoteLoggerDecorator extends LoggerDecorator {
    public RemoteLoggerDecorator(Logger logger) {
        super(logger);
    }

    @Override
    public void log(String message) {
        System.out.println("RemoteLogger: " + message);
        super.log(message);
    }
    
}
