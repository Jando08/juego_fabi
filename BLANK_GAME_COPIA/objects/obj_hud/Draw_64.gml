//dibujamos el hud del juego

draw_set_colour(c_white);

// dibujamos las vidas
draw_text(32,24,"Vidas: " + string(global.vidas));

// dibujamos las monedas
draw_text(32, 72, "Monedas: " + string(global.moneda));

// dibujamos los puntos
draw_text(32, 120, "Puntos: " + string(global.puntos));

