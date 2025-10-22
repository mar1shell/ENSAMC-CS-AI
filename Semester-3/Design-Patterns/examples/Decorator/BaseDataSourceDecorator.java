package Decorator;

public abstract class BaseDataSourceDecorator implements IDataSource{
    IDataSource wrapee;
}
