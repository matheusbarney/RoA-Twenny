// update

// Image Mask
if (get_gameplay_time() > 100 && !start_predraw) start_predraw = true;

// Pipe warp cd
if (pipewarp_cd > 0) pipewarp_cd--;

// Crawl
switch (state) {
    case PS_WALK:
        if (state_timer % 33) == 8 sound_play(sound_get("robotstep"), false, 0, 1, (random_func(2, 3, true) + 8) * 0.1);
        was_crouching = false;
        break;
    case PS_DASH_START:
        if (state_timer == 0) sound_play(sound_get("keyboard"), false, 0, 1, 1.1);
        // no break
    case PS_DASH:
        if (state_timer % 4 == 1) sound_play(sound_get("keyboard"), false, 0, 0.2, (random_func(2, 4, true) + 8) * 0.1);
        break;
    case PS_CROUCH:
        was_crouching = true;
        
        if (left_down) spr_dir = -1;
        else if (right_down) spr_dir = 1;
        if (!right_down && !left_down) crawl_time = 0;
        else
        {
            crawl_time ++;
            var max_check = (sprite_get_number(sprite_get("crawl")) / crawl_anim_speed);
            var mod_check = floor(crawl_time % max_check);
            if (crawl_time % 20 == 1) {
                sound_stop(asset_get("sfx_gus_jump"));
                crawl_sound = sound_play(asset_get("sfx_gus_jump"), false, 0, 0.15, (random_func(2, 3, true) + 8) * 0.2);
            }
    
            if (right_down && spr_dir || left_down && -spr_dir) fake_img = crawl_time * crawl_anim_speed;
    		if (left_down && spr_dir || right_down && -spr_dir) fake_img = crawl_time * -crawl_anim_speed;
            fake_img = fake_img % sprite_get_number(sprite_get("crawl"));
    
    
            if (right_down) hsp = crawl_speed;
            if (left_down) hsp = -crawl_speed;
        }
        break;
    case PS_IDLE:
    case PS_DASH_START:
    case PS_HITSTUN:
        was_crouching = false;
        break;
}

if (!free || state == PS_HITSTUN) {
    dair_used = false;
    sound_stop(asset_get("sfx_absa_current_pop"));
}

// So... no head?
if (in_hstance) {
    if (!hstance_applied) {
        hstance_applied = true;
        hstance_old_djumps = !free ? 0 : djumps;
        djumps = max_djumps;
        knockback_adj = hstance_knockback_adj;
        walljump_hsp = hstance_walljump_hsp;
        walljump_vsp = hstance_walljump_vsp;
        
        twenny_hex_outline = brittle_outline;
        outline_color = twenny_hex_outline;
        init_shader();
    }
    
    hurtbox_spr = sprite_get("3_headhbox");
    
    if (!free) {
        state = PS_ATTACK_GROUND
        attack = AT_EXTRA_1
    }
    
    twenny_hexed = true;
    twenny_hex_owner = player;
    twenny_hex_timer = max(2, twenny_hex_timer);
    
    move_cooldown[AT_NSPECIAL] = 9999;
    move_cooldown[AT_FSPECIAL] = 9999;
    move_cooldown[AT_DSPECIAL] = 9999;
    move_cooldown[AT_USPECIAL] = 9999;
    
    move_cooldown[AT_NAIR] = 9999;
    move_cooldown[AT_UAIR] = 9999;
    move_cooldown[AT_FAIR] = 9999;
    move_cooldown[AT_DAIR] = 9999;
    move_cooldown[AT_BAIR] = 9999;
} else if (hstance_applied) {
    hstance_applied = false;
    knockback_adj = base_knockback_adj;
    djumps = hstance_old_djumps;
    walljump_hsp = base_walljump_hsp;
    walljump_vsp = base_walljump_vsp;
    
    hurtbox_spr = sprite_get("1_idlehbox");
    
    move_cooldown[AT_NSPECIAL] = 0;
    move_cooldown[AT_FSPECIAL] = 0;
    move_cooldown[AT_DSPECIAL] = 0;
    move_cooldown[AT_USPECIAL] = 0;
    
    move_cooldown[AT_NAIR] = 0;
    move_cooldown[AT_UAIR] = 0;
    move_cooldown[AT_FAIR] = 0;
    move_cooldown[AT_DAIR] = 0;
    move_cooldown[AT_BAIR] = 0;
}

// Status
with (oPlayer) if (twenny_hexed && twenny_hex_owner == other.player) {
    outline_color = twenny_hex_outline;
    
    if (get_gameplay_time() % 2 == 0) with (other) {
		var hexsparks = spawn_hit_fx( other.x-40+random_func( 1, 80, true ), other.y-(other.char_height/2)-48+random_func( 8, 96, true ), hex_fx );
		hexsparks.spr_dir = other.spr_dir;
	}
	
	// Hit heuristic
    if (twenny_hex_timer != 360 && state_cat == SC_HITSTUN && hitstop == hitstop_full && hitstop != 0) {
		sound_play(asset_get("sfx_oly_nspecial_flashbreak"));
		var brittle_break = spawn_hit_fx(x, y-floor(char_height/2), HFX_ETA_ICE_BIG);
		brittle_break.depth = depth-1;
		twenny_hex_timer = 20; // Note that multihits will reset this a few times, ensuring consistency
		if (twenny_text_timer > 20) twenny_text_timer = 20;
	}
    
    twenny_hex_timer--;
    twenny_text_timer--;
    
    if (twenny_hex_timer <= 0 || state == PS_RESPAWN) {
        twenny_hexed = false;
        outline_color = [0, 0, 0];
        knockback_scaling -= other.brittle_kb_mod;
        init_shader();
    }
}