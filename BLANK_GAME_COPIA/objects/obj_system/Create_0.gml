// variables globales
global.vidas = 3;
global.monedas = 0;
global.puntos = 0;

global.game_over = false;

// Reproducir/reanudar musica de fondo si no se esta reproduciendo
if (!variable_global_exists("musica_id") || global.musica_id == 0)
{
    global.musica_id = audio_play_sound(snd_musica_fondo, 1, true);
}
else if (audio_is_paused(global.musica_id))
{
    audio_resume_sound(global.musica_id);
}
else if (!audio_is_playing(global.musica_id))
{
    global.musica_id = audio_play_sound(snd_musica_fondo, 1, true);
}
global.caido = false;
global.muerto = false;
