#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Joueur
#------------------------------------------------------------

CREATE TABLE Joueur(
        numeroJoueur Int NOT NULL ,
        nomJoueur    Varchar (25) ,
        mdpJoueur    Varchar (25) ,
        PRIMARY KEY (numeroJoueur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Couleur
#------------------------------------------------------------

CREATE TABLE Couleur(
        numeroCouleur Int NOT NULL ,
        nomCouleur    Varchar (25) ,
        PRIMARY KEY (numeroCouleur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Partie
#------------------------------------------------------------

CREATE TABLE Partie(
        numeroPartie    Int NOT NULL ,
        dateCreation    Date ,
        couleurInitiateur  Int ,
        couleurAdversaire Int ,
        initier   Int ,
        adversaire  Int ,
        vainqueur  Int ,
        suivant  Int ,
        PRIMARY KEY (numeroPartie )
)ENGINE=InnoDB;

ALTER TABLE Partie ADD CONSTRAINT FK_Partie_couleurInitiateur FOREIGN KEY (couleurInitiateur) REFERENCES Couleur(numeroCouleur);
ALTER TABLE Partie ADD CONSTRAINT FK_Partie_couleurAdversaire FOREIGN KEY (couleurAdversaire) REFERENCES Couleur(numeroCouleur);
ALTER TABLE Partie ADD CONSTRAINT FK_Partie_initier  FOREIGN KEY (initier) REFERENCES Joueur(numeroJoueur);
ALTER TABLE Partie ADD CONSTRAINT FK_Partie_adversaire  FOREIGN KEY (adversaire) REFERENCES Joueur(numeroJoueur);
ALTER TABLE Partie ADD CONSTRAINT FK_Partie_vainqueur FOREIGN KEY (vainqueur) REFERENCES Joueur(numeroJoueur);
ALTER TABLE Partie ADD CONSTRAINT FK_Partie_suivant FOREIGN KEY (suivant) REFERENCES Joueur(numeroJoueur);
