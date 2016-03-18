# -*- coding: utf-8 -*-

from flask import Flask
from flask import render_template
from flask import request
from flask import session
from app import app
import BBDDCampusOpenData
import config as configuracion
from urllib import url2pathname


def __init__():
	conexionBBDD=configuracion.conexion()

@app.route('/', methods=['GET', 'POST'])
def index():
	conexionBBDD=configuracion.conexion()
	filtroTipo = ''
	filtroEtiqueta = ''
	filtroPonente = ''
	filtroNombreEvento = ''
	filtroFormato = ''
	
	#Capturamos los diferentes filtros
	if request.args.get('filtroTipo'):
		filtroTipo					= url2pathname(request.args.get('filtroTipo')).encode('utf-8')
	if request.args.get('filtroEtiquetas'):
		filtroEtiqueta			= url2pathname(request.args.get('filtroEtiquetas')).encode('utf-8')
	if request.args.get('filtroPonentes'):
		filtroPonente 			= url2pathname(request.args.get('filtroPonentes')).encode('utf-8')
	if request.args.get('filtroEventos'):
		filtroNombreEvento	= url2pathname(request.args.get('filtroEventos')).encode('utf-8')
	if request.args.get('filtroFormatos'):
		filtroFormato				= url2pathname(request.args.get('filtroFormatos')).encode('utf-8')
	#filtroPlataforma  = url2pathname(request.args.get('filtroPlataforma')	#No hay filtro, por ahora 2016/03/02
	print 'El filtro de tipo es '+ str(filtroTipo)
	print 'El filtro de etiquetas es '+ str(filtroEtiqueta)
	print 'El filtro de ponentes es '+ str(filtroPonente)
	print 'El filtro de eventos es '+ str(filtroNombreEvento)
	print 'El filtro de formatos es '+ str(filtroFormato)
	#Obtenemos de la base de datos el array para realizar los comboboxes
	cursor= conexionBBDD.cursor()
	comboTipos			= BBDDCampusOpenData.todoLosTipos(cursor)
	comboEtiquetas	= BBDDCampusOpenData.todoLosTemas(cursor)
	comboPonentes		= BBDDCampusOpenData.todoLosPonentes(cursor)
	comboEventos		= BBDDCampusOpenData.todoLosEventos(cursor)
	comboFormatos		= BBDDCampusOpenData.todoLosFormatos(cursor)
	#comboPlataformas =BBDDCampusOpenData.todaLasPlataformas(cursor)	#No hay filtro, por ahora 2016/03/02
	
	#Búscamos los resultados de los contenidos del campus con los filtros metidos 
	contenidos = BBDDCampusOpenData.filtraContenido(cursor, filtroTipo, filtroEtiqueta, filtroPonente, filtroNombreEvento, filtroFormato)
	cursor.close()
	conexionBBDD.close()
	return render_template('index.html', contenidos=contenidos, comboTipos=comboTipos, comboEtiquetas=comboEtiquetas, comboPonentes=comboPonentes, comboEventos=comboEventos, comboFormatos=comboFormatos)
	
@app.route('/ver_contenido/<id>')
def show_content(id):
	conexionBBDD=configuracion.conexion()
	cursor= conexionBBDD.cursor()
	contenido = BBDDCampusOpenData.obtenContenidoPorID4Jinja(id, cursor)
	cursor.close()
	conexionBBDD.close()
	if contenido:
		return render_template('showContent.html', contenido=contenido)
	else:
		return render_template('error_document_template.html')


	
