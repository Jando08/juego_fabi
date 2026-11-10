// Sintaxis: audio_play_sound(index, priority, loop);
// Guardamos el id de la instancia de audio para poder pausar/reanudar/detener.
if (!variable_global_exists("musica_id") || global.musica_id == 0 || !audio_is_playing(global.musica_id))
{
    global.musica_id = audio_play_sound(snd_musica_fondo, 1, true);
}