#!/usr/bin/python
# -*- coding: utf-8 -*-

import mysql.connector

connexionBD = None

def getConnexionBD() :
	global connexionBD
	try :
		if connexionBD == None :
			connexionBD = mysql.connector.connect(
					host = 'localhost' ,
					user = 'root' ,
					password = 'azerty' ,
					database = 'gns'
				)
		return connexionBD
	except :
		return None


def getParties() :
	try :
		parties = []
		cur = getConnexionBD().cursor()
		requete = '''
					select numeroPartie, dateCreation, initiateur, A.nomJoueur, adversaire, B.nomJoueur, vainqueur, suivant,  E.nomCouleur,  F.nomCouleur
					from Partie
					left outer join Joueur A
					on Partie.initiateur = A.numeroJoueur
					left outer join Joueur B
					on Partie.adversaire = B.numeroJoueur
					left outer join Couleur E
					on Partie.couleurInitiateur = E.numeroCouleur
					left outer join Couleur F
					on Partie.couleurAdversaire = F.numeroCouleur 
					order by numeroPartie  
				'''
		cur.execute( requete )		
		save = cur.fetchall()
		for row in save :
			parties.append({
							'numeroPartie' : row[0] ,
							'dateCreation' : row[1] ,
							'initiateur' : row[2] ,
							'nomInitiateur' : row[3] ,
							'adversaire' : row[4] ,
							'nomAdversaire' : row[5] ,
							'vainqueur' : row[6] ,
							'suivant' : row[7] ,
							'couleurIniateur' : row[8] ,
							'couleurAdversaire' : row[9] 
						})
			
		cur.close()
		return parties
		
	except :
		return None
