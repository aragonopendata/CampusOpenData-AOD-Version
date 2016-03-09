# -*- coding: utf-8 -*-

from flask import Flask
from flask import render_template
from flask import request
from flask import session

from app import app
import BBDDCampusOpenData
import config as configuracion


def __init__():
	conexionBBDD=configuracion.conexion()

@app.route('/', methods=['GET', 'POST'])
def index():
	
	#Capturamos los diferentes filtros
	filtroTipo = session.get('filtroTipo')
	filtroEtiqueta = session.get('filtroEtiqueta')
	filtroPonente = session.get('filtroPonente')
	filtroNombreEvento  = session.get('filtroNombreEvento')
	filtroFormato = session.get('filtroFormato')
	#filtroPlataforma  = session.get('filtroPlataforma')	#No hay filtro, por ahora 2016/03/02
	
	#Obtenemos de la base de datos el array para realizar los comboboxes
	cursor= conexionBBDD.cursor()
	comboTipos			= BBDDCampusOpenData.todoLosTipos(cursor)
	comboEtiquetas	= BBDDCampusOpenData.todoLosTemas(cursor)
	comboPonentes		= BBDDCampusOpenData.todoLosPonentes(cursor)
	comboEventos		= BBDDCampusOpenData.todoLosEventos(cursor)
	comboFormatos		= BBDDCampusOpenData.todoLosFormatos(cursor)
	#comboPlataformas =BBDDCampusOpenData.todaLasPlataformas(cursor)	#No hay filtro, por ahora 2016/03/02
	
	#Búscamos los resultados de los contenidos del campus con los filtros metidos 
	contenidos = BBDDCampusOpenData.filtraContenido(cursor, filtroTipo, filtroEtiqueta, filtroPonente, filtroNombreEvento, filtroFormato=None)
	
	return render_template('index.html', contenidos, comboTipos, comboEtiquetas, comboPonentes, comboPonentes, comboEventos, comboFormatos)
	
@app.route('/show_content/<id>')
def show_content(id):
	cursor= conexionBBDD.cursor()
	contenido = BBDDCampusOpenData.obtenContenidoPorID(id)
	return render_template('showContent.html', contenido)


	
