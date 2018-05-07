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





insert into Joueur values ( 1 , "Nicolas" , "azerty");
insert into Joueur values ( 2 , "Ilona" , "azerty");
insert into Joueur values ( 3 , "Georges" , "azerty");
insert into Joueur values ( 4 , "Aicha" , "azerty");
insert into Joueur values ( 5 , "Cody" , "azerty");


insert into Couleur values (1 ,"Blanc");
insert into Couleur values (2, "Noir");


insert into Partie values ( 1 , "01/05/18" , "Cody" , "Ilona" , "Ilona" , , "Blanc" , "Noir" );
insert into Partie values ( 2 , "01/05/18" , "Cody" , "Ilona" , "Cody" , , "Noir" , "Blanc" );
insert into Partie values ( 3 , "01/05/18" , "Cody" ,  , , "Cody" , "Blanc" ,  );
insert into Partie values ( 4 , "01/05/18" , "Ilona" ,  ,  , , "Noir" , );
insert into Partie values ( 5 , "02/05/18" , "Cody" , "Nicolas" ,  ,"Nicolas" , "Blanc" , "Noir" );
insert into Partie values ( 6 , "02/05/18" , "Cody" , "Nicolas" , ,"Cody"  , "Blanc" , "Noir" );
insert into Partie values ( 7 , "02/05/18" , "Nicolas" , ,  , ,  , "Noir" );
insert into Partie values ( 8 , "02/05/18" , "Nicolas" ,  ,  , ,  , "Noir" );
insert into Partie values ( 9 , "03/05/18" , "Cody" , "Ilona" ,  , "Ilona" , "Blanc" , "Noir" );
insert into Partie values ( 10 , "03/05/18" , "Ilona" , "Nicolas" , "Ilona" , , "Noir" , "Blanc" );















