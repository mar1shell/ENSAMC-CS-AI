package Exo3;

public class ValidationAge {
    public boolean peutBoireAlcool(int age, String region) {
        if (region.equals("DomTom")) {
            return age >= 19;
        }
        return age >= 18;
    }

    public boolean peutUtiliserFesseBouk(int age, String region) {
        if (region.equals("DomTom")) {
            return age >= 15;
        }
        return age >= 13;
    }

    public boolean peutEtreEluMaire(int age, String region) {
        if (region.equals("DomTom")) {
            return age >= 19;
        }
        return age >= 21;
    }
}
