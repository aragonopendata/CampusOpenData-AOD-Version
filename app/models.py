# -*- coding: utf-8 -*-

class Tema:
	'Clase Tema para la aplicación Campus Open Data'
	def __init__(self, id, nombre):
		self.id=id
		self.nombre=nombre
#		print 'Se crea el tema ', str(self)
#	def __del__(self):
#		print 'Se destruye el tema ', str(self)
	def __str__(self):
		return 'Tema (%d, %s)' % (self.id, self.nombre)
	def __cmp__(self, other):
		class_name = self.__class__.__name__
		other_class_name = other.__class__.__name__
		if class_name == other_class_name:
			if self.id == other.id:
				if self.nombre < other.nombre:  # compare nombre value (should be unique)
					return -1
				elif self.nombre > other.nombre:
					return 1
				else: return 0              # should mean it's the same instance
			else: return 1
		else: return -1
     
class Plataforma:
	'Clase Plataforma para la aplicación Campus Open Data'
	def __init__(self, id, nombre):
		self.id=id
		self.nombre=nombre
#		print 'Se crea la plataforma ', str(self)
#	def __del__(self):
#		print 'Se destruye la plataforma ', str(self)
	def __str__(self):
		return 'Plataforma (%d, %s)' % (self.id, self.nombre)
	def __cmp__(self, other):
		class_name = self.__class__.__name__
		other_class_name = other.__class__.__name__
		if class_name == other_class_name:
			if self.id == other.id:
				if self.nombre < other.nombre:  # compare nombre value (should be unique)
					return -1
				elif self.nombre > other.nombre:
					return 1
				else: return 0              # should mean it's the same instance
			else: return 1
		else: return -1
     
class Formato:
	'Clase Formato para la aplicación Campus Open Data'
	def __init__(self, id, nombre):
		self.id=id
		self.nombre=nombre
#		print 'Se crea el formato ', str(self)
#	def __del__(self):
#		print 'Se destruye el formato ', str(self)
	def __str__(self):
		return 'Formato (%d, %s)' % (self.id, self.nombre)
	def __cmp__(self, other):
		class_name = self.__class__.__name__
		other_class_name = other.__class__.__name__
		if class_name == other_class_name:
			if self.id == other.id:
				if self.nombre < other.nombre:  # compare nombre value (should be unique)
					return -1
				elif self.nombre > other.nombre:
					return 1
				else: return 0              # should mean it's the same instance
			else: return 1
		else: return -1
     
class Tipo:
	'Clase Tipo para la aplicación Campus Open Data'
	def __init__(self, id, nombre):
		self.id=id
		self.nombre=nombre
#		print 'Se crea el tipo ', str(self)
#	def __del__(self):
#		print 'Se destruye el tipo ', str(self)
	def __str__(self):
		return 'Tipo (%d, %s)' % (self.id, self.nombre)
	def __cmp__(self, other):
		class_name = self.__class__.__name__
		other_class_name = other.__class__.__name__
		if class_name == other_class_name:
			if self.id == other.id:
				if self.nombre < other.nombre:  # compare nombre value (should be unique)
					return -1
				elif self.nombre > other.nombre:
					return 1
				else: return 0              # should mean it's the same instance
			else: return 1
		else: return -1     

class Evento:
	'Clase Evento para la aplicación Campus Open Data'
	def __init__(self, id, nombre, lugar, descripcion, fecha):
		self.id=id
		self.nombre=nombre
		self.lugar=lugar
		self.descripcion=descripcion
		self.fecha=fecha
#		print 'Se crea el Evento ', str(self)
#	def __del__(self):
#		print 'Se destruye el Evento ', str(self)
	def __str__(self):
		return 'Evento (%d, %s, %s, %s, %s)' % (self.id, self.nombre, self.lugar, self.descripcion, self.fecha)
	def __cmp__(self, other):
		class_name = self.__class__.__name__
		other_class_name = other.__class__.__name__
		if class_name == other_class_name:
			if self.id == other.id:
				if self.nombre < other.nombre:  # compare nombre value (should be unique)
					return -2
				elif self.nombre > other.nombre:
					return 2
				else:
					if self.lugar < other.lugar:
						return -3
					elif self.lugar > other.lugar:
						return 3
					else:
						if self.descripcion < other.descripcion:
							return -4
						elif self.descripcion > other.descripcion:
							return 4
						else:
							if self.fecha < other.fecha:
								return -5
							elif self.fecha > other.fecha:
								return 5
							else:
								return 0
			else: return 1
		else: return -1
		
class Contenido:
	'Clase Contenido para la aplicación Campus Open Data'
	def __init__(self, id, titulo, descripcion, formato, tipo, evento, aparece, url, plataforma, thumbnail, temas):
		self.id = id
		self.titulo = titulo
		self.descripcion = descripcion
		self.formato = formato
		self.tipo = tipo
		self.evento = evento
		self.aparece = aparece
		self.url = url
		self.plataforma = plataforma
		self.thumbnail = thumbnail
		self.temas = temas
#		print 'Se creo el Contenido ', str(self)		
#	def __del__(self):
#		print 'Se destruye el Contenido ', str(self)
	def __str__(self):
		return 'Contenido (%d, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)' % (self.id, self.titulo, self.descripcion, str(self.formato), str(self.tipo), str(self.evento), self.aparece, self.url, str(self.plataforma), self.thumbnail, str(self.temas))
	def __cmp__(self, other):
		class_name = self.__class__.__name__
		other_class_name = other.__class__.__name__
		if class_name == other_class_name:
			if self.id == other.id:
				if self.titulo < other.titulo:
					return -2
				elif self.titulo > other.titulo:
					return 2
				else:
					if self.descripcion < other.descripcion:
						return -3
					elif self.descripcion > other.descripcion:
						return 3
					else:
						if self.formato < other.formato:
							return -4
						elif self.formato > other.formato:
							return 4
						else:
							if self.tipo < other.tipo:
								return -5
							elif self.tipo > other.tipo:
								return 5
							else:
								if self.evento < other.evento:
									return -6
								elif self.evento > other.evento:
									return 6
								else:
									if self.aparece < other.aparece:
										return -7
									elif self.aparece > other.aparece:
										return 7
									else:
										if self.url < other.url:
											return -8
										elif self.url > other.url:
											return 8
										else:
											if self.plataforma < other.plataforma:
												return -9
											elif self.plataforma > other.plataforma:
												return 9
											else:
												if self.thumbnail < other.thumbnail:
													return -9
												elif self.thumbnail > other.thumbnail:
													return 9
												else:
													if self.temas < other.temas:
														return -10
													elif self.temas > other.temas:
														return 10
													else:
														return 0
			else:
				return 1
		else:
			return -1
		
		
		
		
