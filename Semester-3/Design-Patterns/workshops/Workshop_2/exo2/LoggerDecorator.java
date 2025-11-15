package workshops.Workshop_2.exo2;

public abstract class LoggerDecorator  implements Logger {
    protected Logger wrappedLogger;

    public LoggerDecorator(Logger logger) {
        this.wrappedLogger = logger;
    }

    @Override
    public void log(String message) {
        wrappedLogger.log(message);
    }
    
}
