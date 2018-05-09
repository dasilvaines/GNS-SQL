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
        couleurInitiateur   Int ,
        couleurAdversaire Int ,
        initiateur    Int ,
        adversaire Int ,
        vainqueur  Int ,
        suivant Int ,
        PRIMARY KEY (numeroPartie )
)ENGINE=InnoDB;

ALTER TABLE Partie ADD CONSTRAINT FK_Partie_couleurInitiateur FOREIGN KEY (couleurInitiateur) REFERENCES Couleur(numeroCouleur);
ALTER TABLE Partie ADD CONSTRAINT FK_Partie_couleurAdversaire  FOREIGN KEY (couleurAdversaire) REFERENCES Couleur(numeroCouleur);
ALTER TABLE Partie ADD CONSTRAINT FK_Partie_initiateur FOREIGN KEY (initiateur) REFERENCES Joueur(numeroJoueur);
ALTER TABLE Partie ADD CONSTRAINT FK_Partie_adversaire FOREIGN KEY (adversaire) REFERENCES Joueur(numeroJoueur);
ALTER TABLE Partie ADD CONSTRAINT FK_Partie_vainqueur FOREIGN KEY (vainqueur) REFERENCES Joueur(numeroJoueur);
ALTER TABLE Partie ADD CONSTRAINT FK_Partie_suivant FOREIGN KEY (suivant) REFERENCES Joueur(numeroJoueur);


#------------------------------------------------------------
# Table: Joueur
#------------------------------------------------------------

insert into Joueur values( 1 , "Nicolas" , "azerty" );
insert into Joueur values( 2 , "ilona" , "azerty" );
insert into Joueur values( 3 , "George" , "azerty" );
insert into Joueur values( 4 , "Aïcha" , "azerty" );
insert into Joueur values( 5 , "Cody" , "azerty" );


#------------------------------------------------------------
# Table: Couleur
#------------------------------------------------------------

insert into Couleur values( 1 , "Blanc" );
insert into Couleur values( 2 , "Noir" );


#------------------------------------------------------------
# Table: Partie
#------------------------------------------------------------

insert into Partie values( 1 , '2018-05-01' , 1 , 2 , 5 , 2 , 2 , null );
insert into Partie values( 2 , '2018-05-01' , 2 , 1 , 5 , 2 , 5 , null );
insert into Partie values( 3 , '2018-05-01' , 1 , null , 5 , null , null , 5 );
insert into Partie values( 4 , '2018-05-01' , 2 , null , 2 , null , null , null );
insert into Partie values( 5 , '2018-05-02' , 1 , 2 , 5 , 1 , null , 1 );
insert into Partie values( 6 , '2018-05-02' , 1 , 2 , 5 , 1 , null , 5 );
insert into Partie values( 7 , '2018-05-02' , null , 2 , 1 , null , null , null );
insert into Partie values( 8 , '2018-05-02' , null , 2 , 1 , null , null , null );
insert into Partie values( 9 , '2018-05-03' , 1 , 2 , 5 , 2 , null , 2 );
insert into Partie values( 10 , '2018-05-03' , 2 , 1 , 2 , 1 , 2 , null );




