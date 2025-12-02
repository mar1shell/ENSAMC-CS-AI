package com.mar1host.metier;

import com.mar1host.data.IData;

public class MetierImpl implements IMetier {
    IData data;

    @Override
    public double calcul() {
        return data.getData() + 1;
    }

    public void setData(IData data) {
        this.data = data;
    }
}
