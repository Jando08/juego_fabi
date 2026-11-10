// Sintaxis: audio_play_sound(index, priority, loop);
// Guardamos el id de la instancia de audio para poder pausar/reanudar/detener.
global.musica_id = audio_play_sound(snd_musica_fondo, 1, true);