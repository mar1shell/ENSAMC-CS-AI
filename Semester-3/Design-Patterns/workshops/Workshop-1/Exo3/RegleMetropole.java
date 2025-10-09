package Exo3;

public class RegleMetropole implements IRegleRegion {
    public boolean peutBoireAlcool(int age) {
        return age >= 18;
    }

    public boolean peutUtiliserFesseBouk(int age) {
        return age >= 13;
    }

    public boolean peutEtreEluMaire(int age) {
        return age >= 25;
    }
}
