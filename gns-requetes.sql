select *
from Partie
where vainqueur is not null ;

select *
from Partie
where vainqueur is null ;

select *
from Partie
where adversaire is null ;

select *
from Partie 
where vainqueur is not null
and initiateur = (
					select numeroJoueur
					from Joueur
					where nomJoueur = "Cody"
				);

select *
from Partie 
where vainqueur = (
					select numeroJoueur
					from Joueur
					where nomJoueur = "Cody"
				);

select *
from Partie 
where adversaire is null
and initiateur = (
					select numeroJoueur
					from Joueur
					where nomJoueur = "Cody"
				);

select *
from Partie 
where vainqueur is null
and initiateur = (
					select numeroJoueur
					from Joueur
					where nomJoueur = "Cody"
				);

select *
from Partie 
where suivant = (
					select numeroJoueur
					from Joueur
					where nomJoueur = "Cody"
				);

select *
from Partie 
where suivant is not null
and initiateur not in (
					select numeroJoueur
					from Joueur
					where nomJoueur = "Cody"
				);


select *
from Partie ;
