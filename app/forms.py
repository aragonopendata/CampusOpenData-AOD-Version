from flask.ext.wtf import Form
from wtforms import StringField, TextAreaField, FormField, FieldList
from wtforms.validators import DataRequired, Regexp, Length, URL
 


class formatoForm(Form):
	nombre = StringField('Nombre', validators=[DataRequired(), Length(min=3, max=50)])

class tipoForm(Form):
	nombre = StringField('Nombre', validators=[DataRequired(), Length(min=3, max=50)])
	
class eventoForm(Form):
	nombre = StringField('Nombre', validators=[DataRequired(), Length(min=3, max=50)])
	lugar = StringField('Lugar')
	descripcion = TextAreaField('Descripci&oacute;n')
	fecha = StringField('Fecha', validators=[DataRequired()])

class plataformaForm(Form):
	nombre = StringField('Plataforma', validators=[DataRequired(), Length(min=3, max=50)])

class temaForm(Form):
	tema = StringField('Tema', validators=[Length(max=50)])

class addContentForm(Form):
	titulo = StringField('T&iacute;tulo', validators=[DataRequired(), Length(min=3, max=50)])
	descripcion = TextAreaField('Descripci&oacute;n')
	formato=FormField(formatoForm)
	tipo=FormField(tipoForm)
	evento=FormField(eventoForm)
	ponente = StringField('Ponente', validators=[DataRequired(), Length(min=3, max=50)])
	url = StringField('URL', validators=[DataRequired(), Length(min=5), URL(message='Se debe introducir una URL')])
	plataforma = FormField(plataformaForm)
	thumbnail = StringField('Thumbnail', validators=[DataRequired(), Length(min=5)])
	temas = FieldList(FormField(temaForm), min_entries=5)
	
	
class PruebaForm(Form):
	nombre = StringField('nOmbre', validators=[DataRequired(), Length(min=3, max=30)])
	descripcion = StringField('descripcion')
	fecha = StringField('fecha')
	url = StringField('URL', validators=[DataRequired(), Length(min=5), URL(message='Se debe introducir una URL')])
	formato=FormField(formatoForm)
	titulo = StringField('T&iacute;tulo', validators=[DataRequired(), Length(min=3, max=50)])
