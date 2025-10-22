package Decorator;

public class Main {
    public static void main(String[] args) {
        IDataSource dataSource = new DataSource();
        IDataSource encryptedDataSource = new EncryptionDecorator(dataSource);
        IDataSource compressedDataSource = new CompressionDecorator(encryptedDataSource);

        compressedDataSource.writeData();
        System.out.println("_________________________");
        compressedDataSource.readData();
    }
}
