package workshops.Workshop_2.exo2;

public class EncryptedLoggerDecorator extends LoggerDecorator {
    public EncryptedLoggerDecorator(Logger logger) {
        super(logger);
    }

    @Override
    public void log(String message) {
        String encryptedMessage = new StringBuilder(message).reverse().toString();
        System.out.println("EncryptedLogger: " + encryptedMessage);
        
        super.log(encryptedMessage);
    }
    
}
