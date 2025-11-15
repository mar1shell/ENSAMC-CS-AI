- Que faudrait-il modifier pour ajouter un nouveau filtre “bordure” ?

**Réponse :**
Pour ajouter un nouveau filtre "bordure", il faudrait créer une nouvelle classe qui hérite de la classe de base des filtres existants. Cette nouvelle classe contiendrait la logique spécifique pour appliquer le filtre "bordure". Ensuite, il suffirait d'instancier cette nouvelle classe et de l'ajouter à la chaîne de traitement des filtres.

- En quoi cette architecture respecte le principe Open/Closed ?

**Réponse :**
Cette architecture respecte le principe Open/Closed car elle permet d'ajouter de nouveaux filtres (comme le filtre "bordure") sans modifier le code existant. Les nouvelles classes de filtres peuvent être créées en étendant les classes existantes, ce qui évite d'introduire des changements dans le code déjà en place. Ainsi, le système est ouvert à l'extension (ajout de nouveaux filtres) mais fermé à la modification (pas de changements dans le code existant).
