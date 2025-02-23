css_intro_timer = 0;
css_intro_state = 0;

//kill victory screen audio
for(var i = 1; i < 12; i++){
  sound_stop(sound_get("vic_d"+string(i)));
}

//i should have named these ones with numbers too ngl
sound_stop(sound_get("vic_hjam_char"));
sound_stop(sound_get("vic_mal"));
sound_stop(sound_get("vic_pasta"));
sound_stop(sound_get("vic_celeste"));
sound_stop(sound_get("vic_another_twenny"));
sound_stop(sound_get("vic_cute_char"));
sound_stop(sound_get("vic_--"));