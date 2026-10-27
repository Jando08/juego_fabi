var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var margen_x = 28;
var margen_y = 24;

// Colores
var color_blanco = c_white;
var color_oro = make_color_rgb(255, 205, 55);
var color_rojo = make_color_rgb(255, 85, 100);
var color_verde = make_color_rgb(100, 240, 160);
var color_sombra = make_color_rgb(25, 30, 40);

// Valores

// Puntaje con cinco digitos: 00000
var puntaje_txt = string(global.puntos);

while (string_length(puntaje_txt) < 5) {
    puntaje_txt = "0" + puntaje_txt;
}

// Monedas
var monedas_txt = string(global.monedas);

// Vidas
var vidas_txt = string(global.vidas);

// Mundo segun el nombre de la room.

var nombre_room = room_get_name(room);

var mundo_txt = string_replace_all(nombre_room, "rm_", "");
mundo_txt = string_replace_all(mundo_txt, "_", "-");

// Estilo de texto

draw_set_halign(fa_left);
draw_set_valign(fa_middle);

// Puntaje

var x_score = margen_x;
var y_texto = margen_y + 16;

// Sombra
draw_set_color(color_sombra);
draw_text(x_score + 2, y_texto + 2, "PUNTAJE");

// Titulo
draw_set_font(fn_hud);
draw_set_color(color_blanco);
draw_text(x_score, y_texto, "PUNTAJE");

// Numero
draw_set_color(color_oro);
draw_text(x_score, y_texto + 25, puntaje_txt);

//Monedas

var x_monedas = gui_w * 0.43;

// Icono de moneda
draw_sprite(spr_coin, 0, x_monedas, y_texto + 25);

// Cantidad
draw_set_color(color_oro);
draw_text(x_monedas + 20, y_texto + 25, monedas_txt);

// Etiqueta
draw_set_color(color_blanco);
draw_text(x_monedas, y_texto, "MONEDAS");

//Vidas

var x_vidas = gui_w * 0.65;

// Icono de corazón
draw_set_color(color_rojo);
draw_text(x_vidas, y_texto + 25, "♥");

// Cantidad de vidas
draw_set_color(color_blanco);
draw_text(x_vidas + 22, y_texto + 25, vidas_txt);

// Etiqueta
draw_text(x_vidas, y_texto, "VIDAS");

//Mundo actual

var x_mundo = gui_w - margen_x - 95;

// Etiqueta
draw_set_color(color_blanco);
draw_text(x_mundo, y_texto, "MUNDO");

// Numero del mundo
draw_set_color(color_verde);
draw_text(x_mundo, y_texto + 25, mundo_txt);

//Restaurar

draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

