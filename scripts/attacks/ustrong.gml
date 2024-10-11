set_attack_value(AT_USTRONG, AG_SPRITE, sprite_get("ustrong"));
set_attack_value(AT_USTRONG, AG_CATEGORY, 2);
set_attack_value(AT_USTRONG, AG_NUM_WINDOWS, 6);
set_attack_value(AT_USTRONG, AG_HAS_LANDING_LAG, 3);
set_attack_value(AT_USTRONG, AG_STRONG_CHARGE_WINDOW, 1);
set_attack_value(AT_USTRONG, AG_HURTBOX_SPRITE, sprite_get("ustrong_hurt"));
set_attack_value(AT_USTRONG, AG_USES_CUSTOM_GRAVITY, 1);

// pre-charge
set_window_value(AT_USTRONG, 1, AG_WINDOW_TYPE, 1);
set_window_value(AT_USTRONG, 1, AG_WINDOW_LENGTH, 4);
set_window_value(AT_USTRONG, 1, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_USTRONG, 1, AG_WINDOW_CUSTOM_GRAVITY, 1);

// post-charge
set_window_value(AT_USTRONG, 2, AG_WINDOW_TYPE, 1);
set_window_value(AT_USTRONG, 2, AG_WINDOW_LENGTH, 3);
set_window_value(AT_USTRONG, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_USTRONG, 2, AG_WINDOW_ANIM_FRAME_START, 1);
set_window_value(AT_USTRONG, 2, AG_WINDOW_CUSTOM_GRAVITY, 1);

//in air
set_window_value(AT_USTRONG, 3, AG_WINDOW_TYPE, 1);
set_window_value(AT_USTRONG, 3, AG_WINDOW_LENGTH, 16);
set_window_value(AT_USTRONG, 3, AG_WINDOW_ANIM_FRAMES, 8);
set_window_value(AT_USTRONG, 3, AG_WINDOW_ANIM_FRAME_START, 4);
set_window_value(AT_USTRONG, 3, AG_WINDOW_VSPEED_TYPE, 2);
set_window_value(AT_USTRONG, 3, AG_WINDOW_VSPEED, -10);
set_window_value(AT_USTRONG, 3, AG_WINDOW_CUSTOM_GRAVITY, 1);

//zazazap startup
set_window_value(AT_USTRONG, 4, AG_WINDOW_TYPE, 1);
set_window_value(AT_USTRONG, 4, AG_WINDOW_LENGTH, 4);
set_window_value(AT_USTRONG, 4, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_USTRONG, 4, AG_WINDOW_ANIM_FRAME_START, 12);
set_window_value(AT_USTRONG, 4, AG_WINDOW_VSPEED, -2);
set_window_value(AT_USTRONG, 4, AG_WINDOW_CUSTOM_GRAVITY, 1);
set_window_value(AT_USTRONG, 5, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
set_window_value(AT_USTRONG, 5, AG_WINDOW_CUSTOM_AIR_FRICTION, .5);

//zazazapppp
set_window_value(AT_USTRONG, 5, AG_WINDOW_TYPE, 1);
set_window_value(AT_USTRONG, 5, AG_WINDOW_LENGTH, 12);
set_window_value(AT_USTRONG, 5, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_USTRONG, 5, AG_WINDOW_ANIM_FRAME_START, 14);
set_window_value(AT_USTRONG, 5, AG_WINDOW_VSPEED, 0);
set_window_value(AT_USTRONG, 5, AG_WINDOW_VSPEED_TYPE, 1);
set_window_value(AT_USTRONG, 5, AG_WINDOW_CUSTOM_GRAVITY, .1);
set_window_value(AT_USTRONG, 5, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
set_window_value(AT_USTRONG, 5, AG_WINDOW_CUSTOM_AIR_FRICTION, 1.2);

//zap endlag
set_window_value(AT_USTRONG, 6, AG_WINDOW_TYPE, 1);
set_window_value(AT_USTRONG, 6, AG_WINDOW_LENGTH, 16);
set_window_value(AT_USTRONG, 6, AG_WINDOW_HAS_WHIFFLAG, 1);
set_window_value(AT_USTRONG, 6, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_USTRONG, 6, AG_WINDOW_ANIM_FRAME_START, 18);
set_window_value(AT_USTRONG, 6, AG_WINDOW_CUSTOM_GRAVITY, .2);
set_window_value(AT_USTRONG, 6, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
set_window_value(AT_USTRONG, 6, AG_WINDOW_CUSTOM_AIR_FRICTION, 0.5);

set_num_hitboxes(AT_USTRONG, 7);

set_hitbox_value(AT_USTRONG, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_USTRONG, 1, HG_SHAPE, 1);
set_hitbox_value(AT_USTRONG, 1, HG_WINDOW, 3);
set_hitbox_value(AT_USTRONG, 1, HG_LIFETIME, 16);
set_hitbox_value(AT_USTRONG, 1, HG_HITBOX_X, 0);
set_hitbox_value(AT_USTRONG, 1, HG_HITBOX_Y, -48);
set_hitbox_value(AT_USTRONG, 1, HG_WIDTH, 48);
set_hitbox_value(AT_USTRONG, 1, HG_HEIGHT, 48);
set_hitbox_value(AT_USTRONG, 1, HG_DAMAGE, 3);
set_hitbox_value(AT_USTRONG, 1, HG_ANGLE, 90);
set_hitbox_value(AT_USTRONG, 1, HG_PRIORITY, 1);
set_hitbox_value(AT_USTRONG, 1, HG_BASE_KNOCKBACK, 9);
set_hitbox_value(AT_USTRONG, 1, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(AT_USTRONG, 1, HG_BASE_HITPAUSE, 6);
set_hitbox_value(AT_USTRONG, 1, HG_HITPAUSE_SCALING, 0.1);
set_hitbox_value(AT_USTRONG, 1, HG_VISUAL_EFFECT, 301);
set_hitbox_value(AT_USTRONG, 1, HG_HIT_SFX, asset_get("sfx_blow_medium2"));

set_hitbox_value(AT_USTRONG, 3, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_USTRONG, 3, HG_HITBOX_GROUP, 3);
set_hitbox_value(AT_USTRONG, 3, HG_WINDOW, 5);
set_hitbox_value(AT_USTRONG, 3, HG_LIFETIME, 2);
set_hitbox_value(AT_USTRONG, 3, HG_HITBOX_X, 0);
set_hitbox_value(AT_USTRONG, 3, HG_HITBOX_Y, -47);
set_hitbox_value(AT_USTRONG, 3, HG_WIDTH, 60);
set_hitbox_value(AT_USTRONG, 3, HG_HEIGHT, 60);
set_hitbox_value(AT_USTRONG, 3, HG_PRIORITY, 2);
set_hitbox_value(AT_USTRONG, 3, HG_DAMAGE, 2);
set_hitbox_value(AT_USTRONG, 3, HG_ANGLE, 90); 
set_hitbox_value(AT_USTRONG, 3, HG_BASE_KNOCKBACK, 4);
set_hitbox_value(AT_USTRONG, 3, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(AT_USTRONG, 3, HG_BASE_HITPAUSE, 5);
set_hitbox_value(AT_USTRONG, 3, HG_HITPAUSE_SCALING, 0);
set_hitbox_value(AT_USTRONG, 3, HG_ANGLE_FLIPPER, 2);
set_hitbox_value(AT_USTRONG, 3, HG_VISUAL_EFFECT_X_OFFSET, 32);
set_hitbox_value(AT_USTRONG, 3, HG_VISUAL_EFFECT_Y_OFFSET, -10);
set_hitbox_value(AT_USTRONG, 3, HG_VISUAL_EFFECT, 301);
set_hitbox_value(AT_USTRONG, 3, HG_HIT_SFX, sound_get("zap"));

set_hitbox_value(AT_USTRONG, 4, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_USTRONG, 4, HG_HITBOX_GROUP, 4);
set_hitbox_value(AT_USTRONG, 4, HG_WINDOW, 5);
set_hitbox_value(AT_USTRONG, 4, HG_WINDOW_CREATION_FRAME, 3);
set_hitbox_value(AT_USTRONG, 4, HG_LIFETIME, 2);
set_hitbox_value(AT_USTRONG, 4, HG_HITBOX_X, 0);
set_hitbox_value(AT_USTRONG, 4, HG_HITBOX_Y, -47);
set_hitbox_value(AT_USTRONG, 4, HG_WIDTH, 60);
set_hitbox_value(AT_USTRONG, 4, HG_HEIGHT, 60);
set_hitbox_value(AT_USTRONG, 4, HG_PRIORITY, 2);
set_hitbox_value(AT_USTRONG, 4, HG_DAMAGE, 2);
set_hitbox_value(AT_USTRONG, 4, HG_ANGLE, 90); 
set_hitbox_value(AT_USTRONG, 4, HG_BASE_KNOCKBACK, 4);
set_hitbox_value(AT_USTRONG, 4, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(AT_USTRONG, 4, HG_BASE_HITPAUSE, 5);
set_hitbox_value(AT_USTRONG, 4, HG_HITPAUSE_SCALING, 0);
set_hitbox_value(AT_USTRONG, 4, HG_ANGLE_FLIPPER, 2);
set_hitbox_value(AT_USTRONG, 4, HG_VISUAL_EFFECT_X_OFFSET, 32);
set_hitbox_value(AT_USTRONG, 4, HG_VISUAL_EFFECT_Y_OFFSET, -10);
set_hitbox_value(AT_USTRONG, 4, HG_VISUAL_EFFECT, 301);
set_hitbox_value(AT_USTRONG, 4, HG_HIT_SFX, sound_get("zap"));

set_hitbox_value(AT_USTRONG, 5, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_USTRONG, 5, HG_HITBOX_GROUP, 5);
set_hitbox_value(AT_USTRONG, 5, HG_WINDOW, 5);
set_hitbox_value(AT_USTRONG, 5, HG_WINDOW_CREATION_FRAME, 6);
set_hitbox_value(AT_USTRONG, 5, HG_LIFETIME, 2);
set_hitbox_value(AT_USTRONG, 5, HG_HITBOX_X, 0);
set_hitbox_value(AT_USTRONG, 5, HG_HITBOX_Y, -47);
set_hitbox_value(AT_USTRONG, 5, HG_WIDTH, 60);
set_hitbox_value(AT_USTRONG, 5, HG_HEIGHT, 60);
set_hitbox_value(AT_USTRONG, 5, HG_PRIORITY, 2);
set_hitbox_value(AT_USTRONG, 5, HG_DAMAGE, 2);
set_hitbox_value(AT_USTRONG, 5, HG_ANGLE, 90); 
set_hitbox_value(AT_USTRONG, 5, HG_BASE_KNOCKBACK, 4);
set_hitbox_value(AT_USTRONG, 5, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(AT_USTRONG, 5, HG_BASE_HITPAUSE, 5);
set_hitbox_value(AT_USTRONG, 5, HG_HITPAUSE_SCALING, 0);
set_hitbox_value(AT_USTRONG, 5, HG_ANGLE_FLIPPER, 2);
set_hitbox_value(AT_USTRONG, 5, HG_VISUAL_EFFECT_X_OFFSET, 32);
set_hitbox_value(AT_USTRONG, 5, HG_VISUAL_EFFECT_Y_OFFSET, -10);
set_hitbox_value(AT_USTRONG, 5, HG_VISUAL_EFFECT, 301);
set_hitbox_value(AT_USTRONG, 5, HG_HIT_SFX, sound_get("zap"));

set_hitbox_value(AT_USTRONG, 7, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_USTRONG, 7, HG_HITBOX_GROUP, 8);
set_hitbox_value(AT_USTRONG, 7, HG_WINDOW, 5);
set_hitbox_value(AT_USTRONG, 7, HG_WINDOW_CREATION_FRAME, 9);
set_hitbox_value(AT_USTRONG, 7, HG_LIFETIME, 3);
set_hitbox_value(AT_USTRONG, 7, HG_HITBOX_X, 0);
set_hitbox_value(AT_USTRONG, 7, HG_HITBOX_Y, -47);
set_hitbox_value(AT_USTRONG, 7, HG_WIDTH, 72);
set_hitbox_value(AT_USTRONG, 7, HG_HEIGHT, 72);
set_hitbox_value(AT_USTRONG, 7, HG_PRIORITY, 2);
set_hitbox_value(AT_USTRONG, 7, HG_DAMAGE, 5);
set_hitbox_value(AT_USTRONG, 7, HG_ANGLE, 70); 
set_hitbox_value(AT_USTRONG, 7, HG_BASE_KNOCKBACK, 7);
set_hitbox_value(AT_USTRONG, 7, HG_KNOCKBACK_SCALING, 1.2);
set_hitbox_value(AT_USTRONG, 7, HG_BASE_HITPAUSE, 7);
set_hitbox_value(AT_USTRONG, 7, HG_HITPAUSE_SCALING, .5);
set_hitbox_value(AT_USTRONG, 7, HG_ANGLE_FLIPPER, 3);
set_hitbox_value(AT_USTRONG, 7, HG_VISUAL_EFFECT_X_OFFSET, 32);
set_hitbox_value(AT_USTRONG, 7, HG_VISUAL_EFFECT_Y_OFFSET, -10);
set_hitbox_value(AT_USTRONG, 7, HG_VISUAL_EFFECT, 301);
set_hitbox_value(AT_USTRONG, 7, HG_HIT_SFX, sound_get("shothurt"));