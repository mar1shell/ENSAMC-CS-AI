package Decorator;

public class EncryptionDecorator extends BaseDataSourceDecorator {
    IDataSource wrapee;

    public EncryptionDecorator(IDataSource wrapee) {
        this.wrapee = wrapee;
    }
    
    @Override
    public void readData() {
        System.out.println("Decrypting Data...");
        wrapee.readData();
    }

    @Override
    public void writeData() {
        wrapee.writeData();
        System.out.println("Encrypting Data...");
    }
    
}