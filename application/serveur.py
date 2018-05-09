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
	reponse = getLesParties()
	return render_template( 'accueil.html' , reponse = reponse )

def getLesParties() :
	lesParties = modelesGns.getParties()
	corpReponse = json.dumps( lesParties )
	reponse = make_response( corpReponse )
	reponse.mimeype = 'application/json'
	reponse.status_code = 200
	return reponse

if __name__ == "__main__" :
	
	app.run( debug=True )
	app.run( host='0.0.0.0' , debug=True )
