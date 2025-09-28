public class Personne {
    // 1. Attribut privé pour le nom
    private String nom;

    // 2. Constructeur
    public Personne(String nom) {
        this.nom = nom;
    }

    // 3. Méthode pour obtenir le nom
    public String getNom() {
        return nom;
    }

    // 4. Méthode pour modifier le nom
    public void setNom(String nom) {
        this.nom = nom;
    }

    // 1. Méthode de comparaison suivant le nom
    public int compare(Personne p) {
        return this.nom.compareTo(p.nom);
    }

    // 5. Méthode sePresenter
    public void sePresenter() {
        System.out.println("Je suis une personne et je m'appelle " + nom);
    }
}