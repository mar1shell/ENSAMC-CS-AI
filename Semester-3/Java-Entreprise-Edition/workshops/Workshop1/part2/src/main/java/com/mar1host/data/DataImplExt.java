package com.mar1host.data;

import org.springframework.stereotype.Component;

@Component("data2")
public class DataImplExt implements IData {
    @Override
    public double getData() {
        return 1;
    }
}
