package com.mar1host.metier;

import com.mar1host.data.IData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class MetierImpl implements IMetier {

    IData data;

    @Autowired
    public MetierImpl(@Qualifier("data2") IData data) {
        this.data = data;
    }

    public void setData(IData data) {
        this.data = data;
    }

    @Override
    public double calcul() {
        return 0;
    }
}
