# coding: utf8
from app import app

# importer les autres éléments déclarés 
# dans /app/__init__py selon les besoins
#
# from app import db, babel

# importer les modèles pour accéder 
# aux données
#
from app.models import *
from flask import render_template
from app.config import create_plot


@app.route('/')
def index():
  Scatter = create_plot()
  return render_template('index.html', plot= Scatter)

  
