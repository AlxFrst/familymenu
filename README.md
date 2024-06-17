
# FamilyMenu 🍽️

## Description
FamilyMenu est une application simple destinée à faciliter l'organisation des repas lors des fêtes familiales. L'organisateur peut entrer tous les plats et sauces proposés, et les invités peuvent sélectionner ce qu'ils souhaitent manger. L'organisateur dispose également d'un tableau de bord pour gérer les commandes en temps réel.

## Fonctionnalités
### Pour l'organisateur
1. **Ajouter des plats** : Nom du plat, image via URL.
2. **Ajouter des sauces** : Nom de la sauce, image via URL.
3. **Tableau de bord** : Voir toutes les commandes en temps réel, changer le statut des commandes (en attente, terminé).

### Pour les invités
1. **Étape 1 : Entrer le nom** : Identification simple par le nom.
2. **Étape 2 : Sélectionner les plats** : Choisir les plats désirés.
3. **Étape 3 : Sélectionner les sauces** : Choisir les sauces désirées.
4. **Étape 4 : Résumé et validation** : Voir un résumé de la commande et valider.

### Temps réel
- Les commandes apparaissent en temps réel sur le tableau de bord de l'organisateur.
- Les statuts des commandes se mettent à jour en temps réel pour tous les utilisateurs sur la page.

## Prérequis
- Node.js
- TypeScript
- Next.js
- Prisma
- SQLite (ou tout autre base de données compatible avec Prisma)

## Installation
1. Clonez le dépôt :
   \`\`\`bash
   git clone https://github.com/votre-utilisateur/familymenu.git
   \`\`\`
2. Installez les dépendances :
   \`\`\`bash
   cd familymenu
   npm install
   \`\`\`
3. Configurez Prisma :
   \`\`\`bash
   npx prisma init
   \`\`\`
4. Modifiez le fichier \`prisma/schema.prisma\` pour utiliser SQLite :
   \`\`\`prisma
   datasource db {
     provider = "sqlite"
     url      = "file:./dev.db"
   }

   generator client {
     provider = "prisma-client-js"
   }

   model Plat {
     id        Int      @id @default(autoincrement())
     nom       String
     imageUrl  String
     commandes Commande[]
   }

   model Sauce {
     id        Int      @id @default(autoincrement())
     nom       String
     imageUrl  String
     commandes Commande[]
   }

   model Commande {
     id        Int      @id @default(autoincrement())
     nomClient String
     plats     Plat[]
     sauces    Sauce[]
     statut    String   @default("en attente")
   }
   \`\`\`
5. Déployez la base de données :
   \`\`\`bash
   npx prisma migrate dev --name init
   \`\`\`
6. Lancez le serveur de développement :
   \`\`\`bash
   npm run dev
   \`\`\`

## Utilisation
1. Accédez à \`http://localhost:3000\` pour voir l'application en action.
2. L'organisateur peut accéder à son tableau de bord pour ajouter des plats et des sauces, et gérer les commandes.
3. Les invités peuvent passer leur commande via une interface simple et intuitive.

## Contribuer
Les contributions sont les bienvenues ! Veuillez soumettre une pull request ou ouvrir une issue pour discuter des changements que vous souhaitez apporter.

## Licence
[MIT](LICENSE)

---

## Technologies Utilisées
- **Next.js** : Framework React pour le rendu côté serveur et la génération statique.
- **TypeScript** : Superset de JavaScript qui ajoute le typage statique.
- **Prisma** : ORM pour interagir avec la base de données.
- **SQLite** : Base de données légère utilisée pour le développement.

## Auteur
Développé par [Votre Nom].

---

Pour toute question ou suggestion, n'hésitez pas à ouvrir une issue sur le dépôt GitHub. 

Bon appétit ! 🍴✨
