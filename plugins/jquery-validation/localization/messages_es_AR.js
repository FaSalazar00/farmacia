(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "../jquery.validate"], factory );
	} else if (typeof module === "object" && module.exports) {
		module.exports = factory( require( "jquery" ) );
	} else {
		factory( jQuery );
	}
}(function( $ ) {


$.extend( $.validator.messages, {
	required: "Este campo es Obligatorio.",
	remote: "Por favor, completa este campo.",
	email: "Por favor, escribir una dirección de correo valida.",
	url: "Por favor, escribir una URL valida.",
	date: "Por favor, escribir una fecha valida.",
	dateISO: "Por favor, escribir una fecha (ISO) valida.",
	number: "Por favor, escribir un número entero valido.",
	digits: "Por favor, escribir sólo dígitos.",
	creditcard: "Por favor, escribir un número de tarjeta valida.",
	equalTo: "Por favor, escribir el mismo valor de nuevo.",
	extension: "Por favor, escribi un valor con una extensión aceptada.",
	maxlength: $.validator.format( "Por favor, no escribas más de {0} caracteres." ),
	minlength: $.validator.format( "Por favor, no escribas menos de {0} caracteres." ),
	rangelength: $.validator.format( "Por favor, escribir un valor entre {0} y {1} caracteres." ),
	range: $.validator.format( "Por favor, escribi un valor entre {0} y {1}." ),
	max: $.validator.format( "Por favor, escribir un valor menor o igual a {0}." ),
	min: $.validator.format( "Por favor, escribir un valor mayor o igual a {0}." ),
	nifES: "Por favor, escribir un NIF valido.",
	nieES: "Por favor, escribir un NIE valido.",
	cifES: "Por favor, escribir un CIF valido."
} );
return $;
}));