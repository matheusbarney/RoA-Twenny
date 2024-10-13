set_attack_value(AT_FSPECIAL, AG_CATEGORY, 2);
set_attack_value(AT_FSPECIAL, AG_SPRITE, sprite_get("fspecial"));
set_attack_value(AT_FSPECIAL, AG_NUM_WINDOWS, 5);
set_attack_value(AT_FSPECIAL, AG_HAS_LANDING_LAG, 8);
set_attack_value(AT_FSPECIAL, AG_AIR_SPRITE, sprite_get("fspecial"));
set_attack_value(AT_FSPECIAL, AG_HURTBOX_SPRITE, sprite_get("fspecial_hurt"));
set_attack_value(AT_FSPECIAL, AG_HURTBOX_AIR_SPRITE, sprite_get("fspecial_hurt"));
set_attack_value(AT_FSPECIAL, AG_OFF_LEDGE, 1);
set_attack_value(AT_FSPECIAL, AG_USES_CUSTOM_GRAVITY, 1);

//startup
set_window_value(AT_FSPECIAL, 1, AG_WINDOW_TYPE, 1);
set_window_value(AT_FSPECIAL, 1, AG_WINDOW_LENGTH, 12);
set_window_value(AT_FSPECIAL, 1, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_FSPECIAL, 1, AG_WINDOW_HSPEED_TYPE, 1);
set_window_value(AT_FSPECIAL, 1, AG_WINDOW_VSPEED_TYPE, 1);
set_window_value(AT_FSPECIAL, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FSPECIAL, 1, AG_WINDOW_SFX, asset_get("sfx_spin"));
set_window_value(AT_FSPECIAL, 1, AG_WINDOW_SFX_FRAME, 11);

//spin
set_window_value(AT_FSPECIAL, 2, AG_WINDOW_TYPE, 1);
set_window_value(AT_FSPECIAL, 2, AG_WINDOW_LENGTH, 8);
set_window_value(AT_FSPECIAL, 2, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_FSPECIAL, 2, AG_WINDOW_ANIM_FRAME_START, 3);
set_window_value(AT_FSPECIAL, 2, AG_WINDOW_HSPEED, 10);
set_window_value(AT_FSPECIAL, 2, AG_WINDOW_HSPEED_TYPE, 2);
set_window_value(AT_FSPECIAL, 2, AG_WINDOW_CUSTOM_GRAVITY, 0.5);
set_window_value(AT_FSPECIAL, 2, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);

//upper startup
set_window_value(AT_FSPECIAL, 3, AG_WINDOW_TYPE, 1);
set_window_value(AT_FSPECIAL, 3, AG_WINDOW_LENGTH, 6);
set_window_value(AT_FSPECIAL, 3, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_FSPECIAL, 3, AG_WINDOW_ANIM_FRAME_START, 7);
set_window_value(AT_FSPECIAL, 3, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FSPECIAL, 3, AG_WINDOW_SFX, asset_get("sfx_swipe_heavy2"));
set_window_value(AT_FSPECIAL, 3, AG_WINDOW_SFX_FRAME, 5);
set_window_value(AT_FSPECIAL, 3, AG_WINDOW_CUSTOM_GRAVITY, 0.1);
set_window_value(AT_FSPECIAL, 3, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);

//upper
set_window_value(AT_FSPECIAL, 4, AG_WINDOW_TYPE, 1);
set_window_value(AT_FSPECIAL, 4, AG_WINDOW_LENGTH, 2);
set_window_value(AT_FSPECIAL, 4, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_FSPECIAL, 4, AG_WINDOW_ANIM_FRAME_START, 9);
set_window_value(AT_FSPECIAL, 4, AG_WINDOW_HSPEED, 6);
set_window_value(AT_FSPECIAL, 4, AG_WINDOW_HSPEED_TYPE, 1);
set_window_value(AT_FSPECIAL, 4, AG_WINDOW_CUSTOM_GRAVITY, 0.1);
set_window_value(AT_FSPECIAL, 4, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);

//end
set_window_value(AT_FSPECIAL, 5, AG_WINDOW_TYPE, 1);
set_window_value(AT_FSPECIAL, 5, AG_WINDOW_LENGTH, 15);
set_window_value(AT_FSPECIAL, 5, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_FSPECIAL, 5, AG_WINDOW_ANIM_FRAME_START, 10);
set_window_value(AT_FSPECIAL, 5, AG_WINDOW_HSPEED, 1);
set_window_value(AT_FSPECIAL, 5, AG_WINDOW_HSPEED_TYPE, 1);
set_window_value(AT_FSPECIAL, 5, AG_WINDOW_CUSTOM_GRAVITY, 0.1);
set_window_value(AT_FSPECIAL, 5, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
