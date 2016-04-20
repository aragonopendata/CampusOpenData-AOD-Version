# -*- coding: utf-8 -*-

import config as configuracion


from models import *


#Método que devuelve El string en el que modificamos los caracteres "raros" por (pseudo)etiquetas de HTML
def meteEtiquetaHTML(frase_cambiar):
	devolver =frase_cambiar.replace('á', '&aacute;').replace('é', '&eacute;').replace('í', '&iacute;').replace('ó', '&oacute;').replace('ú', '&uacute;').replace('Á', '&Aacute;').replace('É', '&Eacute;').replace('Í', '&Iacute;').replace('Ó', '&Oacute;').replace('Ú', '&Uacute;').replace('"', '&quot;').replace('<', '&lt;').replace('>', '&gt;').replace('¿', '&iquest;').replace('¡', '&iexcl;').replace('Ñ', '&Ntilde;').replace('ñ', '&ntilde;').replace('º', '&ordm;').replace('ª', '&ordf;').replace('#', '&almohadilla;')
	return devolver


#------------------------------------------------------------------------------#
#       Metodos para Temas en el campus OpenData apara su manejo en bbdd       #
#------------------------------------------------------------------------------#

#Método que devuelve el id de un tema si esta guardado en la base de datos
#Se devuelve el id del tema, en caso de no haberlo se devuelve 0 
def hayTema(tema, cursor):
	consulta = "SELECT id FROM tema WHERE nombre = '"+tema.strip()+"';"
	q=cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
		for resultado in resultados:
			return resultado[0]
	else:
		return 0

#Método que devuelve un objeto tema obtenido de la base de datos a traves de su id
def obtenTemaPorID(ide, cursor):
	consulta = "SELECT id, nombre FROM tema WHERE id = '"+str(ide)+"';"
	cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
		for resultado in resultados:
			devolver = Tema(resultado[0], resultado[1]) 
			return devolver
	else:
		print 'No hay tema con el id '+str(ide)
		return 0

#Método que devuelve un objeto tema obtenido de la base de datos a traves de su id con los caractes raros metidos como pseudoetiquetas de html para que no nos de error UnicodeDecodeError
def obtenTemaPorID4Jinja(ide, cursor):
	consulta = "SELECT id, nombre FROM tema WHERE id = '"+str(ide)+"';"
	cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
		for resultado in resultados:
			devolver = Tema(resultado[0], meteEtiquetaHTML(resultado[1])) 
			return devolver
	else:
		print 'No hay tema con el id '+str(ide)
		return 0

#Método que inserta el y devuelve el objeto, si el tema existe en la base de datos devuelve el objeto 
def insertaTema(tema, conexion):
	cursor = conexion.cursor()
	hay=hayTema(tema, cursor)
	if (hay==0) or (hay==None):
		consulta = "INSERT INTO tema (nombre) VALUES ('"+tema.strip().replace("'", "''")+"');"
		cursor.execute(consulta)
		conexion.commit()	
		devolver = Tema(hayTema(tema, cursor), tema.strip())
		return devolver	
	else:
		devolver = Tema(hayTema(tema, cursor), tema.strip())
		return devolver

#Método que nos devuelve en un array los ids de temas para un contenido
def temasDeContenido(idContenido, cursor):
	devolver=[]
	
	consulta="SELECT tema.id FROM public.contenido, public.contenido_tiene_tema, public.tema WHERE contenido_tiene_tema.contenido = contenido.id AND tema.id = contenido_tiene_tema.tema AND contenido.id = "+str(idContenido)+";"
	q=cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
		for resultado in resultados:
			devolver.append(resultado[0])
	return devolver
	
		
#Método que se da un tema y devuelve los ids de los contenidos que tiene este tema, si devuelve 0 no hay tema en la base de datos			
def contenidosConTema(tema, cursor):
	devolver=[]
	if (hayTema(tema, cursor)>0):
		consulta="SELECT contenido.id FROM public.contenido, public.contenido_tiene_tema, public.tema WHERE contenido_tiene_tema.contenido = contenido.id AND tema.id = contenido_tiene_tema.tema AND tema.nombre = '"+tema.strip()+"';"
		q=cursor.execute(consulta)
		resultados = cursor.fetchall()
		if resultados is not None:
			for resultado in resultados:
				devolver.append(resultado[0])
	return devolver
	



#Método que nos devuelve todo los temas que hay en la base de datos
def todoLosTemas(cursor):
	devolver = []
	consulta="SELECT id, nombre FROM tema ORDER BY nombre;"
	q=cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
			for resultado in resultados:
				devolver.append(meteEtiquetaHTML(resultado[1]))
	return devolver





#------------------------------------------------------------------------------#
#    Metodos para Plataformas en el campus OpenData apara su manejo en bbdd    #
#------------------------------------------------------------------------------#


#Método que devuelve el id de una plataforma si esta guardado en la base de datos
#Se devuelve el id de la plataforma, en caso de no haberlo se devuelve 0 
def hayPlataforma(plataforma, cursor):
	consulta = "SELECT id FROM plataforma WHERE nombre = '"+plataforma.strip()+"';"
	q=cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
		for resultado in resultados:
			return resultado[0]
	else:
		return 0


#Método que devuelve un objeto plataforma obtenido de la base de datos a traves de su id
def obtenPlataformaPorID(ide, cursor):
	consulta = "SELECT id, nombre FROM plataforma WHERE id = '"+str(ide)+"';"
	cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
		for resultado in resultados:
			devolver = Plataforma(resultado[0], resultado[1]) 
			return devolver
	else:
		print 'No hay plataforma con el id '+str(ide)
		return 0

#Método que devuelve un objeto plataforma obtenido de la base de datos a traves de su id
def obtenPlataformaPorID4Jinja(ide, cursor):
	consulta = "SELECT id, nombre FROM plataforma WHERE id = '"+str(ide)+"';"
	cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
		for resultado in resultados:
			devolver = Plataforma(resultado[0], meteEtiquetaHTML(resultado[1])) 
			return devolver
	else:
		print 'No hay plataforma con el id '+str(ide)
		return 0

#Método que inserta el y devuelve el objeto, si el plataforma existe en la base de datos devuelve el objeto 
def insertaPlataforma(plataforma, conexion):
	cursor = conexion.cursor()
	hay=hayPlataforma(plataforma, cursor)
	if (hay==0) or (hay==None):
		consulta = "INSERT INTO plataforma (nombre) VALUES ('"+plataforma.strip().replace("'", "''")+"');"
		cursor.execute(consulta)
		conexion.commit()	
		devolver = Plataforma(hayPlataforma(plataforma, cursor), plataforma.strip())
		return devolver	
	else:
		devolver = Plataforma(hayPlataforma(plataforma, cursor), plataforma.strip())
		return devolver

	
#Método que se da una plataforma y devuelve los ids de los contenidos que tiene esta plataforma, si devuelve 0 no hay plataforma en la base de datos			
def contenidosConPlataforma(plataforma, cursor):
	devolver=[]
	if (hayPlataforma(plataforma, cursor)>0):
		consulta="SELECT contenido.id FROM plataforma, contenido WHERE contenido.plataforma AND plataforma.nombre = '"+plataforma.strip()+"';"
		q=cursor.execute(consulta)
		resultados = cursor.fetchall()
		if resultados is not None:
			for resultado in resultados:
				devolver.append(resultado[0])
	return devolver
	


#Método que nos devuelve toda las plataformas que hay en la base de datos
def todaLasPlataformas(cursor):
	devolver = []
	consulta="SELECT id, nombre FROM plataforma ORDER BY nombre;"
	q=cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
			for resultado in resultados:
				devolver.append(meteEtiquetaHTML(resultado[1]))
#				devolver.append(resultado[1])
	return devolver




#------------------------------------------------------------------------------#
#       Metodos para Tipos en el campus OpenData apara su manejo en bbdd       #
#------------------------------------------------------------------------------#


#Método que devuelve el id de un tipo si esta guardado en la base de datos
#Se devuelve el id de la tipo, en caso de no haberlo se devuelve 0 
def hayTipo(tipo, cursor):
	consulta = "SELECT id FROM tipo WHERE nombre = '"+tipo.strip()+"';"
	q=cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
		for resultado in resultados:
			return resultado[0]
	else:
		return 0


#Método que devuelve un objeto tipo obtenido de la base de datos a traves de su id
def obtenTipoPorID(ide, cursor):
	consulta = "SELECT id, nombre FROM tipo WHERE id = '"+str(ide)+"';"
	cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
		for resultado in resultados:
			devolver = Tipo(resultado[0], resultado[1]) 
			return devolver
	else:
		print 'No hay tipo con el id '+str(ide)
		return 0


#Método que devuelve un objeto tipo obtenido de la base de datos a traves de su id
def obtenTipoPorID4Jinja(ide, cursor):
	consulta = "SELECT id, nombre FROM tipo WHERE id = '"+str(ide)+"';"
	cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
		for resultado in resultados:
			devolver = Tipo(resultado[0], meteEtiquetaHTML(resultado[1])) 
			return devolver
	else:
		print 'No hay tipo con el id '+str(ide)
		return 0

#Método que inserta el y devuelve el objeto, si el tipo existe en la base de datos devuelve el objeto 
def insertaTipo(tipo, conexion):
	cursor = conexion.cursor()
	hay=hayTipo(tipo, cursor)
	if (hay==0) or (hay==None):
		consulta = "INSERT INTO tipo (nombre) VALUES ('"+tipo.strip().replace("'", "''")+"');"
		cursor.execute(consulta)
		conexion.commit()	
		devolver = Tipo(hayTipo(tipo, cursor), tipo.strip())
		return devolver	
	else:
		devolver = Tipo(hayTipo(tipo, cursor), tipo.strip())
		return devolver

	
#Método que se da un tipo y devuelve los ids de los contenidos que tiene este tipo, si devuelve 0 no hay tipo en la base de datos			
def contenidosConTipo(tipo, cursor):
	devolver=[]
	if (hayTipo(tipo, cursor)>0):
		consulta="SELECT contenido.id FROM tipo, contenido WHERE contenido.tipo AND tipo.nombre = '"+tipo.strip()+"';"
		q=cursor.execute(consulta)
		resultados = cursor.fetchall()
		if resultados is not None:
			for resultado in resultados:
				devolver.append(resultado[0])
	return devolver
	


#Método que nos devuelve todo los tipos que hay en la base de datos
def todoLosTipos(cursor):
	devolver = []
	consulta="SELECT DISTINCT nombre FROM tipo ORDER BY nombre;"
	q=cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
			for resultado in resultados:
				devolver.append(meteEtiquetaHTML(resultado[0]))
#				devolver.append(resultado[0])
	return devolver




#------------------------------------------------------------------------------#
#     Metodos para Formatos en el campus OpenData apara su manejo en bbdd      #
#------------------------------------------------------------------------------#


#Método que devuelve el id de un formato si esta guardado en la base de datos
#Se devuelve el id de la formato, en caso de no haberlo se devuelve 0 
def hayFormato(formato, cursor):
	consulta = "SELECT id FROM formato WHERE nombre = '"+formato.strip()+"';"
	q=cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
		for resultado in resultados:
			return resultado[0]
	else:
		return 0


#Método que devuelve un objeto formato obtenido de la base de datos a traves de su id
def obtenFormatoPorID(ide, cursor):
	consulta = "SELECT id, nombre FROM formato WHERE id = '"+str(ide)+"';"
	cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
		for resultado in resultados:
			devolver = Formato(resultado[0], resultado[1]) 
			return devolver
	else:
		return 0


#Método que devuelve un objeto formato obtenido de la base de datos a traves de su id
def obtenFormatoPorID4Jinja(ide, cursor):
	consulta = "SELECT id, nombre FROM formato WHERE id = '"+str(ide)+"';"
	cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
		for resultado in resultados:
			devolver = Formato(resultado[0], meteEtiquetaHTML(resultado[1])) 
			return devolver
	else:
		return 0



#Método que inserta el y devuelve el objeto, si el formato existe en la base de datos devuelve el objeto 
def insertaFormato(formato, conexion):
	cursor = conexion.cursor()
	hay=hayFormato(formato, cursor)
	if (hay==0) or (hay==None):
		consulta = "INSERT INTO formato (nombre) VALUES ('"+formato.strip().replace("'", "''")+"');"
		cursor.execute(consulta)
		conexion.commit()	
		devolver = Formato(hayFormato(formato, cursor), formato.strip())
		return devolver	
	else:
		devolver = Formato(hayFormato(formato, cursor), formato.strip())
		return devolver

	
#Método que se da un formato y devuelve los ids de los contenidos que tiene este formato, si devuelve 0 no hay formato en la base de datos			
def contenidosConFormato(formato, cursor):
	devolver=[]
	if (hayFormato(formato, cursor)>0):
		consulta="SELECT contenido.id FROM formato, contenido WHERE contenido.formato AND formato.nombre = '"+formato.strip()+"';"
		q=cursor.execute(consulta)
		resultados = cursor.fetchall()
		if resultados is not None:
			for resultado in resultados:
				devolver.append(resultado[0])
	return devolver
	


#Método que nos devuelve todo los formatos que hay en la base de datos
def todoLosFormatos(cursor):
	devolver = []
	consulta="SELECT id, nombre FROM formato ORDER BY nombre;"
	q=cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
			for resultado in resultados:
				devolver.append(meteEtiquetaHTML(resultado[1]))
#				devolver.append(resultado[1])
	return devolver



#------------------------------------------------------------------------------#
#      Metodos para Evento en el campus OpenData apara su manejo en bbdd       #
#------------------------------------------------------------------------------#


#Método que devuelve el id de un evento si esta guardado en la base de datos
#Se devuelve el id de la evento, en caso de no haberlo se devuelve 0 
def hayEvento(evento, cursor, fecha=None):
	if (fecha):
		consulta = "SELECT id FROM evento WHERE nombre = '"+evento.strip()+" AND fecha = '"+fecha.strip()+";"
	else:
		consulta = "SELECT id FROM evento WHERE nombre = '"+evento.strip()+"';"
	q=cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
		for resultado in resultados:
			return resultado[0]
	else:
		return 0

#Método que devuelve un objeto evento obtenido de la base de datos a traves de su id
def obtenEventoPorID(ide, cursor):
	consulta = "SELECT id, nombre, lugar, descripcion, fecha FROM evento WHERE id = '"+str(ide)+"';"
	cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
		for resultado in resultados:
			devolver = Evento(resultado[0], resultado[1], resultado[2], resultado[3], resultado[4]) 
			return devolver
	else:
		print 'No hay evento con el id '+str(ide)
		return 0

#Método que devuelve un objeto evento obtenido de la base de datos a traves de su id
def obtenEventoPorID4Jinja(ide, cursor):
	consulta = "SELECT id, nombre, lugar, descripcion, fecha FROM evento WHERE id = '"+str(ide)+"';"
	cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
		for resultado in resultados:
			devolver = Evento(resultado[0], meteEtiquetaHTML(resultado[1]), meteEtiquetaHTML(resultado[2]), meteEtiquetaHTML(resultado[3]), meteEtiquetaHTML(resultado[4])) 
			return devolver
	else:
		print 'No hay evento con el id '+str(ide)
		return 0


#Método que inserta el y devuelve el objeto, si el evento existe en la base de datos devuelve el objeto 
def insertaEvento(nombre, lugar, descripcion, fecha, conexion):
	cursor = conexion.cursor()
	hay=hayEvento(nombre, cursor, fecha)
	if (hay==0) or (hay==None):
		consulta = "INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('"+nombre.strip().replace("'", "''")+"', '"+lugar.strip().replace("'", "''")+"', '"+descripcion.strip().replace("'", "''")+"', '"+fecha.strip().replace("'", "''")+"');"
		cursor.execute(consulta)
		conexion.commit()	
		devolver = Evento(nombre.strip(), lugar.strip(), descripcion.strip(), fecha.strip())
		return devolver	
	else:
		devolver = obtenEventoPorID(hayEvento(nombre.strip(), cursor, fecha), cursor)
		return devolver

	
#Método que se da un evento y devuelve los ids de los contenidos que tiene este evento, si devuelve 0 no hay evento en la base de datos			
def contenidosConEvento(evento, fecha, cursor):
	devolver=[]
	if (hayEvento(evento, cursor, fecha)>0):
		consulta="SELECT contenido.id FROM evento, contenido WHERE contenido.evento AND evento.nombre = '"+evento.strip()+"';"
		q=cursor.execute(consulta)
		resultados = cursor.fetchall()
		if resultados is not None:
			for resultado in resultados:
				devolver.append(resultado[0])
	return devolver
	


#Método que nos devuelve todo los eventos que hay en la base de datos
def todoLosEventos(cursor):
	devolver = []
	consulta="SELECT DISTINCT nombre FROM evento ORDER BY nombre;"
	q=cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
			for resultado in resultados:
				devolver.append(meteEtiquetaHTML(resultado[0]))
#				devolver.append(resultado[0])
	return devolver


#------------------------------------------------------------------------------#
#    Metodos para Contenido en el campus OpenData apara su manejo en bbdd      #
#------------------------------------------------------------------------------#	
	
#Método que devuelve el id de un contenido si esta guardado en la base de datos
#Se devuelve el id de la contenido, en caso de no haberlo se devuelve 0 
def hayContenido(contenido_url, cursor):
	consulta = "SELECT id FROM contenido WHERE url = '"+contenido_url.strip()+"';"
	q=cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
		for resultado in resultados:
			return resultado[0]
	else:
		return 0


#Método que devuelve un objeto contenido obtenido de la base de datos a traves de su id
def obtenContenidoPorID(ide, cursor):
	consulta = "SELECT id, titulo, descripcion, formato, tipo, evento, aparece, url, plataforma, thumbnail FROM contenido WHERE id = '"+str(ide)+"';"
	cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
		for resultado in resultados:
			idTemas = temasDeContenido(resultado[0], cursor)
			temas=[]
			for idTema in idTemas:
				temas.append(obtenTemaPorID(idTema, cursor))
			formato = obtenFormatoPorID(resultado[3], cursor)
			tipo=obtenTipoPorID(resultado[4], cursor)
			evento=obtenEventoPorID(resultado[5], cursor)
			plataforma=obtenPlataformaPorID(resultado[8], cursor)
			devolver = Contenido(resultado[0], resultado[1], resultado[2], formato, tipo, evento, resultado[6], resultado[7], plataforma, resultado[9], temas) 
			return devolver
	else:
		print 'No hay contenido con el id '+str(ide)
		return 0


#Método que devuelve un objeto contenido obtenido de la base de datos a traves de su id
def obtenContenidoPorID4Jinja(ide, cursor):
	consulta = "SELECT id, titulo, descripcion, formato, tipo, evento, aparece, url, plataforma, thumbnail FROM contenido WHERE id = '"+str(ide)+"';"
	cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
		for resultado in resultados:
			idTemas = temasDeContenido(resultado[0], cursor)
			temas=[]
			for idTema in idTemas:
				temas.append(obtenTemaPorID4Jinja(idTema, cursor))
			formato = obtenFormatoPorID4Jinja(resultado[3], cursor)
			tipo=obtenTipoPorID4Jinja(resultado[4], cursor)
			evento=obtenEventoPorID4Jinja(resultado[5], cursor)
			plataforma=obtenPlataformaPorID4Jinja(resultado[8], cursor)
			devolver = Contenido(resultado[0], meteEtiquetaHTML(resultado[1]), meteEtiquetaHTML(resultado[2]), formato, tipo, evento, meteEtiquetaHTML(resultado[6]), resultado[7], plataforma, resultado[9], temas) 
			return devolver
	else:
		print 'No hay contenido con el id '+str(ide)
		return 0

#Método que añade temas de un contenido a la tabla intermedia. Comprueba si tanto los temas como el contenido existen
def insertaTemasDeContenido(idContenido, arrayIdTemas, conexion):
	cursor = conexion.cursor()
	hay=obtenContenidoPorID(idContenido, cursor)
	if (hay!=0) or (hay):	
		for tema in arrayIdTemas:
			if (obtenTemaPorID(tema, cursor)!=0):
				consulta="INSERT INTO contenido_tiene_tema (contenido, tema) VALUES ("+str(idContenido)+", "+tema+");"	
				cursor.execute(consulta)
				conexion.commit()					
			else:
				print 'No hay tema en la base de datos con el id ' + str(tema)
				conexion.rollback()
				return 0
	else:
		print 'No hay contenido en la base de datos con el id '+str(idContenido)
		conexion.rollback()
		return 0
	#Si todo se ha insertado
	return 1


#Método que inserta el contenido y devuelve el objeto, si el contenido existe en la base de datos devuelve el objeto 
def insertaContenido(titulo, descripcion, idFormato, idTipo, idEvento, aparece, url, idPlataforma, thumbnail, arrayIdTemas, conexion):
	cursor = conexion.cursor()
	hay=hayContenido(url, cursor)
	if (hay==0) or (hay==None):
		if (obtenFormatoPorID(idFormato, cursor)!=0) and (obtenTipoPorID(idTipo, cursor)!=0) and (obtenEventoPorID(idEvento, cursor)>0) and (obtenPlataformaPorID(idPlataforma, cursor)!=0):
			consulta="INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('"+titulo.strip().replace("'", "''")+", '"+descripcion.strip().replace("'", "''")+"', "+str(idFormato)+", "+str(idTipo)+", "+str(idEvento)+", '"+aparece.strip()+"', '"+url.strip()+"', "+str(idPlataforma).replace("'", "''")+", '"+thumbnail.strip()+"');"
			cursor.execute(consulta)
			conexion.commit()
			idContenido=hayContenido(titulo.strip(), cursor)
			insertaTemasDeContenido(idContenido, arrayIdTemas, conexion)
			formato=obtenFormatoPorID(idFormato, cursor)
			tipo=obtenTipoPorID(idTipo, cursor)
			evento=obtenEventoPorID(idEvento, cursor)
			plataforma=obtenPlataformaPorID(idPlataforma, cursor)
			temas = []
			for idTema in arrayIdTemas:
				temas.append(obtenTemaPorID(idTema, cursor))
			devolver = Contenido(idContenido, titulo.strip(), descripcion.strip(), formato, tipo, evento, aparece.strip(), url.strip(), plataforma, thumbnail.strip())
			devolver.temas = temas
			return devolver
		else:
			print 'No se encuentran todo los datos'
			return 0
	else:
		devolver = obtenContenidoPorID(hayContenido(contenido, cursor), cursor)
		return devolver


#Método que inserta un contenido y todo sus campos a realizar
def insertaContenido(titulo, descripcion, nombreFormato, nombreTipo, nombreEvento, lugarEvento, descripcionEvento, fechaEvento, aparece, url, nombrePlataforma, thumbnail, arrayNombreTemas, conexion):
	cursor = conexion.cursor()
	formato=insertaFormato(nombreFormato, conexion)
	tipo=insertaTipo(nombreTipo, conexion)
	plataforma=insertaPlataforma(nombrePlataforma, conexion)
	evento=insertaEvento(nombreEvento, lugarEvento, descripcionEvento, fechaEvento, conexion)	
	arrayIdTemas=[]
	temas = []
	for nombreTema in arrayNombreTemas:
		tema = insertaTema(nombreTema,conexion)
		temas.append(tema)
		arrayIdTemas.append(tema.nombre)
	
	consulta="INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('"+titulo.strip().replace("'", "''")+"', '"+descripcion.strip().replace("'", "''")+"', "+str(formato.id)+", "+str(tipo.id)+", "+str(evento.id)+", '"+aparece.strip().replace("'", "''")+"', '"+url.strip().replace("'", "''")+"', "+str(plataforma.id)+", '"+thumbnail.strip().replace("'", "''")+"');"
	print 'La consulta es '+consulta
	cursor.execute(consulta)
	conexion.commit()
	idContenido=hayContenido(titulo.strip(), cursor)
	insertaTemasDeContenido(idContenido, arrayIdTemas, conexion)
	devolver = Contenido(idContenido, titulo.strip(), descripcion.strip(), formato, tipo, evento, aparece.strip(), url.strip(), plataforma, thumbnail.strip())
	devolver.temas = temas 
	return devolver

#Método que nos devuelve todo los contenidos que hay en la base de datos
def todoLosContenidos(cursor):
	devolver = []
	consulta="SELECT id, titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail FROM contenido ORDER BY nombre;"
	q=cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
			for resultado in resultados:
				formato = obtenFormatoPorID4Jinja(resultado[3], cursor)
				tipo=obtenTipoPorID4Jinja(resultado[4], cursor)
				evento =obtenEventoPorID4Jinja(resultado[5], cursor)
				plataforma = obtenPlataformaPorID4Jinja(resultado[8], cursor)
				idsTemas = temasDeContenido(resultado[0], cursor)
				temas = []
				for idTema in idsTemas:
					tema = obtenTemaPorID4Jinja(idTema, cursor)
					if (tema!=0):
						temas.append(tema)
				contenido = Contenido(resultado[0], meteEtiquetaHTML(resultado[1]), meteEtiquetaHTML(resultado[2]), formato, tipo, evento, meteEtiquetaHTML(resultado[6]), resultado[7], plataforma, resultado[8])
				contenido.temas = temas
				devolver.append(contenido)
	return devolver

#Método que sirve que muesta los diferentes 
def todoLosPonentes(cursor):
	devolver = []
	consulta = "SELECT DISTINCT aparece FROM public.contenido ORDER BY aparece;"
	q=cursor.execute(consulta)
	resultados = cursor.fetchall()
	if resultados is not None:
		for resultado in resultados:
			devolver.append(meteEtiquetaHTML(resultado[0]))
#			devolver.append(resultado[0])
	return devolver

#Método que sirve para filtrar los contenidos dado los datos
def filtraContenido(cursor, filtroTipo=None, filtroEtiqueta=None, filtroPonente=None, filtroNombreEvento=None, filtroFormato=None, filtroPlataforma=None):
	devolver=[]
	tablas = "FROM public.contenido"
	condicion = ""
	
	if (filtroTipo):
		tablas = tablas + ", public.tipo"
		if len(condicion)==0:
			condicion = "tipo.id = contenido.tipo AND tipo.nombre = '"+str(filtroTipo).strip().replace("'", "''")+"'"
		else:
			condicion = condicion +" AND tipo.id = contenido.tipo AND tipo.nombre = '"+str(filtroTipo).strip().replace("'", "''")+"'"
	if (filtroEtiqueta):
		tablas = tablas + ", public.tema, public.contenido_tiene_tema"
		if len(condicion)==0:
			condicion = "tema.id = contenido_tiene_tema.tema AND contenido_tiene_tema.contenido = contenido.id AND tema.nombre = '"+str(filtroEtiqueta).strip().replace("'", "''")+"'"
		else:
			condicion = condicion +" AND tema.id = contenido_tiene_tema.tema AND contenido_tiene_tema.contenido = contenido.id AND tema.nombre = '"+str(filtroEtiqueta).strip()+"'"
	if (filtroPonente):
		if len(condicion)==0:
			condicion = "contenido.aparece = '"+str(filtroPonente).strip().replace("'", "''")+"'"
		else:
			condicion = condicion +" AND contenido.aparece = '"+str(filtroPonente).strip().replace("'", "''")+"'"
	if (filtroNombreEvento):
		tablas = tablas + ", public.evento"
		if len(condicion)==0:
			condicion = "evento.id = contenido.evento AND evento.nombre = '"+str(filtroNombreEvento).strip().replace("'", "''")+"'"
		else:
			condicion = condicion + " AND evento.id = contenido.evento AND evento.nombre = '"+str(filtroNombreEvento).strip().replace("'", "''")+"'"
	if (filtroFormato):
		tablas = tablas + ", public.formato"
		if len(condicion)==0:
			condicion = "formato.id = contenido.formato AND formato.nombre = '"+str(filtroFormato).strip().replace("'", "''")+"'"
		else:
			condicion = condicion + " AND formato.id = contenido.formato AND formato.nombre = '"+str(filtroFormato).strip().replace("'", "''")+"'"
	if (filtroPlataforma):
		tablas = tablas + ", public.plataforma"
		if len(filtroPlataforma)==0:
			condicion = "plataforma.id = contenido.plataforma AND plataforma.nombre = '"+str(filtroPlataforma).strip().replace("'", "''")+"'"
		else:
			condicion = condicion + " AND plataforma.id = contenido.plataforma AND plataforma.nombre = '"+str(filtroPlataforma).strip().replace("'", "''")+"'"
	consulta = "SELECT DISTINCT contenido.id " + tablas
	if len(condicion)>0:
		consulta = consulta +" WHERE "+ condicion
	print 'La CONSULTA queda: '+consulta
	q=cursor.execute(consulta)
	resultados = cursor.fetchall()
	idsContenidos = []
	if resultados is not None:
		for resultado in resultados:
			idsContenidos.append(resultado[0])
		
		
		if len(resultados)>0:
			consulta2 = "SELECT contenido.id FROM  public.contenido, public.evento WHERE evento.id = contenido.evento AND  contenido.id IN ("
			i=0
			for idContenido in idsContenidos:
				if (i<len(idsContenidos)-1):
					consulta2 = consulta2 + str(idContenido)+", "
				else:
					consulta2 = consulta2 + str(idContenido)+") ORDER BY evento.fecha DESC;"
				i=i+1
			q2=cursor.execute(consulta2)
			resultados2 = cursor.fetchall()
			if resultados2 is not None:
				for resultado2 in resultados2:
					devolver.append(obtenContenidoPorID4Jinja(resultado2[0], cursor))
	return devolver
	

#def main():
#	print 'Comienzo del test del core del Campus OpenData'
#	print 'Comienzo la configuracion'
#	conexion=configuracion.conexion()
#	cursor=conexion.cursor()
##	print 'Comienzo del test para los tema'
###	temas=todoLosTemas(cursor)
###	print 'Todo los temas son:'
###	for tema in temas:
###		print 'El tema es: '+str(tema)
##	
##	
##	print 'Comienzo del test para los eventos'
##	evento = obtenEventoPorID(1, cursor)
##	print 'El evento 1 es '+str(evento) 
##	
##	
##	print 'Comienzo del test para los eventos'
##	evento = obtenEventoPorID(1, cursor)
##	print 'El evento 1 es '+str(evento) 
##	
##	
##	
##	print 'Comienzo del test para los Contenidos'
##	contenido = obtenContenidoPorID(1, cursor)
##	print 'El evento 1 es '+str(contenido)
#	
#	
#	

##	print 'El array de temas'
##	arrayNombreTemas=['TemaEder', 'EderTema', 'ASDF', 'API', 'UK', 'APP', 'Transparencia']
##	print '-----------------------------------'
##	print 'Insertamos un contenido con todo los datos'
##	evento = insertaContenido('Contenido de Eder', 'Este es un contenido que se mete usando los métodos hechos para el core del campus', 'formatoEder', 'Movida chunga', 'El evento de Eder (como no)', 'Aquí donde estoy en Pignatelli', 'Este es un evento con una descripcion para el día 29/2/2016', '2016/02/29', 'Eder', 'localhost', 'Vimeo', 'el thumbnail de Eder', arrayNombreTemas, conexion)
##	print 'El evento creado es '+ str(evento)

##	contenido = obtenContenidoPorID(120, cursor)
##	print 'El contenido del último evento es:' +str(contenido)
##	print 'El nombre del evento es '+str(contenido.evento.nombre)
##	print 'Cerramos la conxion a la base de datos'
#	print 'Revisamos las búsquedas de datasets'
##	filtraContenido(cursor, filtroTipo=None, filtroEtiqueta=None, filtroPonente=None, filtroNombreEvento=None, filtroFormato=None)
#	resultados=filtraContenido(cursor, filtroNombreEvento='', filtroPonente='José Mª Subero', filtroEtiqueta='Open data', filtroFormato="Presentación")
#	if len(resultados)>0:
#		for resultado in resultados:
#			print resultado.titulo
#	else:
#		print 'No hay resultados'
#	cursor.close()
#	conexion.close()
#	print 'Final del test del core del Campus OpenData'
#	
#	
#main()
