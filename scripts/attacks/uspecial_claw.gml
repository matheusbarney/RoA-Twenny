set_attack_value(AT_EXTRA_3, AG_CATEGORY, 1);
set_attack_value(AT_EXTRA_3, AG_SPRITE, sprite_get("uspecial"));
set_attack_value(AT_EXTRA_3, AG_NUM_WINDOWS, 4);
set_attack_value(AT_EXTRA_3, AG_HAS_LANDING_LAG, 4);
set_attack_value(AT_EXTRA_3, AG_OFF_LEDGE, 1);
set_attack_value(AT_EXTRA_3, AG_AIR_SPRITE, sprite_get("uspecial"));
set_attack_value(AT_EXTRA_3, AG_HURTBOX_SPRITE, sprite_get("uspecial_hurt"));
set_attack_value(AT_EXTRA_3, AG_USES_CUSTOM_GRAVITY, 1);

// Startup
set_window_value(AT_EXTRA_3, 1, AG_WINDOW_LENGTH, 6);
set_window_value(AT_EXTRA_3, 1, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_EXTRA_3, 3, AG_WINDOW_ANIM_FRAME_START, 3);
set_window_value(AT_EXTRA_3, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_EXTRA_3, 1, AG_WINDOW_SFX_FRAME, 5);
set_window_value(AT_EXTRA_3, 1, AG_WINDOW_SFX, asset_get("sfx_ell_eject"));
set_window_value(AT_EXTRA_3, 1, AG_WINDOW_CUSTOM_GRAVITY, 0.2);

// Claw out
set_window_value(AT_EXTRA_3, 2, AG_WINDOW_TYPE, 9);
set_window_value(AT_EXTRA_3, 2, AG_WINDOW_LENGTH, 4);
set_window_value(AT_EXTRA_3, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_EXTRA_3, 2, AG_WINDOW_ANIM_FRAME_START, 5);
set_window_value(AT_EXTRA_3, 2, AG_WINDOW_CUSTOM_GRAVITY, 0.2);

// Zip downward
set_window_value(AT_EXTRA_3, 3, AG_WINDOW_TYPE, 9);
set_window_value(AT_EXTRA_3, 3, AG_WINDOW_LENGTH, 4);
set_window_value(AT_EXTRA_3, 3, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_EXTRA_3, 3, AG_WINDOW_ANIM_FRAME_START, 5);

// Footstool
set_window_value(AT_EXTRA_3, 4, AG_WINDOW_LENGTH, 12);
set_window_value(AT_EXTRA_3, 4, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_EXTRA_3, 4, AG_WINDOW_ANIM_FRAME_START, 2);
set_window_value(AT_EXTRA_3, 4, AG_WINDOW_CUSTOM_GRAVITY, 0.2);

set_num_hitboxes(AT_EXTRA_3, 2);

// claw
set_hitbox_value(AT_EXTRA_3, 1, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_EXTRA_3, 1, HG_WINDOW, 999);
set_hitbox_value(AT_EXTRA_3, 1, HG_LIFETIME, 2);
set_hitbox_value(AT_EXTRA_3, 1, HG_WIDTH, 32);
set_hitbox_value(AT_EXTRA_3, 1, HG_HEIGHT, 32);
set_hitbox_value(AT_EXTRA_3, 1, HG_PRIORITY, 1);
set_hitbox_value(AT_EXTRA_3, 1, HG_SHAPE, 0);
set_hitbox_value(AT_EXTRA_3, 1, HG_DAMAGE, 4);
set_hitbox_value(AT_EXTRA_3, 1, HG_ANGLE, 90);
set_hitbox_value(AT_EXTRA_3, 1, HG_BASE_KNOCKBACK, 8);
set_hitbox_value(AT_EXTRA_3, 1, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(AT_EXTRA_3, 1, HG_PROJECTILE_SPRITE, sprite_get("empty_sprite"));
set_hitbox_value(AT_EXTRA_3, 1, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_EXTRA_3, 1, HG_PROJECTILE_GROUND_BEHAVIOR, 1);
set_hitbox_value(AT_EXTRA_3, 1, HG_PROJECTILE_WALL_BEHAVIOR, 1);
set_hitbox_value(AT_EXTRA_3, 1, HG_PROJECTILE_DESTROY_EFFECT, HFX_GEN_SWEET);
set_hitbox_value(AT_EXTRA_3, 1, HG_VISUAL_EFFECT, HFX_GEN_SPIN);
set_hitbox_value(AT_EXTRA_3, 1, HG_BASE_HITPAUSE, 9);
set_hitbox_value(AT_EXTRA_3, 1, HG_HITPAUSE_SCALING, 0);
set_hitbox_value(AT_EXTRA_3, 1, HG_HIT_SFX, asset_get("sfx_blow_medium3"));
set_hitbox_value(AT_EXTRA_3, 1, HG_PROJECTILE_PARRY_STUN, true);
set_hitbox_value(AT_EXTRA_3, 1, HG_EXTENDED_PARRY_STUN, 1);
set_hitbox_value(AT_EXTRA_3, 1, HG_PROJECTILE_DOES_NOT_REFLECT, 1);
set_hitbox_value(AT_EXTRA_3, 1, HG_PROJECTILE_PLASMA_SAFE, 1);
set_hitbox_value(AT_EXTRA_3, 1, HG_PROJECTILE_UNBASHABLE, 1);

// footstool
set_hitbox_value(AT_EXTRA_3, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_EXTRA_3, 2, HG_WINDOW, 4);
set_hitbox_value(AT_EXTRA_3, 2, HG_LIFETIME, 3);
set_hitbox_value(AT_EXTRA_3, 2, HG_HITBOX_Y, 0);
set_hitbox_value(AT_EXTRA_3, 2, HG_WIDTH, 50);
set_hitbox_value(AT_EXTRA_3, 2, HG_HEIGHT, 28);
set_hitbox_value(AT_EXTRA_3, 2, HG_SHAPE, 0);
set_hitbox_value(AT_EXTRA_3, 2, HG_PRIORITY, 3);
set_hitbox_value(AT_EXTRA_3, 2, HG_DAMAGE, 7);
set_hitbox_value(AT_EXTRA_3, 2, HG_ANGLE, 45); 
set_hitbox_value(AT_EXTRA_3, 2, HG_BASE_KNOCKBACK, 8); 
set_hitbox_value(AT_EXTRA_3, 2, HG_KNOCKBACK_SCALING, 0.6); 
set_hitbox_value(AT_EXTRA_3, 2, HG_BASE_HITPAUSE, 18); 
set_hitbox_value(AT_EXTRA_3, 2, HG_HITPAUSE_SCALING, .5); 
set_hitbox_value(AT_EXTRA_3, 2, HG_HIT_SFX, asset_get("sfx_blow_medium2"));