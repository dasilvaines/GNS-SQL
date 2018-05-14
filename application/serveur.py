#!/usr/bin/python
# -*- coding: utf-8 -*-

from modeles import modeleGns
from flask import *

app = Flask( __name__ )

@app.route( '/' )
def accueil() :
	return redirect( '/parties' )
	
@app.route( '/parties' , methods=['GET'] )
def partie() :
	reponse = modeleGns.getParties()
	reponse = getJSON( reponse )
	return render_template( 'accueil.html' , reponse = reponse )


	
@app.route( '/parties/<numeroPartie>' , methods=['GET'] )
def consulterPartie( numeroPartie):
	partie = modeleGns.getPartie(numeroPartie)
	partie = getJSON( partie )
	return render_template( 'accueil.html' , reponse = partie )
		


@app.route( '/parties/<numeroPartie>' , methods=['DELETE'] )
def annulerPartie(numeroPartie):
	reponse = modeleGns.supprimerPartie(numeroPartie)
	reponse = getJSON( reponse )
	return render_template( 'accueil.html' , reponse = reponse )


@app.route( '/parties', methods=['POST'] )
def initierPartie() :
	donnees = request.data
	donnees = json.loads( donnees )
	numInit = donnees['numeroInitiateur']
	numCouleurInit = donnees['numeroCouleurInitiateur']
	reponse = modelesGns.creerPartie( numInit, numCouleurInit )
	reponse = getJSON( reponse )
	return render_template( 'accueil.html', reponse = reponse )	
	
	
@app.route( '/parties/<numeroPartie>/<numeroAdversaire>' , methods=['PUT'] )
def rejoindrePartie( numeroPartie , numeroAdversaire ) :
	reponse = modelesGns.modifierPartie( numeroPartie , numeroAdversaire )
	reponse = getJSON( reponse )
	return render_template( 'accueil.html' , reponse = reponse )
	
	
	

def getJSON( lesParties ) :
	corpReponse = json.dumps( lesParties )
	reponse = make_response( corpReponse )
	reponse.mimeype = 'application/json'
	reponse.status_code = 200
	reponse = reponse.data
	return reponse
	

if __name__ == "__main__" :
	
	app.run( debug=True )
	app.run( host='0.0.0.0' , debug=True )
