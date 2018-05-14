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
		
		
def getPartie(numeroPartie):
	try:
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
					where numeroPartie = %s
				'''
		cur.execute( requete , (numeroPartie) )		
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

def supprimerPartie( numeroPartie):
	try:
		exist = False
		cur = getConnexionBD().cursor()
		requete = '''
					delete from Partie
					where numeroPartie = %s
				'''
		partie = getPartie(numeroPartie)
		if len(partie) != 0 :
			exist = True
			cur.execute( requete , (numeroPartie) )		
			
			
		cur.close()
		connexionBD.commit()
		return parties
			
	except:
		return None
			
def creerPartie( numInit, numCouleurInit ) :
	try :
		num = 0
		cur = getConnexionBD().cursor()
		requete = '''
					insert into Partie( numeroPartie , dateCreation , initiateur , couleurInitiateur , suivant ) values( %s , current_date() , %s , %s , %s )
				'''
		numPartie = getParties()
		for unNum in numPartie :
			if unNum['numeroPartie'] > num :
				num = unNum['numeroPartie']
		if numCouleurInit == 1 :
			suivant = numInit
		else :
			suivant = 'null'
		num = num + 1		
		cur.execute( requete , ( num , numInit , numCouleurInit , suivant ) )
		cur.close()
		getConnexionBD().commit()
		return num
			
	except :
		return None



def modifierPartie(  numPartie , numAdv ) :
	try :
		valid = False
		cur = getConnexionBD().cursor()
		requete = '''
					update Partie
					set adversaire = %s ,
					couleurAdversaire = %s 
					where numeroPartie = %s
				'''
		partie = getPartie( numPartie )
		for unePartie in partie :
			if unePartie['adversaire'] == None :
				if unePartie['couleurInitiateur'] == 1 :
					couleur = 2
				else :
					couleur = 1
				cur.execute( requete , ( numAdv , couleur , numPartie ))
				valid = True
		cur.close()
		getConnexionBD().commit()
		return valid
	except :
		return None

