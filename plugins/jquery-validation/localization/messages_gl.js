(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "../jquery.validate"], factory );
	} else if (typeof module === "object" && module.exports) {
		module.exports = factory( require( "jquery" ) );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: GL (Galician; Galego)
 */
( function( $ ) {
	$.extend( $.validator.messages, {
		required: "Este campo é obrigatorio.",
		remote: "Por favor, cubre este campo.",
		email: "Por favor, escribe unha dirección de correo valida.",
		url: "Por favor, escribe unha URL valida.",
		date: "Por favor, escribe unha data valida.",
		dateISO: "Por favor, escribe unha data (ISO) valida.",
		number: "Por favor, escribe un número valido.",
		digits: "Por favor, escribe só díxitos.",
		creditcard: "Por favor, escribe un número de tarxeta valido.",
		equalTo: "Por favor, escribe o mesmo valor de novo.",
		extension: "Por favor, escribe un valor cunha extensión aceptada.",
		maxlength: $.validator.format( "Por favor, non escribas máis de {0} caracteres." ),
		minlength: $.validator.format( "Por favor, non escribas menos de {0} caracteres." ),
		rangelength: $.validator.format( "Por favor, escribe un valor entre {0} e {1} caracteres." ),
		range: $.validator.format( "Por favor, escribe un valor entre {0} e {1}." ),
		max: $.validator.format( "Por favor, escribe un valor menor ou igual a {0}." ),
		min: $.validator.format( "Por favor, escribe un valor maior ou igual a {0}." ),
		nifES: "Por favor, escribe un NIF valido.",
		nieES: "Por favor, escribe un NIE valido.",
		cifES: "Por favor, escribe un CIF valido."
	} );
}( jQuery ) );
return $;
}));