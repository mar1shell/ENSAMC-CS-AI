package Exo3;

public class ValidationAge2 {
    private IRegleRegion regleRegion;

    public ValidationAge2(IRegleRegion regleRegion) {
        this.regleRegion = regleRegion;
    }

    public boolean peutBoireAlcool(int age) {
        return regleRegion.peutBoireAlcool(age);
    }

    public boolean peutUtiliserFesseBouk(int age) {
        return regleRegion.peutUtiliserFesseBouk(age);
    }

    public boolean peutEtreEluMaire(int age) {
        return regleRegion.peutEtreEluMaire(age);
    }
}
