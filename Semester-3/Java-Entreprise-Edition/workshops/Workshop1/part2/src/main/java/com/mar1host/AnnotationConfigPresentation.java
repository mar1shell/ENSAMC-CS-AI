package com.mar1host;

import com.mar1host.metier.IMetier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class AnnotationConfigPresentation {
    public static void main(String[] args) {
        ApplicationContext applicationContext = new AnnotationConfigApplicationContext("com.mar1host");
        IMetier metier = (IMetier) applicationContext.getBean(IMetier.class);
        System.out.println(metier.calcul());
    }
}
