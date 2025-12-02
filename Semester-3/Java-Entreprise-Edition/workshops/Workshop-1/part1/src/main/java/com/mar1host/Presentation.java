package com.mar1host;

import com.mar1host.data.IData;
import com.mar1host.metier.IMetier;

import java.io.File;
import java.lang.reflect.Method;
import java.util.Scanner;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Presentation {
    public static void main(String[] args) {
        try {
            Scanner scanner = new Scanner(new File("config.txt"));
            String dataClassName = scanner.nextLine();
            Class cData = Class.forName(dataClassName);
            IData data = (IData) cData.newInstance();

            String metierClassName = scanner.nextLine();
            Class cMetier = Class.forName(metierClassName);
            IMetier metier = (IMetier) cMetier.newInstance();
            Method m = cMetier.getMethod("setData" ,IData.class);
            m.invoke(metier,data);


            System.out.println(" Resultat de calcul :" + metier.calcul());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}