package Decorator;

public class CompressionDecorator extends BaseDataSourceDecorator {
    IDataSource wrapee;

    public CompressionDecorator(IDataSource wrapee) {
        this.wrapee = wrapee;
    }
    
    @Override
    public void readData() {
        System.out.println("Decompressing Data...");
        wrapee.readData();
    }

    @Override
    public void writeData() {
        wrapee.writeData();
        System.out.println("Compressing Data...");
    }
    
}
