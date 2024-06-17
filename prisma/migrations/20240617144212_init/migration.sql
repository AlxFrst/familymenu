-- CreateTable
CREATE TABLE "Plat" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nom" TEXT NOT NULL,
    "imageUrl" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Sauce" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nom" TEXT NOT NULL,
    "imageUrl" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Commande" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nomClient" TEXT NOT NULL,
    "statut" TEXT NOT NULL DEFAULT 'en attente'
);

-- CreateTable
CREATE TABLE "PlatsOnCommandes" (
    "platId" INTEGER NOT NULL,
    "commandeId" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,

    PRIMARY KEY ("platId", "commandeId"),
    CONSTRAINT "PlatsOnCommandes_platId_fkey" FOREIGN KEY ("platId") REFERENCES "Plat" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "PlatsOnCommandes_commandeId_fkey" FOREIGN KEY ("commandeId") REFERENCES "Commande" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "SaucesOnCommandes" (
    "sauceId" INTEGER NOT NULL,
    "commandeId" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,

    PRIMARY KEY ("sauceId", "commandeId"),
    CONSTRAINT "SaucesOnCommandes_sauceId_fkey" FOREIGN KEY ("sauceId") REFERENCES "Sauce" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "SaucesOnCommandes_commandeId_fkey" FOREIGN KEY ("commandeId") REFERENCES "Commande" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
