var optionsPlataformas = {
	url: "/plataformas",
	getValue: "nombre",
	list: {
		match: {
			enabled: true
		}
	},
	theme: "square"
};

var optionsTemas = {
	url: "/temas",
	getValue: "nombre",
	list: {
		match: {
			enabled: true
		}
	},
	theme: "square"
};

var optionsTipos = {
	url: "/tipos",
	getValue: "nombre",
	list: {
		match: {
			enabled: true
		}
	},
	theme: "square"
};

var optionsFormatos = {
	url: "/formatos",
	getValue: "nombre",
	list: {
		match: {
			enabled: true
		}
	},
	theme: "square"
};

var optionsEventos = {
	url: "/eventos",
	getValue: "nombre",
	list: {
		match: {
			enabled: true
		}
	},
	theme: "square"
};

var optionsEventos = {
	url: "/eventos",
	getValue: "nombre",
	list: {
		match: {
			enabled: true
		}
	},
	theme: "square"
};

var optionsPonentes = {
	url: "/ponentes",
	getValue: "ponente",
	list: {
		match: {
			enabled: true
		}
	},
	theme: "square"
};

var pathname = window.location.pathname;
if (pathname == '/addContent'){
	$("#formato-nombre").easyAutocomplete(optionsFormatos);
	$("#tipo-nombre").easyAutocomplete(optionsTipos);
	$("#evento-nombre").easyAutocomplete(optionsEventos);
	$("#ponente").easyAutocomplete(optionsPonentes);
	$("#plataforma-nombre").easyAutocomplete(optionsPlataformas);
	
	for (i = 0; i < 5; i++) { 
		$("#temas-"+i+"-tema").easyAutocomplete(optionsTemas);
}
	
}


