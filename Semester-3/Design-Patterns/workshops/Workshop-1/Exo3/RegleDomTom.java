package Exo3;

public class RegleDomTom implements IRegleRegion {
    public boolean peutBoireAlcool(int age) {
        return age >= 19;
    }

    public boolean peutUtiliserFesseBouk(int age) {
        return age >= 15;
    }

    public boolean peutEtreEluMaire(int age) {
        return age >= 19;
    }
    
}
