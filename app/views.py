# -*- coding: utf-8 -*-

from flask import Flask
from flask import render_template, flash, redirect
from flask import request
from flask import session
from app import app
import BBDDCampusOpenData
import config as configuracion
from urllib import url2pathname
from .forms import PruebaForm, addContentForm
import json



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
#	print 'El filtro de tipo es '+ str(filtroTipo)
#	print 'El filtro de etiquetas es '+ str(filtroEtiqueta)
#	print 'El filtro de ponentes es '+ str(filtroPonente)
#	print 'El filtro de eventos es '+ str(filtroNombreEvento)
#	print 'El filtro de formatos es '+ str(filtroFormato)
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
	try:
		ide=int(id)
		conexionBBDD=configuracion.conexion()
		cursor= conexionBBDD.cursor()
		contenido = BBDDCampusOpenData.obtenContenidoPorID4Jinja(ide, cursor)
		cursor.close()
		conexionBBDD.close()
		if contenido:
			return render_template('showContent.html', contenido=contenido)
		else:
			return render_template('error_document_template.html', elerror='No hay contenido con id '+id)
	except ValueError: #Si no es un número, pintamos la plantilla de error
		return render_template('error_document_template.html', elerror='El id tiene que ser un n&uacute;mero')


@app.route('/pruebaForm', methods=['GET', 'POST'])
def pruebaForm():
	form = PruebaForm()
	if form.validate_on_submit():
		flash(u'Has metido como nombre="%s", como descripción=%s' % (form.nombre.data, form.descripcion.data))
		return redirect('/')
	return render_template('pruebaForm.html', title='Prueba formulario', form=form)

@app.route('/addContent', methods=['GET', 'POST'])
def addContent():
	form = addContentForm()
	
	if form.validate_on_submit():
		flash(u'Has metido como titulo="%s", como descripción=%s' % (form.titulo.data, form.descripcion.data))
		return redirect('/')
	return render_template('addContent.html', title='Formulario para meter contenido en el Campus Open Data', form=form)

@app.route("/api/plataformas")
def plataformas():
	conexionBBDD=configuracion.conexion()
	cursor= conexionBBDD.cursor()
	plataformas = BBDDCampusOpenData.todaLasPlataformas(cursor)
	devolver = []
	for plataforma in plataformas:
		pl = { 'nombre': plataforma}
		devolver.append(pl)
	return json.dumps(devolver)

@app.route("/api/temas")
def temas():
	conexionBBDD=configuracion.conexion()
	cursor= conexionBBDD.cursor()
	temas = BBDDCampusOpenData.todoLosTemas(cursor)
	devolver = []
	for tema in temas:
		pl = { 'nombre': tema}
		devolver.append(pl)
	return json.dumps(devolver)

@app.route("/api/tipos")
def tipos():
	conexionBBDD=configuracion.conexion()
	cursor= conexionBBDD.cursor()
	tipos = BBDDCampusOpenData.todoLosTipos(cursor)
	devolver = []
	for tipo in tipos:
		pl = { 'nombre': tipo}
		devolver.append(pl)
	return json.dumps(devolver)

@app.route("/api/formatos")
def formatos():
	conexionBBDD=configuracion.conexion()
	cursor= conexionBBDD.cursor()
	formatos = BBDDCampusOpenData.todoLosFormatos(cursor)
	devolver = []
	for formato in formatos:
		pl = { 'nombre': formato}
		devolver.append(pl)
	return json.dumps(devolver)


@app.route("/api/eventos")
def eventos():
	conexionBBDD=configuracion.conexion()
	cursor= conexionBBDD.cursor()
	eventos = BBDDCampusOpenData.todoLosEventos(cursor)
	devolver = []
	for evento in eventos:
		pl = { 'nombre': evento}
		devolver.append(pl)
	return json.dumps(devolver)


@app.route("/api/ponentes")
def ponentes():
	conexionBBDD=configuracion.conexion()
	cursor= conexionBBDD.cursor()
	ponentes = BBDDCampusOpenData.todoLosPonentes(cursor)
	devolver = []
	for ponente in ponentes:
		pl = { 'ponente': ponente}
		devolver.append(pl)
	return json.dumps(devolver)


    

	
	
@app.errorhandler(404)
def page_not_found(e):
	return render_template('error_document_template.html', elerror='No existe p&aacute;gina')
	
