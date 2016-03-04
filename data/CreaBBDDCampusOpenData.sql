--Comienza a realizar el dump de la base de datos

--Creamos la tabla de las plataforma
CREATE TABLE plataforma (
    id integer NOT NULL,
    nombre text
);


ALTER TABLE public.plataforma OWNER TO user_campusOpenData;

--Creamos la secuencia para el id plataforma
CREATE SEQUENCE plataforma_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plataforma_id_seq OWNER TO user_campusOpenData;
ALTER SEQUENCE plataforma_id_seq OWNED BY plataforma.id;
ALTER TABLE ONLY plataforma ALTER COLUMN id SET DEFAULT nextval('plataforma_id_seq'::regclass);
ALTER TABLE plataforma ADD CONSTRAINT pk_plataforma PRIMARY KEY (id);



INSERT INTO plataforma (nombre) VALUES ('Aragón Open Data');
INSERT INTO plataforma (nombre) VALUES ('bost.ocks.org');
INSERT INTO plataforma (nombre) VALUES ('GitHub');
INSERT INTO plataforma (nombre) VALUES ('Podcast');
INSERT INTO plataforma (nombre) VALUES ('Slideshare');
INSERT INTO plataforma (nombre) VALUES ('Vimeo');
INSERT INTO plataforma (nombre) VALUES ('Youtube');


--Creamos la tabla de eventos
CREATE TABLE evento (
    id integer NOT NULL,
    nombre text,
    lugar text,
    descripcion text,
    fecha text
);


ALTER TABLE public.evento OWNER TO user_campusOpenData;

--Creamos la secuencia para el id plataforma
CREATE SEQUENCE evento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evento_id_seq OWNER TO user_campusOpenData;
ALTER SEQUENCE evento_id_seq OWNED BY evento.id;
ALTER TABLE ONLY evento ALTER COLUMN id SET DEFAULT nextval('evento_id_seq'::regclass);
ALTER TABLE evento ADD CONSTRAINT pk_evento PRIMARY KEY (id);

INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('BIFI VII National Conference', 'Zaragoza', 'Conferencia organizada por el Instituto de Biocomputación y Física de Sistemas Complejos de la Universidad de Zaragoza como parte de sus actividades anuales de difusión', '2015/02/04');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('BIME HackDay', 'Bilbao', 'Evento para desarrolladores informáticos con Hackathon final organizado dentro del BIME Pro. Dirigido al desarrollo de aplicaciones dentro del sector musical, ya que BIME es un evento de la industria musical', '2014/10/31');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('Congreso derecho TICs SICARM2014', 'Murcia', 'Jornadas SICARM de Murcia, especializadas en el ámbito jurídico y su relación con las nuevas tecnologías de la información y la comunicación', '2014/10/23');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('Curso de verano "Datos y gobierno abierto"', 'Jaca', 'Curso de verano que tiene como objetivo reflexionar sobre las políticas de gobierno abierto y sobre la importancia de la apertura de la información de las administraciones como pieza clave para conseguir una transparencia y rendición de cuentas efectiva. El curso se celebró en Jaca en el marco de los cursos de verano de la Universidad de Zaragoza entre el 10 y el 12 de julio de 2013.', '2013/07/11');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('Curso de verano "Datos y gobierno abierto"', 'Jaca', 'Curso de verano que tiene como objetivo reflexionar sobre las políticas de gobierno abierto y sobre la importancia de la apertura de la información de las administraciones como pieza clave para conseguir una transparencia y rendición de cuentas efectiva. El curso se celebró en Jaca en el marco de los cursos de verano de la Universidad de Zaragoza entre el 10 y el 12 de julio de 2013.', '2013/07/10');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('Curso de verano "Datos y gobierno abierto"', 'Jaca', 'Curso de verano que tiene como objetivo reflexionar sobre las políticas de gobierno abierto y sobre la importancia de la apertura de la información de las administraciones como pieza clave para conseguir una transparencia y rendición de cuentas efectiva. El curso se celebró en Jaca en el marco de los cursos de verano de la Universidad de Zaragoza entre el 10 y el 12 de julio de 2013.', '2013/07/12');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('Curso online "Introducción a Open Data"', '', 'Curso destinado a servir de introducción a los principales elementos que componen una política de datos abiertos, se repasa el ecosistema open data a nivel nacional e internacional, los requisitos tecnológicos necesarios y los condicionantes legales existentes. Igualmente se introduce la iniciativa Aragón Open Data y se instruye en algunas de las herramientas existentes dentro de opendata.aragon.es', '2016/01/10');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('Despierta Aragón', 'Aragón Radio', '', '2016/02/19');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('El patrimonio cultural en Internet: balance y perspectivas', 'Jaca', 'La Catedra de Gestión Tecnológica Documental junto con la Universidad de Zaragoza crea un curso extraordinario sobre patrimonio cultural y la importancia de internet en su gestión', '2014/09/07');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('Foro de difusión interna "Aragón Open Data"', 'Zaragoza', 'Foro interno realizado en el Gobierno de Aragón con el fin de formar a los nuevos miembros del Gobierno incorporados a raíz de las elecciones autonómicas de 2015', '2015/10/15');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('Homer project and open data, Seville Conference', 'Sevilla', 'Evento celebrado dentro del proyecto europeo HOMER en el que Aragón Open Data participó junto con la empresa pública SARGA. El proyecto abordó la creación de un repositorio de datos abierto de carácter internacional con la intervención de países del Mediterráneo', '2013/05/15');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('Homer project, Limassol meeting', 'Limassol', 'Evento celebrado dentro del proyecto europeo HOMER en el que Aragón Open Data participó junto con la empresa pública SARGA. El proyecto abordó la creación de un repositorio de datos abierto de carácter internacional con la intervención de países del Mediterráneo', '2014/09/09');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('Homer project, Malta meeting', 'Malta', 'Evento celebrado dentro del proyecto europeo HOMER en el que Aragón Open Data participó junto con la empresa pública SARGA. El proyecto abordó la creación de un repositorio de datos abierto de carácter internacional con la intervención de países del Mediterráneo', '2014/03/11');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('I Congreso Open Government Avapol', 'Valencia', 'Evento organizado entorno a los tópicos que se encuentran dentro de las políticas de gobierno abierto', '2013/11/22');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('I Encuentro nacional de gobierno abierto y participación ciudadana', 'Gandía', 'Foro de Gobierno Abierto de la ciudad de Gandía para presentar las principales inciativas que se están realizando a nivel nacional', '2015/03/27');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('III Jornada de Gobierno Abierto y Open Data --OKioConf14', 'Sevilla', 'Tercera edición de las jornadas sobre gobierno y open data celebradas en la Universidad Pablo Olavide organizadas por el colectivo Open Kratio', '2014/02/22');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('Jacathon Aragón Open Data', 'Jaca', 'El Jacathon Aragón Open Data es un evento organizado por el Gobierno de Aragón para desarrolladores informáticos que pretende fomentar la comunidad alrededor de los datos. Se celebró del 26 al 28 de septiembre de 2014 en Jaca dentro de la programación de cursos extraordinarios de la Universidad de Zaragoza y contó con 60 profesionales que trabajaron con datos del catálogo de Aragón Open Data', '2014/09/27');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('Jacathon Aragón Open Data', 'Jaca', 'El Jacathon Aragón Open Data es un evento organizado por el Gobierno de Aragón para desarrolladores informáticos que pretende fomentar la comunidad alrededor de los datos. Se celebró del 26 al 28 de septiembre de 2014 en Jaca dentro de la programación de cursos extraordinarios de la Universidad de Zaragoza y contó con 60 profesionales que trabajaron con datos del catálogo de Aragón Open Data', '2014/09/28');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('Jornada "El nuevo marco normativo de la transparencia y la participación ciudadana en Aragón"', 'Zaragoza', 'Curso creado para formar a los empleados públicos del Gobierno de Aragón en los diferentes elementos jurídicos que conforman el marco normativo de transparencia y participación ciudadana en Aragón.', '2015/11/06');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('Jornada "Sector público y open data"', 'Valencia', 'Jornada sobre open data en el sector público, organizada por Gobernatia dentro de la Universidad Politécnica de Valencia y que aborda las oportunidades existentes en la reutilización y apertura de datos.', '2014/02/20');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('Jornada AGORA "Avanzando por un gobierno responsable y abierto"', 'Málaga', 'Evento organizado por la Diputación Provincial de Málaga que pretende ser un foro sobre los asuntos que es necesario abordar para una mejor gobernanza', '2013/10/16');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('Jornada de formación del INAP', 'Zaragoza', 'Conjunto de jornadas formativas organizadas dentro del Gobierno de Aragón para funcionarios de toda España en el seno de un curso de formación del INAP', '2014/05/13');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('Jornada de sensibilización RISP y open data', 'Madrid', 'Jornada realizada en el Ministerio de Justicia del Gobierno de España para sensibilizar en la apertura de datos del sector público', '2015/02/10');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('Jornada SICARM, Aspectos prácticos de Open Data', 'Murcia', 'Jornadas SICARM de Murcia, especializadas en el ámbito jurídico y su relación con las nuevas tecnologías de la información y la comunicación', '2014/10/22');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('OpenBudgets stakeholder workshop', 'Berlín', 'Workshop realizado con diferentes actores a nivel europeo interesados en la apertura de la información pública relativa a la actividad económica de las administraciones. El evento se celebró en Berlín dentro del proyecto europeo OpenBudgets', '2015/12/01');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('Presentación Aragón Open Data', 'Zaragoza', 'Evento destinado a la presentación pública de la iniciativa Aragón Open Data. Se realizó una introducción sobre la actualidad y las iniciativas existentes dentro del mundo de los datos abiertos y se presentaron los portales opendata.aragon.es y presupuesto.aragon.es', '2013/02/06');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('VI Seminario Radio y Red', 'Zaragoza', 'Congreso periodístico sobre la función de la radio y su presencia en Internet', '2013/11/21');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('Jornada "Un año de Aragón Open Data"', 'Zaragoza', 'Con motivo del primer aniversario del lanzamiento de la web de Aragón Open Data se realizó un evento en el que se mostraron las novedades que se preveían en el campo de los datos abiertos y en el que se presentaban los nuevos desarrollos dentro de opendata.aragon.es', '2014/02/06');
INSERT INTO evento (nombre, lugar, descripcion, fecha) VALUES ('Open Data Global Leaders'' Network at the Open Data Institute', 'Londres', 'La Global Leaders'' Network del Open Data Institute pretende ser una red global que aglutine a las iniciativas de datos abiertos más destacadas del mundo. El Open Data Institute se ofrece como nodo central de relación de las mismas y como plataforma para conseguir el mayor impacto para las iniciativas de Open Data.', '2016/02/26');





--Creamos la tabla de las Tema
CREATE TABLE tema (
    id integer NOT NULL,
    nombre text
);


ALTER TABLE public.tema OWNER TO user_campusOpenData;

--Creamos la secuencia para el id tema
CREATE SEQUENCE tema_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tema_id_seq OWNER TO user_campusOpenData;
ALTER SEQUENCE tema_id_seq OWNED BY tema.id;
ALTER TABLE ONLY tema ALTER COLUMN id SET DEFAULT nextval('tema_id_seq'::regclass);
ALTER TABLE tema ADD CONSTRAINT pk_tema PRIMARY KEY (id);

INSERT INTO tema (nombre) VALUES ('API');
INSERT INTO tema (nombre) VALUES ('APP');
INSERT INTO tema (nombre) VALUES ('Aragón Radio');
INSERT INTO tema (nombre) VALUES ('AragoPedia');
INSERT INTO tema (nombre) VALUES ('Buenas prácticas');
INSERT INTO tema (nombre) VALUES ('CartoDB');
INSERT INTO tema (nombre) VALUES ('CKAN');
INSERT INTO tema (nombre) VALUES ('Colaboración');
INSERT INTO tema (nombre) VALUES ('Crowdfunding');
INSERT INTO tema (nombre) VALUES ('Cuadro de mandos');
INSERT INTO tema (nombre) VALUES ('Curado de datos');
INSERT INTO tema (nombre) VALUES ('Curso');
INSERT INTO tema (nombre) VALUES ('D3j');
INSERT INTO tema (nombre) VALUES ('Datos personales');
INSERT INTO tema (nombre) VALUES ('Debate');
INSERT INTO tema (nombre) VALUES ('Ejemplo');
INSERT INTO tema (nombre) VALUES ('EPSI');
INSERT INTO tema (nombre) VALUES ('ETL');
INSERT INTO tema (nombre) VALUES ('Evento');
INSERT INTO tema (nombre) VALUES ('Experiencias');
INSERT INTO tema (nombre) VALUES ('Gestión de la Información');
INSERT INTO tema (nombre) VALUES ('Gobierno abierto');
INSERT INTO tema (nombre) VALUES ('Homer');
INSERT INTO tema (nombre) VALUES ('Innovación pública');
INSERT INTO tema (nombre) VALUES ('Interoperabilidad');
INSERT INTO tema (nombre) VALUES ('Mediawiki');
INSERT INTO tema (nombre) VALUES ('Metadatos');
INSERT INTO tema (nombre) VALUES ('Normativa');
INSERT INTO tema (nombre) VALUES ('Objetivos');
INSERT INTO tema (nombre) VALUES ('OCR');
INSERT INTO tema (nombre) VALUES ('OKF');
INSERT INTO tema (nombre) VALUES ('Open budget');
INSERT INTO tema (nombre) VALUES ('Open data');
INSERT INTO tema (nombre) VALUES ('Participación ciudadana');
INSERT INTO tema (nombre) VALUES ('Patrimonio');
INSERT INTO tema (nombre) VALUES ('Periodismo de datos');
INSERT INTO tema (nombre) VALUES ('Pizarra de adminitración');
INSERT INTO tema (nombre) VALUES ('Portal');
INSERT INTO tema (nombre) VALUES ('Presupuesto');
INSERT INTO tema (nombre) VALUES ('Redes');
INSERT INTO tema (nombre) VALUES ('Reutilización');
INSERT INTO tema (nombre) VALUES ('Scrapping');
INSERT INTO tema (nombre) VALUES ('Semántica');
INSERT INTO tema (nombre) VALUES ('Servicios');
INSERT INTO tema (nombre) VALUES ('Smart');
INSERT INTO tema (nombre) VALUES ('Social data');
INSERT INTO tema (nombre) VALUES ('Transparencia');
INSERT INTO tema (nombre) VALUES ('UK');
INSERT INTO tema (nombre) VALUES ('Visualizacion de datos');
INSERT INTO tema (nombre) VALUES ('Zaragoza');
INSERT INTO tema (nombre) VALUES ('Plataforma');


--Creamos la tabla de las formato
CREATE TABLE formato (
    id integer NOT NULL,
    nombre text
    
);


ALTER TABLE public.formato OWNER TO user_campusOpenData;

--Creamos la secuencia para el id tema
CREATE SEQUENCE formato_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formato_id_seq OWNER TO user_campusOpenData;
ALTER SEQUENCE formato_id_seq OWNED BY formato.id;
ALTER TABLE ONLY formato ALTER COLUMN id SET DEFAULT nextval('formato_id_seq'::regclass);
ALTER TABLE formato ADD CONSTRAINT pk_formato PRIMARY KEY (id);


INSERT INTO formato (nombre) VALUES ('Infografía');
INSERT INTO formato (nombre) VALUES ('Podcast');
INSERT INTO formato (nombre) VALUES ('Presentación');
INSERT INTO formato (nombre) VALUES ('Vídeo');




--Creamos la tabla de las tipo
CREATE TABLE tipo (
    id integer NOT NULL,
    nombre text
);


ALTER TABLE public.tipo OWNER TO user_campusOpenData;

--Creamos la secuencia para el id tipo
CREATE SEQUENCE tipo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_id_seq OWNER TO user_campusOpenData;
ALTER SEQUENCE tipo_id_seq OWNED BY tipo.id;
ALTER TABLE ONLY tipo ALTER COLUMN id SET DEFAULT nextval('tipo_id_seq'::regclass);
ALTER TABLE tipo ADD CONSTRAINT pk_tipo PRIMARY KEY (id);

INSERT INTO tipo (nombre) VALUES ('Curso');
INSERT INTO tipo (nombre) VALUES ('Debate');
INSERT INTO tipo (nombre) VALUES ('Entrevista');
INSERT INTO tipo (nombre) VALUES ('Gestión en Aragón Open Data');
INSERT INTO tipo (nombre) VALUES ('Información general');
INSERT INTO tipo (nombre) VALUES ('Ponencia');
INSERT INTO tipo (nombre) VALUES ('Presentación trabajo');
INSERT INTO tipo (nombre) VALUES ('Taller');
INSERT INTO tipo (nombre) VALUES ('Teaser');



--Creamos la tabla de las contenido
CREATE TABLE contenido (
    id integer NOT NULL,
    titulo text,
    descripcion text,
    formato integer NOT NULL,
    tipo integer NOT NULL,
    evento integer NOT NULL,
    aparece text,
    url text,
    plataforma integer NOT NULL,
    thumbnail text   
);


ALTER TABLE public.contenido OWNER TO user_campusOpenData;

--Creamos la secuencia para el id contenido
CREATE SEQUENCE contenido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.contenido_id_seq OWNER TO user_campusOpenData;
ALTER SEQUENCE contenido_id_seq OWNED BY contenido.id;
ALTER TABLE ONLY contenido ALTER COLUMN id SET DEFAULT nextval('contenido_id_seq'::regclass);

ALTER TABLE contenido ADD CONSTRAINT pk_contenido PRIMARY KEY (id);

ALTER TABLE contenido ADD CONSTRAINT fk_contenido_formato FOREIGN KEY (formato) REFERENCES formato (id);
ALTER TABLE contenido ADD CONSTRAINT fk_contenido_evento FOREIGN KEY (evento) REFERENCES evento (id);
ALTER TABLE contenido ADD CONSTRAINT fk_contenido_plataforma FOREIGN KEY (plataforma) REFERENCES plataforma (id);
ALTER TABLE contenido ADD CONSTRAINT fk_contenido_tipo FOREIGN KEY (plataforma) REFERENCES tipo (id);

INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('AragoPedia ', 'Descripción de la inciativa AragoPedia y objetivo perseguido con la misma', 1, 5, 28, 'NP', 'http://opendata.aragon.es/public/fotos-infografias/aragon_opendata_05aragopedia.jpg', 1, 'http://opendata.aragon.es/public/fotos-infografias/aragon_opendata_05aragopedia.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Buenas prácticas en la publicación de datos abiertos', 'Resumen de las 10+1 buenas prácticas que debe afrontar una iniciativa de apertura de datos de una administración pública', 1, 5, 28, 'NP', 'http://opendata.aragon.es/public/fotos-infografias/aragon_opendata_02buenas_practicas.jpg', 1, 'http://opendata.aragon.es/public/fotos-infografias/aragon_opendata_02buenas_practicas.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('¿Cómo funciona Aragón Open Data?', 'Proceso seguido en Aragón Open Data para materializar la apertura de la información pública', 1, 5, 28, 'NP', 'http://opendata.aragon.es/public/fotos-infografias/aragon_opendata_04func_interno_externo.jpg', 1, 'http://opendata.aragon.es/public/fotos-infografias/aragon_opendata_04func_interno_externo.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('¿Qué es Aragón Open Data?', 'Descubre qué es Arargón Open Data y cuales son los objetivos que se promueven con la liberación de los datos públicos', 1, 5, 28, 'NP', 'http://opendata.aragon.es/public/fotos-infografias/aragon_opendata_01que_es_aod.jpg', 1, 'http://opendata.aragon.es/public/fotos-infografias/aragon_opendata_01que_es_aod.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Objetivos Aragón Open Data', 'Explicación de los objetivos de Aragón Open Data al poner a disposición pública los datos del Gobierno de Aragón', 1, 5, 28, 'NP', 'http://opendata.aragon.es/public/fotos-infografias/aragon_opendata_03objetivos.jpg', 1, 'http://opendata.aragon.es/public/fotos-infografias/aragon_opendata_03objetivos.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Presupuestos Aragón', 'Resumen de la información ofrecida con la aplicación de visualización de presupuestos del Gobierno de Aragón presupuesto.aragon.es', 1, 5, 28, 'NP', 'http://opendata.aragon.es/public/fotos-infografias/aragon_opendata_07presupuestos.jpg', 1, 'http://opendata.aragon.es/public/fotos-infografias/aragon_opendata_07presupuestos.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Aragón Open Social Data', 'Breve descripción de qué es la iniciativa Aragón Open Social Data y de para qué sirve', 1, 5, 28, 'NP', 'http://opendata.aragon.es/public/fotos-infografias/aragon_opendata_06open_social_data.jpg', 1, 'http://opendata.aragon.es/public/fotos-infografias/aragon_opendata_06open_social_data.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Nube de tags de Jornada "Un año de Aragón Open data"', 'Nube de tags que recoge los términos más empleados en la presentación "Un año de Aragón Open Data"', 1, 5, 28, 'NP', 'http://opendata.aragon.es/public/fotos-infografias/aragon_opendata_nube_tags_jornada_AOD2.0.png', 1, 'http://opendata.aragon.es/public/fotos-infografias/aragon_opendata_nube_tags_jornada_AOD2.0.png');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('La apuesta aragonesa por el Open Data llega a un foro internacional', 'El Gobierno de Aragón trasladará a un foro internacional celebrado en Londres su apuesta por el Open Data o la política de datos abiertos, que consiste en poner a disposición de los ciudadanos, a través de Internet, el mayor número posible de datos de su interés. En esta entrevista de Aragón Radio da detalles José Subero, técnico del departamento de Innovación, Investigación y Universidad.', 2, 3, 8, 'José Mª Subero', 'http://podcasts.aragonradio2.com.s3.amazonaws.com/2016/2/20160219_12_26_La_apuesta_aragonesa_por_el_Open_Data_llega_a_un_foro_internacional.mp3', 4, 'http://www.aragonradio.es/images/logo-aragonradio.png');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Opening data at Gobierno de Aragón: Aragón Open Data', 'Introducción a las políticas de datos abiertos y de gobierno abierto, explicación de las principales tareas desarrolladas y de los servicios ofrecidos por Aragón Open Data', 3, 6, 1, 'José Mª Subero', 'http://www.slideshare.net/aragonopendata/bifi-vii-national-conference', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/josesuberocongresobifiaragnopendata-150202073628-conversion-gate02-thumbnail.jpg?cb=1422884414');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Otra forma de escuchar a través de Internet', 'Exposición de las funcionalidades el API de Aragón Open Social Data y ejemplos de utilización del mismo', 3, 8, 2, 'Gonzalo Ruiz', 'http://www.slideshare.net/aragonopendata/gonzalo-ruiz-bime', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/gonzaloruizbime-141103041659-conversion-gate02-thumbnail.jpg?cb=1415009847');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Extrayendo los datos en las administraciones públicas', 'Descripción de las funcionalidades tecnológicas que incorpora Aragón Open Data y presentación de los diferentes mecanismos de interrogación a los datos existentes: APIs y punto SPARQL', 3, 8, 2, 'José Mª Subero', 'http://www.slideshare.net/aragonopendata/bime-hackday-extrayendo-los-datos-en-las-administraciones-pblicas', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/bime-141030084228-conversion-gate01-thumbnail.jpg?cb=1414676663');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('La innovación tecnológica en la transparencia del sector público: del derecho de acceso al open data y la reutilización', 'Ponencia centrada en exponer aspectos clave que están limitando el acceso de los ciudadanos a los servicios digitales de las administraciones y algunas conclusiones extraidas de las iniciativas de datos abiertos que pueden aplicarse a este problema', 3, 6, 3, 'José Mª Subero', 'http://www.slideshare.net/aragonopendata/congreso-derecho', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/josemsuberocongresoderechoticssicarmaragnopendata-141024021324-conversion-gate02-thumbnail-2.jpg?cb=1414135011');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Apertura de datos públicos', 'Descripción de las principales experiencias de apertura de datos tanto a nivel nacional como internacional', 3, 6, 4, 'Alberto Ortíz de Zárate', 'http://es.slideshare.net/aragonopendata/curso-de-verano-datos-y-gobierno-abierto-alberto-ortiz-de-zrate', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/06albertoortizdezarate-140130090834-phpapp02-thumbnail.jpg?cb=1391094613');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Procesos de participación ciudadana: El caso de Aragón Participa', 'Presentación del modelo de participación aplicado por el Gobierno de Aragón y llevado a cabo a través de su iniciatiava Aragón Participa', 3, 6, 5, 'Blanca Solans', 'http://es.slideshare.net/aragonopendata/curso-de-verano-datos-y-gobierno-abierto-blanca-solans', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/04blancasolans-140130090630-phpapp01-thumbnail.jpg?cb=1391094736');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Preparación de datos para su análisis', 'Descripción de las técnicas empleadas para la preparación de datos para su posterior trabajo con ellos. Explicación de OCRs, tablas dinámicas y otras herramientas que permiten el curado de los datos', 3, 6, 6, 'David Cabo', 'http://es.slideshare.net/aragonopendata/curso-de-verano-datos-y-gobierno-abierto-david-cabo', 5, '');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Claves del Gobierno Abierto. Una nueva forma de relación entre ciudadanos y gobiernos', 'Introducción a las claves que han de tenerse en cuenta para la creación de un nuevo modelo de relación con los ciudadanos para generar estructuras de gobierno en las que se pueda confiar', 3, 6, 5, 'Guzmán Garmendia', 'http://es.slideshare.net/aragonopendata/curso-de-verano-datos-y-gobierno-abierto-guzman-garmendia', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/11davidcabo-140130091656-phpapp02-thumbnail.jpg?cb=1391095098');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Verkami, creative crowdfunding', 'Exposición del proyecto Verkami y de los principios que guían a las iniciativas de financiación colaborativa', 3, 6, 4, 'Jonás Sala', 'http://es.slideshare.net/aragonopendata/curso-de-verano-datos-y-gobierno-abierto-jons-sala', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/10jonassala-140130091542-phpapp02-thumbnail.jpg?cb=1391094995');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Ciudadanía y gobiernos en la red, ¿cómo? ', 'Exposición de diferentes modelos de colaboración entre ciudadanos y gobiernos basados en las posibilidades que ofrece la sociedad en red y con fuertes niveles de innovación', 3, 6, 5, 'Jordi Graells', 'http://es.slideshare.net/aragonopendata/curso-de-verano-datos-y-gobierno-abierto-guzman-garmendia-30624111', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/01guzmangarmendiajaca-140130083744-phpapp01-thumbnail.jpg?cb=1391092908');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Elementos jurídicos para la reutilización de datos', 'Repaso por los principales elementos jurídicos a tener en cuenta en la publicación y reutilización de datos de las administraciones públicas. Datos de carácter personal, derecho de acceso a la información y otros aspectos normativos a tener en cuenta.', 3, 6, 5, 'José Félix Muñoz', 'http://www.slideshare.net/aragonopendata/09-jose-felix-muoz', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/09josefelixmuoz-140130091351-phpapp02-thumbnail-2.jpg?cb=1391073293');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('La realidad de abrir un dato. Caso Aragón Open data', 'Presentación con los principales aspectos a tener en cuenta a la hora de realizar un proceso de apertura de datos dentro de un gobierno, desde la planificación estratégica hasta  aspectos de detalle más técnicos a considerar ', 3, 6, 4, 'José Mª Subero', 'http://es.slideshare.net/aragonopendata/curso-de-verano-datos-y-gobierno-abierto-jose-m-subero', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/08josemsubero-140130091207-phpapp01-thumbnail.jpg?cb=1391094838');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Visualización', 'Presentación de proyectos basados en la visualización de datos y explicación de algunas herramientas que sirven para la visualización de datos en Internet', 3, 8, 6, 'Juan Elosua', 'http://es.slideshare.net/aragonopendata/curso-de-verano-datos-y-gobierno-abierto-juan-elosua', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/juanelosuapresentacin-140130092113-phpapp01-thumbnail.jpg?cb=1391095333');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('El poder del #periodismodatos', 'Presentación de algunas de las iniciativas de periodismo de datos más importantes a nivel internacional y explicación de la potencia del periodismo de datos en la creación de narrativas digitales', 3, 6, 6, 'Mar Cabra', 'http://es.slideshare.net/aragonopendata/12-mar-cabra', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/12marcabra-140130091901-phpapp01-thumbnail.jpg?cb=1391095243');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('#Opendata abrir… y abrir bien', 'Repaso por las buenas prácticas que es necesario incluir en los procesos de publicación de datos abiertos dentro de las administraciones públicas', 3, 6, 4, 'Marc Garriga', 'http://es.slideshare.net/aragonopendata/curso-de-verano-datos-y-gobierno-abierto-marc-garriga', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/07marcgarriga-140130091046-phpapp02-thumbnail.jpg?cb=1391094788');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Data<Information<Knowledge', 'Presentación dirigida a presentar la iniciativa IREKIA del Gobierno Vasco y a exponer algunos de los elementos a tener en cuenta al diseñar una política de gobierno abierto', 3, 6, 5, 'Nagore de los Ríos', 'http://es.slideshare.net/aragonopendata/curso-de-verano-datos-y-gobierno-abierto-nagore-de-los-ros', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/02nagoredelosros-140130084317-phpapp02-thumbnail.jpg?cb=1391093136');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Datos abiertos y patrimonio cultural', 'Descripción del proyecto Aragón Open Data y de las relaciones de este con la publicación de elementos relacionados con el patrimonio cultural', 3, 6, 9, 'María Ángeles Rincón', 'http://es.slideshare.net/aragonopendata/patrimonio-cult', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/patrimoniocult-141001101658-phpapp02-thumbnail.jpg?cb=1412176887');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Generar valor con la información pública: hacia una política de reutilización de datos', 'Descripción de los principales elementos a tener en cuenta cuando se diseña una política de datos abiertos y gobierno abierto', 3, 6, 10, 'Alberto Ortíz de Zárate', 'http://es.slideshare.net/alorza/generar-valor-con-la-informacin-pblica-aragn-open-data', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/opendata2015-151016112210-lva1-app6891-thumbnail.jpg?cb=1444994632');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Foro Open Data 15-X-15', 'Exposición de las pricipales tareas y servicios con los que cuenta el Gobierno de Aragón en materia de datos abiertos y nuevos desarrollos de Aragón Open Data', 3, 6, 10, 'José Mª Subero', 'http://www.slideshare.net/aragonopendata/foro-open-data-15x15', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/foroopendata15x15versionweb-151019141706-lva1-app6892-thumbnail.jpg?cb=1445264807');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Buenas prácticas en portales Open Data, opendata.aragon.es', 'Descripción de buenas prácticas seguidas en la creación del portal de datos abiertos del Gobierno de Aragón', 3, 6, 11, 'María Ángeles Rincón', 'http://es.slideshare.net/aragonopendata/presentacin-aragn-open-data-en-jornada-homer-mara-ngeles-rincn', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/presentacinhomersevilla-140130083257-phpapp02-thumbnail.jpg?cb=1391092539');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('The reuse of open data, practical examples', 'Exposición de buenas prácticas seguidas para la presentación del portal opendata.aragon.es', 3, 6, 12, 'José Mª Subero', 'http://es.slideshare.net/aragonopendata/round-table-the-reuse-of-open-data-practical-examples', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/josemsuberothereuseofopendata-141001102601-phpapp02-thumbnail.jpg?cb=1412177209');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('New open data services. The Aragón Open Data experience', 'Presentación de la nueva versión de la web opendata.aragon.es así como de los nuevos servicios creados en base a datos abiertos', 3, 6, 13, 'María Ángeles Rincón', 'http://es.slideshare.net/aragonopendata/aragn-open-data-en-jornada-homer-malta-mara-ngeles-rincn', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/maltadef2-140311035310-phpapp01-thumbnail.jpg?cb=1394528416');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Presentación del proyecto Aragón Open Data', 'Descripción de las funcionalidades incorporadas por el proyecto Aragón Open Data y presentación del portal de datos abiertos del Gobierno de Aragón', 3, 6, 14, 'María Ángeles Rincón', 'http://es.slideshare.net/aragonopendata/i-congreso-open-government-avapol', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/20131121marianrinconcongresovalencia-140130092909-phpapp02-thumbnail.jpg?cb=1391095885');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Diseño de un portal de datos abiertos: ¿por dónde empiezo?', 'Enumeración del conjunto de problemas que hay que plantearse al lanzar un portal de datos abiertos. Descripción de problemas a nivel organizativo, jurídico y organizacional', 3, 6, 15, 'José Mª Subero', 'http://www.slideshare.net/aragonopendata/jose-subero-congreso-o-gov-gandia', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/josesuberocongresoogovgandia-150326060749-conversion-gate01-thumbnail.jpg?cb=1427375363');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Nuevos servicios open data. La experiencia de Aragón Open Data', 'Presentación de la nueva versión de la web opendata.aragon.es así como de los nuevos servicios creados en base a datos abiertos', 3, 6, 16, 'José Mª Subero', 'http://es.slideshare.net/aragonopendata/jose-m-subero-aragn-okio-conf14-v4', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/josemsuberoaragnokioconf14v4-140307062414-phpapp02-thumbnail.jpg?cb=1394195310');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Taller D3j', 'Taller sobre la utilización de D3j en la visualización de datos y contenidos para la web', 3, 8, 17, 'David Cabo', 'http://bost.ocks.org/mike/d3/workshop/#0', 2, 'http://opendata.aragon.es/public/i/AOD_logo.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Charla de scrapping', 'Taller sobre scrapping y extracción de datos de diferentes fuentes, en especial procedentes de redes sociales', 3, 8, 17, 'Alberto Alcolea', 'https://github.com/albertoalcolea/charla-scraping', 3, 'http://opendata.aragon.es/public/i/AOD_logo.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Taller de scrapping', 'Taller sobre scrapping y extracción de datos de diferentes fuentes, en especial procedentes de redes sociales', 3, 8, 17, 'Alejandro Rivero', 'http://es.slideshare.net/aragonopendata/alejandro-rivero', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/alejandrorivero-141002045222-phpapp02-thumbnail.jpg?cb=1412243548');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Formación en Mediawiki para acceso a AragoPEdia', 'Taller de formación en Mediawiki, producto con el que se desarrolla la visión ciudadana de AragoPedia. Formación en el API de Mediawiki para acceder a la información', 3, 8, 17, 'David Portolés', 'http://es.slideshare.net/aragonopendata/medawiki-jaca-david-portoles', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/cursojacathon2014mediawikiaragopedia-141002051712-phpapp02-thumbnail.jpg?cb=1412245055');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Formación en CKAN para acceso a catálogo de datos abiertos de Aragón Open Data', 'Taller para aprender la forma en la que se organiza la información dentro de Aragón Open Data mediante el CMS de datos abiertos CKAN y para aprender el manejo del API de CKAN que permite el acceso a los datos', 3, 8, 17, 'David Portolés', 'http://es.slideshare.net/aragonopendata/ckan-39790803', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/cursojacathon2014ckancatalogoaod-141002050749-phpapp02-thumbnail.jpg?cb=1412244481');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Open Social Data', 'Descripción de los criterios que han llevado a desarrollar la aplicación Aragón Open Social Data, qué se pretende mostrar con la misma y funcionalidades que contiene', 3, 8, 17, 'Gonzalo Ruiz', 'http://es.slideshare.net/aragonopendata/gonzalo-ruiz', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/gonzaloruiz-141002042359-phpapp02-thumbnail.jpg?cb=1412242832');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('¿Conoces Aragón?', 'Exposición de la aplicación desarrollada por el equipo NoTeam del Jacathon Aragón Open Data. La aplicación es un desarrollo para android que a través de un juego pretende comprobar tu conocimiento sobre la Comunidad Autónoma de Aragón. La aplicación se basa en datos descargados de AragoPedia', 3, 7, 18, 'NP', 'http://www.slideshare.net/aragonopendata/equipo-noteam', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/equiponoteam-141006035901-conversion-gate01-thumbnail.jpg?cb=1412585948');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Visual AragoPedia', 'Exposición de la aplicación desarrollada por el equipo PoolParty del Jacathon Aragón Open Data. La aplicación es una reutilización de los datos de AragoPedia mediante librerías d3 para ofrecer una mejor estética en la presentación de resultados al ciudadano', 3, 7, 18, 'NP', 'http://www.slideshare.net/aragonopendata/equipo-pool-party', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/equipopoolparty-141006040307-conversion-gate02-thumbnail.jpg?cb=1412586193');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Senderos de Aragón', 'Exposición de la aplicación desarrollada por el equipo Huracán del Jacathon Aragón Open Data. La aplicación muestra los senderos existentes en Aragón y crea un espacio para la monetarización de la aplicación a través de publicidad', 3, 7, 18, 'NP', 'http://www.slideshare.net/aragonopendata/equipo-huracn', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/equipohuracn-141006032801-conversion-gate02-thumbnail.jpg?cb=1412584090');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('La educación en los CRA de Aragón', 'Exposición de la aplicación desarrollada por el equipo Jodocoders del Jacathon Aragón Open Data. La aplicación muestra como se han de mover los alumnos de pequeños núcleos de Aragón para poder acceder a las escuelas en las que reciben formación', 3, 7, 18, 'NP', 'http://www.slideshare.net/aragonopendata/equipo-jodo-coders', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/equipojodocoders-141006034110-conversion-gate02-thumbnail.jpg?cb=1412584878');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Agua con azucar para ovejas', 'Exposición de la aplicación desarrollada por el equipo Manata del Jacathon Aragón Open Data. La aplicación muestra como se reparten las subvenciones públicas que otorga el Gobierno de Aragón', 3, 7, 18, 'NP', 'http://www.slideshare.net/aragonopendata/equipo-manata', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/equipomanata-141006034618-conversion-gate02-thumbnail.jpg?cb=1412585185');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Aragomo', 'Exposición de la aplicación desarrollada por el equipo 404dev del Jacathon Aragón Open Data. La aplicación busca la geoposición y la información sobre los lugares más destacados por los usuarios en redes sociales a traves del uso del API de Aragón Open Social Data', 3, 7, 18, 'NP', 'http://www.slideshare.net/aragonopendata/equipo-404-dev', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/equipo404dev-141006031302-conversion-gate02-thumbnail.jpg?cb=1412583189');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Aragón Social Scanner', 'Exposición de la aplicación desarrollada por el equipo MORElab del Jacathon Aragón Open Data. La aplicación intenta realizar el filtrado de los temas que afectan a Aragón en redes sociales', 3, 7, 18, 'NP', 'http://www.slideshare.net/aragonopendata/equipo-more-lab', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/equipomorelab-141006035145-conversion-gate02-thumbnail.jpg?cb=1412585513');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('API de acceso a AragoDBPedia', 'Taller dirigido a formar en el API de acceso a AragoPedia. El API de acceso diseñado con ELDA permite acceder a los datos en formatos semánticos utilizados en AragoDBPedia', 3, 8, 17, 'Oscar Corcho', 'http://es.slideshare.net/ocorcho/aragodbpedia', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/aragodbpedia-140926030853-phpapp01-thumbnail.jpg?cb=1411718975');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Aragón Open Data', 'Ponencia ofrecida en los cursos formativos ofrecidos a los empleados del Gobierno de Aragón, dentro de unas jornadas sobre transparencia y participación pública. Descripción de las principales tareas, objetivos y servicios de Aragón Open Data', 3, 6, 19, 'José Mª Subero', 'http://www.slideshare.net/aragonopendata/nuevo-marco-normativo-de-la-transparencia-y-la-participacin-ciudadana-en-aragn', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/marconormativotransparenciaopendata-151105133445-lva1-app6892-thumbnail.jpg?cb=1446730866');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Experiencia de desarrollo del portal de datos abiertos del Gobierno de Aragón', 'Explicación de las claves que han llevado al desarrollo actual del portal aragon.opendata.es y descripción de las principales funcionalidades que contiene', 3, 6, 20, 'José Mª Subero', 'https://es.slideshare.net/aragonopendata/jose-m-subero-aragn-open-data-ao2-v4', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/josemsuberoaragnopendataao2v4-140307055746-phpapp02-thumbnail.jpg?cb=1394195006');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Perspectivas para open data desde el portal de datos abiertos de UK: data.gov.uk', 'Presentación de las principales tendencias en las que se está trabajando dentro del portal de datos abiertos de Reino Unido', 3, 6, 28, 'Antonio Acuña', 'http://es.slideshare.net/aragonopendata/antonio-acua-perspectivas-para-open-data-31200369', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/antonioacuaperspectivasparaopendata-140214021117-phpapp02-thumbnail.jpg?cb=1392368658');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Aragón Open Presupuesto', 'Presentación de la segunda versión de la aplicación prespuesto.aragon.es con la incorporación de la información presupuestaria de las entidades locales de Aragón', 3, 6, 28, 'David Cabo', 'http://es.slideshare.net/aragonopendata/jornada-1-ao-de-aragon-open-data-david-cabo-presupuestos-de-aragn-20-municipios-y-comarcas', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/davidcabopresupuestosaragnii-140214031933-phpapp01-thumbnail.jpg?cb=1392369810');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Escuchamos para que sepas lo que pasa en Aragón', 'Descripción del proyecto Aragón Open Social Data y presentación de las funcionalidades que aporta a los ciudadanos de Aragón', 3, 6, 28, 'Gonzalo Ruiz', 'http://es.slideshare.net/aragonopendata/jornada-1-ao-de-aragon-open-data-gonzalo-ruiz-aragon-open-social-data', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/gonzaloruizaragonopensocialdata-140214031628-phpapp01-thumbnail.jpg?cb=1392369544');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Mejoras en open data para los gestores de datos', 'Explicación sobre las mejoras realizadas en el backend de Aragón Open Data para permitir una mejor utilización del mismo por los gestores de información', 3, 6, 28, 'Ignacio de Marco', 'http://es.slideshare.net/aragonopendata/jornada-1-ao-de-aragon-open-data-ignacio-de-marco-mejoras-open-data-para-gestores-de-datos', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/ignaciodemarcomejorasopendataparagestoresdedatos-140214031415-phpapp02-thumbnail.jpg?cb=1392369351');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Aragón Open Data 2.0', 'Presentación de los nuevos contenidos con que contará la versión 2.0 de Aragón Open Data', 3, 6, 28, 'José Mª Subero', 'http://es.slideshare.net/aragonopendata/jornada-1-ao-de-aragon-open-data-jose-m-subero-aragn-open-data-20', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/josemsuberoaragnopendataao2-140214030930-phpapp02-thumbnail.jpg?cb=139236910');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Un año de Aragón Open Data. Tendencias y nuevos servicios en datos abiertos', 'Presentación de la versión 2.0 del portal Aragón Open Data y descubrimiento de las principales funcionalidades añadidas al mismo', 3, 6, 28, 'María Ángeles Rincón', 'http://es.slideshare.net/aragonopendata/1-ao-de-aragon-open-data', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/marianrincnunaoaragonopendata-140213083202-phpapp01-thumbnail.jpg?cb=1392302111');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('AragoPedia, datos abiertos para tu municipio', 'Descripción del proyecto AragoPedia y de su encaje en Aragón Open Data. AragoPedia se constituye como el proyecto que aglutina la información geolocalizada a nivel municipal dentro de Aragón Open Data y como laboratorio de prueba de tecnología semántica', 3, 6, 28, 'Raquel Miguel', 'http://es.slideshare.net/aragonopendata/jornada-1-ao-de-aragon-open-data-raquel-miguel-aragopediaaragodbpedia', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/raquelmiguelaragopedia-aragodbpedia-140214031206-phpapp02-thumbnail.jpg?cb=1392369283');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('El papel del tercer sector en open data', 'Exposición del papel de las organizaciones del tercer sector dentro de open data y de su importancia como garantes de la transparencia de los gobiernos', 3, 6, 28, 'Zara Rahman', 'http://es.slideshare.net/aragonopendata/jornada-1-ao-de-aragon-open-data-zara-rahman-okf-presentacion', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/zararahmanokfpresentacion-140214030457-phpapp02-thumbnail.jpg?cb=1392368956');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Gobierno abierto y open data. Experiencia Aragón Open Data', 'Presentación de la experiencia en datos abiertos del Gobierno de Aragón y presentación del portal Aragón Open Data', 3, 6, 21, 'José Mª Subero', 'http://es.slideshare.net/aragonopendata/jornada-agora', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/20131016josemsuberoopendatamalagav2-140130092321-phpapp02-thumbnail.jpg?cb=1391095682');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Aragón, un modelo de presupuestos abiertos', 'Presentación de la aplicación de visualización de presupuestos del Gobierno de Aragón presupuesto.aragon.es', 3, 6, 21, 'José Mª Subero', 'https://es.slideshare.net/aragonopendata/20131016-jose-m-subero-openppto-malaga', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/20131016josemsuberoopendatamalagav2-140130092321-phpapp02-thumbnail.jpg?cb=1391095682');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Experiencia en datos abiertos del Gobierno de Aragón', 'Presentación de las acciones en materia de datos realizadas por parte del Gobierno de Aragón. Presentación de servicios basados en datos abiertos. ', 3, 6, 22, 'José Mª Subero', 'http://www.slideshare.net/aragonopendata/jose-m-subero-aragn-open-data', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/josemsuberoaragnopendata-141001101100-phpapp02-thumbnail.jpg?cb=1412176442');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Datos abiertos y RISP en Comunidades Autónomas', 'Descripción de cómo se aborda una iniciativa de datos abiertos desde una comunidad autónoma, en este caso desde Aragón', 3, 6, 23, 'José Mª Subero', 'http://www.slideshare.net/aragonopendata/jornada-sensibilizacin-risp-para-ministerio-de-justicia-madrid', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/josesuberojornadaministeriojusticia-150209043914-conversion-gate02-thumbnail.jpg?cb=1423478396');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Iniciativa Aragón Open Data', 'Explicación de los trabajos realizados dentro de la iniciativa Aragón Open Data y de los servicios generados para facilitar el acceso de los ciudadanos a la información', 3, 6, 24, 'José Mª Subero', 'http://www.slideshare.net/aragonopendata/aspectos-prcticos-de-opendata-jornada-sicarm', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/josemsuberoaspectoprcticosaragnopendata-141024020459-conversion-gate01-thumbnail-2.jpg?cb=1414135215');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Apertura de datos y transparencia', 'Presentación de los objetivos que persigue la apertura de los datos públicos, con especial referencia a la búsqueda de las transparencia y la rendición de cuentas dentro de los gobiernos', 3, 6, 26, 'Alberto Ortíz de Zárate', 'http://es.slideshare.net/aragonopendata/presentacin-aragn-open-data-alberto-ortiz-de-zrate-apertura-de-datos-y-transparencia', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/zaragoza-transparencia-opendata-140130082517-phpapp02-thumbnail.jpg?cb=1391092015');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('¿Dónde van mis impuestos?', 'Presentación de la web presupuesto.aragon.es, exposición de los criterios de diseño de la misma y navegación por sus principales funcionalidades', 3, 6, 26, 'David Cabo', 'http://es.slideshare.net/aragonopendata/presupuestos-30622884', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/presupuestos-140130082156-phpapp02-thumbnail.jpg?cb=1391091861');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Portal web Aragón Open Data', 'Presentación del portal opendata.aragon.es y demostración de las principales funcionalidades del mismo así como exposición de los criterios empleados para llegar al resultado presentado', 3, 6, 26, 'David Portolés', 'http://es.slideshare.net/aragonopendata/presentacion-portalaod', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/presentacionportalaod-140130081114-phpapp01-thumbnail.jpg?cb=1391091390');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Aragón Open Data', 'Descripción de los elementos en los que se ha trabajado para poder lanzar la iniciativa Aragón Open Data, tanto desde el punto de vista técnico como organizativo o legal', 3, 6, 26, 'José Mª Subero', 'http://es.slideshare.net/aragonopendata/presentacin-30622176', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/josepresentacin-140130080410-phpapp01-thumbnail.jpg?cb=1391090942');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('#OpenData Una visión internacional', 'Presentación de las principales propuestas que se están desarrollando internacionalmente alrededor del mundo de los datos abiertos', 3, 6, 26, 'Marc Garriga', 'http://es.slideshare.net/aragonopendata/presentacin-aragn-open-data-marc-garriga-opendata-una-visin-internacional', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/aragnopendata-mgarrigap-140130081832-phpapp01-thumbnail.jpg?cb=1391091603');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('El caso Aragón Open Data', 'Taller en el que se explica el funcionamiento del API de Aragón Open Data que permite acceder a los contenidos del portal de datos abiertos opendata.aragon.es', 3, 8, 27, 'David Portolés', 'http://es.slideshare.net/aragonopendata/vi-seminario-radio-y-red-david-portols', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/viseminarioradioyredtalleropendata-140202033401-phpapp02-thumbnail.jpg?cb=1391333772');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Apertura de datos públicos', 'Descripción de las principales experiencias de apertura de datos tanto a nivel nacional como internacional', 4, 6, 4, 'Alberto Ortíz de Zárate', 'http://www.youtube.com/embed/dos3z3deuI4', 7, 'http://img.youtube.com/vi/dos3z3deuI4/2.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Procesos de participación ciudadana: El caso de Aragón Participa', 'Presentación del modelo de participación aplicado por el Gobierno de Aragón y llevado a cabo a través de su iniciatiava Aragón Participa', 4, 6, 5, 'Blanca Solans', 'http://www.youtube.com/embed/SB6fsJb_i50', 7, 'http://img.youtube.com/vi/SB6fsJb_i50/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Ciudadanía y gobiernos en la red, ¿cómo? ', 'Exposición de diferentes modelos de colaboración entre ciudadanos y gobiernos basados en las posibilidades que ofrece la sociedad en red y con fuertes niveles de innovación', 4, 6, 5, 'Jordi Graells', 'http://www.youtube.com/embed/hg4CZyJt8UA', 7, 'http://img.youtube.com/vi/hg4CZyJt8UA/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Elementos jurídicos para la reutilización de datos', 'Repaso por los principales elementos jurídicos a tener en cuenta en la publicación y reutilización de datos de las administraciones públicas. Datos de carácter personal, derecho de acceso a la información y otros aspectos normativos a tener en cuenta.', 4, 6, 5, 'José Félix Muñoz', 'http://www.youtube.com/embed/7KqnjCwlpC4', 7, 'http://img.youtube.com/vi/7KqnjCwlpC4/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('La realidad de abrir un dato. Caso Aragón Open data', 'Presentación con los principales aspectos a tener en cuenta a la hora de realizar un proceso de apertura de datos dentro de un gobierno, desde la planificación estratégica hasta  aspectos de detalle más técnicos a considerar ', 4, 6, 4, 'José Mª Subero', 'http://www.youtube.com/embed/ENaIagK6OjA', 7, 'http://img.youtube.com/vi/ENaIagK6OjA/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('#Opendata abrir… y abrir bien', 'Repaso por las buenas prácticas que es necesario incluir en los procesos de publicación de datos abiertos dentro de las administraciones públicas', 4, 6, 4, 'Marc Garriga', 'http://www.youtube.com/embed/CSIsihbn55Q', 7, 'http://img.youtube.com/vi/CSIsihbn55Q/3.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Ejemplo de Open Data: AragoPedia', 'Explicación del funcionamiento y de las opciones de descarga de datos de AragoPedia', 4, 5, 7, 'NP', 'https://www.youtube.com/watch?v=hOZ7GgLWNKA', 7, 'http://img.youtube.com/vi/hOZ7GgLWNKA/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Ejemplo completo de publicación de datos 1/3', 'Ejemplo completo de qué acciones hay que realizar para proceder a la publicación de un conjunto de datos en al plataforma Aragon Open Data', 4, 4, 7, 'NP', 'https://www.youtube.com/watch?v=QRt66GAFqWQ', 7, '');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Ejemplo completo de publicación de datos 2/3', 'Ejemplo completo de qué acciones hay que realizar para proceder a la publicación de un conjunto de datos en al plataforma Aragon Open Data', 4, 4, 7, 'NP', 'https://www.youtube.com/watch?v=m4LR_tST7yM', 7, 'http://img.youtube.com/vi/m4LR_tST7yM/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Ejemplo completo de publicación de datos 3/3', 'Ejemplo completo de qué acciones hay que realizar para proceder a la publicación de un conjunto de datos en al plataforma Aragon Open Data', 4, 4, 7, 'NP', 'https://www.youtube.com/watch?v=6f0nYJ1W4TM', 7, 'http://img.youtube.com/vi/6f0nYJ1W4TM/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Transformación de datos a través de herramientas ETL', 'Descripción de operaciones que hay que realizar para la transformación de datos y la obtención de los formatos necesarios según la presentación de la información que se quiera realizar', 4, 5, 7, 'NP', 'https://www.youtube.com/watch?v=YK2Vx8QyA0c', 7, 'http://img.youtube.com/vi/YK2Vx8QyA0c/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Acceso a la pizarra de administración de gestores de datos', 'Descripción de las funcionalides que incorpora el bak-end diseñado desde Aragón Open Data para permitir la incorporación de nuevos conjuntos de datos por parte de los gestores de la información. En este caso se abordan el acceso a la parte privada de cada gestor de contenido', 4, 4, 7, 'NP', 'https://www.youtube.com/watch?v=ZpTYMbPr_U8', 7, 'http://img.youtube.com/vi/ZpTYMbPr_U8/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Crear un nuevo conjunto de datos', 'Descripción de las funcionalides que incorpora el bak-end diseñado desde Aragón Open Data para permitir la incorporación de nuevos conjuntos de datos por parte de los gestores de la información. En este caso se describe cómo se añade un nuevo conjunto de datos en Aragón Open Data', 4, 4, 7, 'NP', 'https://www.youtube.com/watch?v=OkHg3IqpmlQ', 7, 'http://img.youtube.com/vi/OkHg3IqpmlQ/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Introducción de metadatos en el backoffice de Aragón Open Data: temática y etiquetado', 'Descripción de las funcionalides que incorpora el bak-end diseñado desde Aragón Open Data para permitir la incorporación de nuevos conjuntos de datos por parte de los gestores de la información. En este caso se abordan los metadatos "temática" y "etiquetas"', 4, 4, 7, 'NP', 'https://www.youtube.com/watch?v=JzvP_DagFiw', 7, 'http://img.youtube.com/vi/IDEVIDEO/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Introducción de metadatos en el backoffice de Aragón Open Data: cobertura temporal, idiomas y extras', 'Descripción de las funcionalides que incorpora el bak-end diseñado desde Aragón Open Data para permitir la incorporación de nuevos conjuntos de datos por parte de los gestores de la información. En este caso se abordan los metadatos "cobertura temporal", "idiomas" y "extras"', 4, 4, 7, 'NP', 'https://www.youtube.com/watch?v=PNYmPzgYI9M', 7, 'http://img.youtube.com/vi/IDEVIDEO/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Introducción de metadatos en el backoffice de Aragón Open Data: cobertura geográfica', 'Descripción de las funcionalides que incorpora el bak-end diseñado desde Aragón Open Data para permitir la incorporación de nuevos conjuntos de datos por parte de los gestores de la información. En este caso se abordan los metadatos "cobertura geográfica"', 4, 4, 7, 'NP', 'https://www.youtube.com/watch?v=-BUfzyoQZrs', 7, 'http://img.youtube.com/vi/IDEVIDEO/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Introducción de metadatos en el backoffice de Aragón Open Data: licencias', 'Descripción de las funcionalides que incorpora el bak-end diseñado desde Aragón Open Data para permitir la incorporación de nuevos conjuntos de datos por parte de los gestores de la información. En este caso se abordan los metadatos "licencia"', 4, 4, 7, 'NP', 'https://www.youtube.com/watch?v=19JApLABDY4', 7, 'http://img.youtube.com/vi/IDEVIDEO/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Introducción de metadatos en el backoffice de Aragón Open Data: ficheros de datos', 'Descripción de las funcionalides que incorpora el bak-end diseñado desde Aragón Open Data para permitir la incorporación de nuevos conjuntos de datos por parte de los gestores de la información. En este caso se abordan como adjuntar los ficheros de datos que acompañan a cada conjunto de datos', 4, 4, 7, 'NP', 'https://www.youtube.com/watch?v=gOvOFunoaVc', 7, 'http://img.youtube.com/vi/IDEVIDEO/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Open data nacionales e internacionales', 'Repaso de las iniciativas open data más importantes a nivel nacional e internacional', 4, 5, 7, 'NP', 'https://www.youtube.com/watch?v=46I_ADa1L5k', 7, 'http://img.youtube.com/vi/46I_ADa1L5/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Carencias de los portales open data', 'Exposición de algunas carencias que presentan ciertos portales de datos abiertos y mejoras posibles', 4, 5, 7, 'NP', 'https://www.youtube.com/watch?v=GpY2PqhXN9Q', 7, 'http://img.youtube.com/vi/GpY2PqhXN9Q/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Unidad 1 del curso Introducción al Open Data', 'Vídeos que componen la Unidad 1 del curso de introducción a los datos abiertos desarrollado por Aragón Open Data. Se introduce el concepto de qué es open data, las iniciativas más destacadas a nivel nacional e internacional y el derecho a la información.', 4, 1, 7, 'NP', 'https://www.youtube.com/watch?v=te8uznZJWGU', 7, 'http://img.youtube.com/vi/te8uznZJWGU/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Unidad 2 del curso Introducción al Open Data', 'Vídeos que componen la Unidad 2 del curso de introducción a los datos abiertos desarrollado por Aragón Open Data. Se presenta la importancia de los datos abiertos para la toma de decisiones, el decálogo de buenas prácticas de Open Data y como se puede explotar la información', 4, 1, 7, 'NP', 'https://www.youtube.com/watch?v=EjjkGKfu3TI', 7, 'http://img.youtube.com/vi/EjjkGKfu3TI/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Unidad 5 del curso Introducción al Open Data', 'Vídeos que componen la Unidad 5 del curso de introducción a los datos abiertos desarrollado por Aragón Open Data. Se explica el proceso de publicación de la información dentro de Aragón Open Data así como un ejemplo completo de cómo se publica un nuevo conjunto de datos', 4, 1, 7, 'NP', 'https://www.youtube.com/watch?v=2h85zHFNwjE', 7, 'http://img.youtube.com/vi/2h85zHFNwjE/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Unidad 4 del curso Introducción al Open Data', 'Vídeos que componen la Unidad 4 del curso de introducción a los datos abiertos desarrollado por Aragón Open Data. Se explica la importancia en la toma de decisiones de los datos, los estándares de los formatos en los que pueden aparecer los datos y algunas formas de publicar la información', 4, 1, 7, 'NP', 'https://www.youtube.com/watch?v=CRUdU47ofz0', 7, 'http://img.youtube.com/vi/CRUdU47ofz0/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Unidad 3 del curso Introducción al Open Data', 'Vídeos que componen la Unidad 3 del curso de introducción a los datos abiertos desarrollado por Aragón Open Data. Se explica la cascada de legislación al respecto que comienza a nivel europeo y que baja a nivel nacional y autonómico', 4, 1, 7, 'NP', 'https://www.youtube.com/watch?v=iDp7qYPbtnM', 7, 'http://img.youtube.com/vi/iDp7qYPbtnM/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Conjuntos de datos disponibles en Aragón Open Data', 'Descripción de la información disponible dentro de Aragón Open Data y de la forma de acceder a los diferentes conjuntos de datos', 4, 5, 7, 'NP', 'https://www.youtube.com/watch?v=D6vebWnIrYg', 7, 'http://img.youtube.com/vi/D6vebWnIrYg/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Utilidades de los portales Open Data. Portal de presupuestos del Gobierno de Aragón', 'Presentación de la aplicación de visualización del presupuestos del Gobierno de Aragón', 4, 5, 7, 'NP', 'https://www.youtube.com/watch?v=iPuphE2pxPw', 7, 'http://img.youtube.com/vi/iPuphE2pxPw/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Aplicaciones disponible a partir de open data', 'Descripción de algunas aplicaciones realizadas con datos abiertos por diferentes iniciativas open data. Ejemplos de reutilización de la información', 4, 5, 7, 'NP', 'https://www.youtube.com/watch?v=qNM03SWmVoo', 7, 'http://img.youtube.com/vi/iPuphE2pxPw/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Ejemplo de aplicación de smart city. Calidad del aire', 'Exposición de aplicación informática que permite conocer el estado de la calidad del aire', 4, 5, 7, 'NP', 'https://www.youtube.com/watch?v=WvanHuEkMFg', 7, 'http://img.youtube.com/vi/WvanHuEkMFg/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Ejemplo de aplicación de smart city. Calidad del agua', 'Exposición de aplicación informática que permite conocer el estado de la calidad del agua', 4, 5, 7, 'NP', 'https://www.youtube.com/watch?v=7_Q3x1jJIAE', 7, 'http://img.youtube.com/vi/7_Q3x1jJIA/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Herramientas de visualización y cuadro de mandos', 'Explicación de técnicas de visualización de información geoposicionada a través de CartoDB', 4, 5, 7, 'NP', 'https://www.youtube.com/watch?v=lAhXm8hNRQE', 7, 'http://img.youtube.com/vi/lAhXm8hNRQE/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Utilidades de los portales Open Data. Portal del Ayto de Zaragoza', 'Presentació de cómo se resuelve la exposición de la información de datos abiertos dentro del portal del Ayuntamiento de Zaragoza', 4, 5, 7, 'NP', 'https://www.youtube.com/watch?v=ohkFtVNNCSk', 7, 'http://img.youtube.com/vi/ohkFtVNNCSk/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Buenas prácticas en portales Open Data, opendata.aragon.es', 'Descripción de buenas prácticas seguidas en la creación del portal de datos abiertos del Gobierno de Aragón', 4, 6, 11, 'María Ángeles Rincón', 'http://www.youtube.com/embed/YO21KCNYzRA', 7, 'http://img.youtube.com/vi/YO21KCNYzRA/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Taller de scrapping', 'Taller sobre scrapping y extracción de datos de diferentes fuentes, en especial procedentes de redes sociales', 4, 8, 18, 'Alejandro Rivero', 'http://www.youtube.com/embed/itaR5OX3sY8', 7, 'http://img.youtube.com/vi/itaR5OX3sY8/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Resumen del Jacathon Aragón Open Data', 'Resumen en imágenes de lo más interesante sucedido en el Jacathon Aragón Open Data. Así se vivió el evento que reunió a desarrolladores informáticos alrededor de los datos abiertos de Aragón', 4, 9, 17, 'NP', 'http://www.youtube.com/embed/sh4sj9wmiKM', 7, 'http://img.youtube.com/vi/itaR5OX3sY8/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Experiencia de desarrollo del portal de datos abiertos del Gobierno de Aragón', 'Explicación de las claves que han llevado al desarrollo actual del portal aragon.opendata.es y descripción de las principales funcionalidades que contiene', 4, 6, 20, 'José Mª Subero', 'http://www.youtube.com/embed/tr6GBB4orns', 7, 'http://img.youtube.com/vi/tr6GBB4orns/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Entrevista de María Ángeles Rincón para la EPSI Platform', 'Entrevista a la Directora General de Nuevas Tecnologías por parte del proyecto europeo EPSI', 4, 3, 28, 'María Ángeles Rincón', 'http://vimeo.com/88139259', 6, 'http://b.vimeocdn.com/ts/466/477/466477798_960.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Perspectivas para open data desde el portal de datos abiertos de UK: data.gov.uk', 'Presentación de las principales tendencias en las que se está trabajando dentro del portal de datos abiertos de Reino Unido', 4, 6, 28, 'Antonio Acuña', 'http://www.youtube.com/embed/wZf5C0H8teE', 7, 'http://img.youtube.com/vi/wZf5C0H8teE/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Aragón Open Data 2.0', 'Presentación de los nuevos contenidos con que contará la versión 2.0 de Aragón Open Data', 4, 6, 28, 'José Mª Subero', 'http://www.youtube.com/embed/BFFwQCx3z04', 7, 'http://img.youtube.com/vi/BFFwQCx3z04/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Un año de Aragón Open Data. Tendencias y nuevos servicios en datos abiertos', 'Presentación de la versión 2.0 del portal Aragón Open Data y descubrimiento de las principales funcionalidades añadidas al mismo', 4, 6, 28, 'María Ángeles Rincón', 'http://www.youtube.com/embed/iXbuu4kjOi0', 7, 'http://img.youtube.com/vi/iXbuu4kjOi0/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Ronda de preguntas a ponentes de jornada "Un año de Aragón Open Data"', 'Ronda de preguntas después del primer turno de exposiciones en la jornada "Un año de Aragón Open Data", intervienen los representantes del Gobierno de Aragón, Reino Unido y la Open Knowledge Foundation', 4, 2, 28, 'María Ángeles Rincón, Antonio Acuña, Zara Rahman', 'http://www.youtube.com/embed/QMY4w_Lf0OM', 7, 'http://img.youtube.com/vi/QMY4w_Lf0OM/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('¿Cómo funciona Aragón Open Data?', 'Proceso seguido en Aragón Open Data para materializar la apertura de la información pública', 4, 5, 28, 'NP', 'http://www.youtube.com/embed/a6jSZ6hma_E', 7, 'http://img.youtube.com/vi/a6jSZ6hma_E/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('¿Qué puedes encontrar en Aragón Open Data?', 'Enumeración de los diferentes tipos de datos y proyectos que dorman parte de Aragón Open Data', 4, 5, 28, 'NP', 'http://www.youtube.com/embed/VdygIPeDxpE', 7, 'http://img.youtube.com/vi/VdygIPeDxpE/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('¿Qué es Aragón Open Data?', 'Descubre qué es Arargón Open Data y cuales son los objetivos que se promueven con la liberación de los datos públicos', 4, 5, 28, 'NP', 'http://www.youtube.com/embed/ltmOoFaN-7Y', 7, 'http://img.youtube.com/vi/ltmOoFaN-7Y/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('AragoPedia, datos abiertos para tu municipio', 'Descripción del proyecto AragoPedia y de su encaje en Aragón Open Data. AragoPedia se constituye como el proyecto que aglutina la información geolocalizada a nivel municipal dentro de Aragón Open Data y como laboratorio de prueba de tecnología semántica', 4, 6, 28, 'Raquel Miguel', 'http://www.youtube.com/embed/qFOX72HtCyU', 7, 'http://img.youtube.com/vi/qFOX72HtCyU/3.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('El papel del tercer sector en open data', 'Exposición del papel de las organizaciones del tercer sector dentro de open data y de su importancia como garantes de la transparencia de los gobiernos', 4, 6, 28, 'Zara Rahman', 'http://www.youtube.com/embed/0Chzuu2cb8o', 7, 'http://img.youtube.com/vi/0Chzuu2cb8o/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Interview to Jose Mª Subero for the OpenBudgets project', 'Entrevista a la iniciativa de presupuestos abiertos del Gobierno de Aragón en el marco de un grupo de trabajo del proyecto OpenBudgets que pretende mejorar la rendición de cuentas y la transparencia económica de los gobiernos', 4, 3, 25, 'José Mª Subero', 'https://www.youtube.com/watch?v=bSmJrO_eaOg', 7, 'http://img.youtube.com/vi/bSmJrO_eaOg/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Apertura de datos y transparencia', 'Presentación de los objetivos que persigue la apertura de los datos públicos, con especial referencia a la búsqueda de las transparencia y la rendición de cuentas dentro de los gobiernos', 4, 6, 26, 'Alberto Ortíz de Zárate', 'http://www.youtube.com/embed/8d409yteTJM', 7, 'http://img.youtube.com/vi/8d409yteTJM/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('¿Dónde van mis impuestos?', 'Presentación de la web presupuesto.aragon.es, exposición de los criterios de diseño de la misma y navegación por sus principales funcionalidades', 4, 6, 26, 'David Cabo', 'http://www.youtube.com/embed/2Tu6LXE0Rhk', 7, 'http://img.youtube.com/vi/2Tu6LXE0Rhk/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Portal web Aragón Open Data', 'Presentación del portal opendata.aragon.es y demostración de las principales funcionalidades del mismo así como exposición de los criterios empleados para llegar al resultado presentado', 4, 6, 26, 'David Portolés', 'http://www.youtube.com/embed/_mVSOMh8lt0', 7, 'http://img.youtube.com/vi/_mVSOMh8lt0/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Aragón Open Data', 'Descripción de los elementos en los que se ha trabajado para poder lanzar la iniciativa Aragón Open Data, tanto desde el punto de vista técnico como organizativo o legal', 4, 6, 26, 'José Mª Subero', 'http://www.youtube.com/embed/VdqkaUE-01w', 7, 'http://img.youtube.com/vi/VdqkaUE-01w/1.jpg');
INSERT INTO contenido (titulo, descripcion, formato, tipo , evento, aparece, url, plataforma, thumbnail) VALUES ('Aragón Open Data initiative at the Open Data Global Leaders'' Network of the Open Data Institute', 'Exposición del recorrido de la iniciativa Aragón Open Data desde su creación como catálogo de conjunto de datos, pasando por su posterior etapa como prestador servicios y su enfoque como futura plataforma global del Gobierno de Aragón', 3, 6 , 29, 'José Mª Subero', 'http://es.slideshare.net/aragonopendata/aragn-open-data-initiative-at-the-open-data-global-leaders-network-of-the-open-data-institute', 5, 'http://cdn.slidesharecdn.com/ss_thumbnails/odipresentation-160301075533-thumbnail.jpg?cb=1456818989');



--Creamos la tabla de las contenido
CREATE TABLE contenido_tiene_tema (
    id integer NOT NULL,
    contenido integer NOT NULL,
    tema integer NOT NULL
);


ALTER TABLE public.contenido_tiene_tema OWNER TO user_campusOpenData;

--Creamos la secuencia para el id contenido_tiene_tema
CREATE SEQUENCE contenido_tiene_tema_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.contenido_tiene_tema_id_seq OWNER TO user_campusOpenData;
ALTER SEQUENCE contenido_tiene_tema_id_seq OWNED BY contenido_tiene_tema.id;
ALTER TABLE ONLY contenido_tiene_tema ALTER COLUMN id SET DEFAULT nextval('contenido_tiene_tema_id_seq'::regclass);

ALTER TABLE contenido_tiene_tema ADD CONSTRAINT pk_contenido_tiene_tema PRIMARY KEY (id);


ALTER TABLE contenido_tiene_tema ADD CONSTRAINT fk_contenido_tiene_tema_contenido FOREIGN KEY (contenido) REFERENCES contenido (id);
ALTER TABLE contenido_tiene_tema ADD CONSTRAINT fk_contenido_tiene_tema_tema FOREIGN KEY (tema) REFERENCES tema (id);

INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (1, 4);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (2, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (2, 5);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (3, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (3, 5);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (4, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (4, 29);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (5, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (5, 29);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (6, 39);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (7, 46);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (8, 46);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (9, 3);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (9, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (10, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (10, 46);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (11, 46);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (11, 1);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (12, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (12, 1);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (13, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (13, 29);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (14, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (14, 20);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (15, 34);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (16, 30);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (16, 11);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (16, 36);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (17, 22);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (17, 47);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (18, 8);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (18, 9);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (19, 24);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (19, 40);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (20, 14);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (20, 28);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (21, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (21, 20);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (22, 49);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (22, 36);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (23, 36);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (24, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (24, 5);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (25, 22);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (25, 47);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (26, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (26, 35);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (27, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (27, 29);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (27, 5);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (28, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (28, 44);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (29, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (29, 5);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (29, 23);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (30, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (30, 5);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (30, 23);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (31, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (31, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (31, 44);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (31, 23);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (32, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (32, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (33, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (33, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (34, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (34, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (34, 44);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (35, 13);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (35, 49);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (36, 42);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (36, 46);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (37, 42);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (37, 46);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (38, 4);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (38, 26);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (39, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (39, 7);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (40, 46);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (41, 2);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (41, 4);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (42, 2);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (42, 4);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (43, 2);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (43, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (44, 2);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (44, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (45, 2);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (45, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (46, 2);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (46, 46);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (47, 2);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (47, 46);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (48, 4);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (48, 43);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (49, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (49, 29);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (49, 5);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (49, 44);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (50, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (50, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (51, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (51, 48);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (52, 39);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (52, 44);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (53, 46);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (53, 44);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (54, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (54, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (55, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (55, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (55, 44);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (56, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (56, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (57, 4);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (57, 43);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (58, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (58, 31);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (59, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (59, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (60, 39);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (61, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (61, 44);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (61, 29);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (62, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (62, 44);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (63, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (63, 44);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (64, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (64, 5);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (65, 39);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (66, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (66, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (67, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (67, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (68, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (68, 5);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (69, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (69, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (69, 1);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (70, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (70, 20);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (71, 34);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (72, 24);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (72, 40);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (73, 14);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (73, 28);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (74, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (74, 20);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (75, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (75, 5);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (76, 4);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (77, 16);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (77, 27);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (77, 21);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (77, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (78, 16);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (78, 27);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (78, 21);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (78, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (79, 16);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (79, 27);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (79, 21);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (79, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (80, 18);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (80, 11);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (81, 21);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (81, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (81, 37);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (82, 21);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (82, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (82, 37);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (83, 27);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (83, 21);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (83, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (84, 27);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (84, 21);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (84, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (85, 27);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (85, 21);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (85, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (86, 27);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (86, 21);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (86, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (87, 27);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (87, 21);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (87, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (88, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (88, 5);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (89, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (89, 5);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (90, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (90, 12);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (91, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (91, 12);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (92, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (92, 12);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (93, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (93, 12);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (93, 25);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (94, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (94, 12);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (94, 28);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (95, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (95, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (96, 39);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (97, 41);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (97, 2);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (98, 41);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (98, 2);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (98, 45);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (99, 41);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (99, 2);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (99, 45);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (100, 49);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (100, 6);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (100, 10);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (101, 50);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (101, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (102, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (102, 5);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (102, 23);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (103, 42);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (103, 46);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (104, 19);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (105, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (105, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (106, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (106, 17);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (107, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (107, 48);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (108, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (108, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (108, 44);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (109, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (109, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (110, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (110, 31);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (110, 48);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (110, 15);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (111, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (112, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (113, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (113, 29);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (114, 4);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (114, 43);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (115, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (115, 31);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (116, 39);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (116, 32);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (117, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (117, 5);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (118, 39);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (119, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (119, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (120, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (120, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (121, 33);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (121, 38);
INSERT INTO contenido_tiene_tema (contenido, tema) VALUES (121, 44);
