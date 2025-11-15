package workshops.Workshop_2.exo2;

public class Main {
    public static void main(String[] args) {
        Logger fileLogger = new FileLogger();
        Logger consoleAndFileLogger = new ConsoleLoggerDecorator(fileLogger);
        Logger encryptedRemoteConsoleAndFileLogger = new EncryptedLoggerDecorator(consoleAndFileLogger);
        Logger remoteConsoleAndFileLogger = new RemoteLoggerDecorator(encryptedRemoteConsoleAndFileLogger);

        remoteConsoleAndFileLogger.log("This is a test message.");
    }
}
