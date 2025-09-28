import Personne;

public class Etudiant extends Personne {
    private int code;
    private String universite;
    private double moyenne;

    public Etudiant(String nom, int code, String universite, double moyenne) {
        super(nom);
        this.code = code;
        this.universite = universite;
        this.moyenne = moyenne;
    }

    @Override
    public void sePresenter() {
        System.out.println("Je suis un étudiant de " + universite + " et je m'appelle " + getNom());
    }

    public void setCode(int code) {
        this.code = code;
    }

    public void setUniversite(String universite) {
        this.universite = universite;
    }

    public void setMoyenne(double moyenne) {
        this.moyenne = moyenne;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Etudiant etudiant = (Etudiant) obj;
        return code == etudiant.code;
    }

    // Pour tester dans le main
    public static void main(String[] args) {
        Personne p = new Etudiant("Ali", 123, "ENSAM", 15.5);
        p.sePresenter();
    }
}