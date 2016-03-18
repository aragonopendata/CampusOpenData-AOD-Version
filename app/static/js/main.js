/*** Funciones para el funcionamiento de la app **/

/* Copyright (c) 2006 Mathias Bank (http://www.mathias-bank.de)
 * Dual licensed under the MIT (http://www.opensource.org/licenses/mit-license.php) 
 * and GPL (http://www.opensource.org/licenses/gpl-license.php) licenses.
 * 
 * Thanks to Hinnerk Ruemenapf - http://hinnerk.ruemenapf.de/ for bug reporting and fixing.
 */
jQuery.extend({
/**
* Returns get parameters.
*
* If the desired param does not exist, null will be returned
*
* @example value = $.getURLParam("paramName");
*/ 
	getURLParam: function(strParamName){
		var strReturn = "";
		var strHref = window.location.href;
		var bFound=false;
		
		var cmpstring = strParamName + "=";
		var cmplen = cmpstring.length;

		if ( strHref.indexOf("?") > -1 ){
			var strQueryString = strHref.substr(strHref.indexOf("?")+1);
			var aQueryString = strQueryString.split("&");
			for ( var iParam = 0; iParam < aQueryString.length; iParam++ ){
				if (aQueryString[iParam].substr(0,cmplen)==cmpstring){
					var aParam = aQueryString[iParam].split("=");
					strReturn = aParam[1];
					bFound=true;
					break;
				}
				
			}
		}
		if (bFound==false) return null;
		return decodeURIComponent(strReturn);
	}
});


function tryToSelectItem(obj, txt) {
	if (obj != null) {
		for (k =0 ; k < obj.length; k++) {
			if (obj[k].value == txt) {
				obj[k].selected = true;
			}
		}
	}
}

//Capturamos los parametros de la url para de este modo modificar los combox
function capturaParametros(){
	
	var filtroTipo = "";
	var filtroEtiquetas = "";
	var filtroPonentes = "";
	var filtroEventos = "";
	var filtroFormatos = "";
	
	if ($.getURLParam("filtroTipo") != null) { filtroTipo = $.getURLParam("filtroTipo").replace(/\+/g, " "); }
	if ($.getURLParam("filtroEtiquetas") != null){ filtroEtiquetas = $.getURLParam("filtroEtiquetas").replace(/\+/g, " ");}
	if ($.getURLParam("filtroPonentes") != null){ filtroPonentes = $.getURLParam("filtroPonentes").replace(/\+/g, " "); }
	if ($.getURLParam("filtroEventos") != null){ filtroEventos = $.getURLParam("filtroEventos").replace(/\+/g, " "); }
	if ($.getURLParam("filtroFormatos") != null){ filtroFormatos = $.getURLParam("filtroFormatos").replace(/\+/g, " "); }
	
	
	
	
	
	
	console.log('Tenemos etiqueta2 '+filtroTipo);
//	console.log('El formato es :\n'+filtroFormatos);
//	
//	var parametros = [
//			{name:"filtroTipo", value: $.getURLParam("filtroTipo")}, 
//			{name:"filtroEtiquetas", value: $.getURLParam("filtroEtiquetas")},
//			{name:"filtroPonentes", value: $.getURLParam("filtroPonentes")},
//			{name:"filtroEventos", value: $.getURLParam("filtroEventos")},
//			{name:"filtroFormatos", value: $.getURLParam("filtroFormatos")}
//		]
//	console.log('Los parámetros son:\n'+JSON.stringify(parametros));
	
	tryToSelectItem($("#filtroTipo")[0], filtroTipo);
	tryToSelectItem($("#filtroEtiquetas")[0], filtroEtiquetas);
	tryToSelectItem($("#filtroPonentes")[0], filtroPonentes);
	tryToSelectItem($("#filtroEventos")[0], filtroEventos);
	tryToSelectItem($("#filtroFormatos")[0], filtroFormatos);
}

$(document).ready(function() {
	
	capturaParametros();
	var config	= {
		disable_search: true
	};
	
	var fOnChgChosen = function onChgChosen() {		
		var parametros = [
			{name:"filtroTipo", value: $("#filtroTipo option:selected").val()}, 
			{name:"filtroEtiquetas", value: $("#filtroEtiquetas option:selected").val()},
			{name:"filtroPonentes", value: $("#filtroPonentes option:selected").val()},
			{name:"filtroEventos", value: $("#filtroEventos option:selected").val()},
			{name:"filtroFormatos", value: $("#filtroFormatos option:selected").val()}
		]
		var shallowEncoded = $.param( parametros, true );
		var shallowDecoded = decodeURIComponent( shallowEncoded );
		//Meterlo como parametro
		console.log('Los parámetros son:\n'+shallowEncoded+'\n'+shallowDecoded);
		window.location = window.location.origin+'/?'+shallowDecoded;
		return false;
	}
	
	//Blanco
	$("#filtroTipo").chosen(config).change(fOnChgChosen);
	//Azúl
//	$("#filtroTipo").chosen(config).chosenImage().change(fOnChgChosen);
	$("#filtroEtiquetas").chosen(config).change(fOnChgChosen);
	$("#filtroPonentes").chosen(config).change(fOnChgChosen);
	$("#filtroEventos").chosen(config).change(fOnChgChosen);
	$("#filtroFormatos").chosen(config).change(fOnChgChosen);
} );
