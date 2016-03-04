--Estas son las consultas 

--Todo los formatos
SELECT id, nombre FROM formato ORDER BY nombre;

--Todo los tipos
SELECT id, nombre FROM tipo ORDER BY nombre;


--Todo los eventos
SELECT id, nombre FROM evento ORDER BY nombre;


--Todo los plataforma
SELECT id, nombre FROM plataforma ORDER BY nombre;

--Todo los temas
SELECT id, nombre FROM tema ORDER BY nombre;

--Temas mas vistos
SELECT nombre, count(contenido_tiene_tema.*)  FROM tema, contenido_tiene_tema WHERE contenido_tiene_tema.tema = tema.id GROUP BY nombre  ORDER BY  count(contenido_tiene_tema.*) DESC, nombre ;

--Plataformas con más contenidos
SELECT nombre, count(contenido.*)  FROM plataforma, contenido WHERE contenido.plataforma = plataforma.id GROUP BY nombre  ORDER BY  count(contenido.*) DESC, nombre ;

--Eventos con más contenidos
SELECT nombre, count(contenido.*)  FROM evento, contenido WHERE contenido.evento = evento.id GROUP BY nombre  ORDER BY  count(contenido.*) DESC, nombre ;

--Eventos con más tipos
SELECT nombre, count(contenido.*)  FROM tipo, contenido WHERE contenido.tipo = tipo.id GROUP BY nombre  ORDER BY  count(contenido.*) DESC, nombre ;

--Eventos con más formatos
SELECT nombre, count(contenido.*)  FROM formato, contenido WHERE contenido.formato = formato.id GROUP BY nombre  ORDER BY  count(contenido.*) DESC, nombre ;



--Seleccionamos un  tema, para saber si tenemos o no ese tema, para poder añadirlo
SELECT id FROM tema WHERE nombre = '';

--Todo los formatos
SELECT id FROM formato WHERE nombre = '';

--Todo los tipos
SELECT id FROM tipo WHERE nombre = '';


--Todo los eventos
SELECT id FROM evento WHERE nombre = '';


--Todo los plataforma
SELECT id FROM plataforma WHERE nombre = '';





--Obtenemos todo los datos de un contenido 
SELECT 
  contenido.id, 
  contenido.titulo, 
  contenido.descripcion, 
  formato.nombre AS "Formato", 
  tipo.nombre AS "Tipo", 
  evento.nombre AS "Nombre Evento", 
  evento.lugar AS "Lugar Evento", 
  evento.descripcion AS "Descripción Evento", 
  evento.fecha AS "Fecha Evento", 
  contenido.aparece, 
  contenido.url, 
  plataforma.nombre AS "Plataforma", 
  tema.nombre AS "Tema"
FROM 
  public.contenido, 
  public.contenido_tiene_tema, 
  public.tema, 
  public.tipo, 
  public.plataforma, 
  public.formato , 
  public.evento
WHERE 
  contenido.formato = formato.id AND
  contenido_tiene_tema.contenido = contenido.id AND
  contenido_tiene_tema.tema = tema.id AND
  tipo.id = contenido.tipo AND
  plataforma.id = contenido.plataforma AND
  evento.id = contenido.evento
ORDER BY evento.fecha DESC;


--Obtenemos todo los temas de para un contenido
SELECT 
  tema.nombre AS "Tema"
FROM 
  public.contenido, 
  public.contenido_tiene_tema, 
  public.tema
WHERE 
  contenido_tiene_tema.tema = tema.id AND
  contenido_tiene_tema.contenido = contenido.id AND
  contenido.id=1;

--Todo los ids de contenidos que tienen un tema
SELECT 
  contenido.id 
FROM 
  public.contenido, 
  public.contenido_tiene_tema, 
  public.tema
WHERE 
  contenido_tiene_tema.contenido = contenido.id AND
  tema.id = contenido_tiene_tema.tema AND
  tema.nombre = 'Open data';





