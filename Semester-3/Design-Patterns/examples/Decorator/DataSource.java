package Decorator;

public class DataSource implements IDataSource {
    @Override
    public void readData() {
        System.out.println("Reading Data...");
    }

    @Override
    public void writeData() {
        System.out.println("Writing Data...");

    }
    
}
