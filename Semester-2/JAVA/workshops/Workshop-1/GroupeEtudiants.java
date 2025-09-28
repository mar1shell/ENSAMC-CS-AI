import java.util.Scanner;
import Etudiant;

class Etudiant {
    private String nom;
    private String code;
    private double moyenne;
    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }
    public String getCode() { return code; }
    public double getMoyenne() { return moyenne; }
    public void setMoyenne(double moyenne) { this.moyenne = moyenne; }

    @Override
    public String toString() {
        return "Code: " + code + ", Nom: " + nom + ", Moyenne: " + moyenne;
    }
}

public class GroupeEtudiants {
    private Etudiant[] etudiants = new Etudiant[100];
    private int nbEtudiants = 0;

    public int rechercherEtudiant(String code) {
        for (int i = 0; i < nbEtudiants; i++) {
            if (etudiants[i].getCode().equals(code)) {
                return i;
            }
        }
        return -1;
    }

    public boolean ajouterEtudiant(Etudiant e) {
        if (nbEtudiants < 100) {
            etudiants[nbEtudiants++] = e;
            return true;
        }
        return false;
    }

    public boolean modifierNomEtudiant(String code, String nouveauNom) {
        int idx = rechercherEtudiant(code);
        if (idx != -1) {
            etudiants[idx].setNom(nouveauNom);
            return true;
        }
        return false;
    }

    public void afficherEtudiants() {
        for (int i = 0; i < nbEtudiants; i++) {
            System.out.println(etudiants[i]);
        }
    }

    public double calculerMoyenneGenerale() {
        if (nbEtudiants == 0) return 0;
        double somme = 0;
        for (int i = 0; i < nbEtudiants; i++) {
            somme += etudiants[i].getMoyenne();
        }
        return somme / nbEtudiants;
    }

    public static void main(String[] args) {
        GroupeEtudiants groupe = new GroupeEtudiants();
        Scanner sc = new Scanner(System.in);
        int choix;
        do {
            System.out.println("\nMenu:");
            System.out.println("1. Ajouter un étudiant");
            System.out.println("2. Rechercher un étudiant par code");
            System.out.println("3. Modifier le nom d'un étudiant");
            System.out.println("4. Afficher tous les étudiants");
            System.out.println("5. Calculer la moyenne générale");
            System.out.println("0. Quitter");
            System.out.print("Votre choix: ");
            choix = sc.nextInt();
            sc.nextLine();

            switch (choix) {
                case 1:
                    System.out.print("Nom: ");
                    String nom = sc.nextLine();
                    System.out.print("Code: ");
                    String code = sc.nextLine();
                    System.out.print("Moyenne: ");
                    double moyenne = sc.nextDouble();
                    sc.nextLine();
                    if (groupe.ajouterEtudiant(new Etudiant(nom, code, moyenne))) {
                        System.out.println("Etudiant ajouté.");
                    } else {
                        System.out.println("Groupe plein.");
                    }
                    break;
                case 2:
                    System.out.print("Code à rechercher: ");
                    String codeRecherche = sc.nextLine();
                    int idx = groupe.rechercherEtudiant(codeRecherche);
                    if (idx != -1) {
                        System.out.println("Trouvé: " + groupe.etudiants[idx]);
                    } else {
                        System.out.println("Etudiant non trouvé.");
                    }
                    break;
                case 3:
                    System.out.print("Code de l'étudiant: ");
                    String codeModif = sc.nextLine();
                    System.out.print("Nouveau nom: ");
                    String nouveauNom = sc.nextLine();
                    if (groupe.modifierNomEtudiant(codeModif, nouveauNom)) {
                        System.out.println("Nom modifié.");
                    } else {
                        System.out.println("Etudiant non trouvé.");
                    }
                    break;
                case 4:
                    groupe.afficherEtudiants();
                    break;
                case 5:
                    System.out.println("Moyenne générale: " + groupe.calculerMoyenneGenerale());
                    break;
                case 0:
                    System.out.println("Au revoir !");
                    break;
                default:
                    System.out.println("Choix invalide.");
            }
        } while (choix != 0);
        sc.close();
    }
}