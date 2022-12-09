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
 * Locale: ES (Spanish; Español)
 * Region: PE (Perú)
 */
$.extend( $.validator.messages, {
	required: "Este campo es obligatorio.",
	remote: "Por favor, llene este campo.",
	email: "Por favor, escriba un correo electrónico valido.",
	url: "Por favor, escriba una URL valida.",
	date: "Por favor, escriba una fecha valida.",
	dateISO: "Por favor, escriba una fecha (ISO) valida.",
	number: "Por favor, escriba un número valido.",
	digits: "Por favor, escriba sólo dígitos.",
	creditcard: "Por favor, escriba un número de tarjeta valido.",
	equalTo: "Por favor, escriba el mismo valor de nuevo.",
	extension: "Por favor, escriba un valor con una extensión permitida.",
	maxlength: $.validator.format( "Por favor, no escriba más de {0} caracteres." ),
	minlength: $.validator.format( "Por favor, no escriba menos de {0} caracteres." ),
	rangelength: $.validator.format( "Por favor, escriba un valor entre {0} y {1} caracteres." ),
	range: $.validator.format( "Por favor, escriba un valor entre {0} y {1}." ),
	max: $.validator.format( "Por favor, escriba un valor menor o igual a {0}." ),
	min: $.validator.format( "Por favor, escriba un valor mayor o igual a {0}." ),
	nifES: "Por favor, escriba un NIF valido.",
	nieES: "Por favor, escriba un NIE valido.",
	cifES: "Por favor, escriba un CIF valido."
} );
return $;
}));