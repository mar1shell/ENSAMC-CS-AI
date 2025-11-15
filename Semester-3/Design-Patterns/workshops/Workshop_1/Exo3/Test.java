package Exo3;

public class Test {
    public static void main(String[] args) {
        ValidationAge2 validationMetropole = new ValidationAge2(new RegleMetropole());
        ValidationAge2 validationDomTom = new ValidationAge2(new RegleDomTom());

        int age = 20;
        System.out.println("Métropole:");
        System.out.println("Peut boire de l'alcool à " + age + " ans: " + validationMetropole.peutBoireAlcool(age));
        System.out.println("Peut utiliser FesseBouk à " + age + " ans: " + validationMetropole.peutUtiliserFesseBouk(age));
        System.out.println("Peut être élu maire à " + age + " ans: " + validationMetropole.peutEtreEluMaire(age));

        System.out.println("\nDOM-TOM:");
        System.out.println("Peut boire de l'alcool à " + age + " ans: " + validationDomTom.peutBoireAlcool(age));
        System.out.println("Peut utiliser FesseBouk à " + age + " ans: " + validationDomTom.peutUtiliserFesseBouk(age));
        System.out.println("Peut être élu maire à " + age + " ans: " + validationDomTom.peutEtreEluMaire(age));
    }
}
