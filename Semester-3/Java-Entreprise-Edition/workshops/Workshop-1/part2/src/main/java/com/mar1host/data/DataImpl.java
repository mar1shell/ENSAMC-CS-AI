package com.mar1host.data;


import org.springframework.stereotype.Component;

@Component("data")
public class DataImpl implements IData {
    @Override
    public double getData() {
        return 0;
    }
}
