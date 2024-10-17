
if (fuse_active) bomb_fuse--;
if (bomb_fuse == 0 && state < 97) {
	state = bomb_type ? 98 : 97;
	state_timer = 0;
	sound_stop(fuse_sound);
}

state_timer++; //progress the timer


// // // // STATE 1 - SCRAPBOMB IDLE
if (state == 1) { //
	state_end = 30; //duration of this state in frames
	image_index_scrapb =  state_timer * 3 / state_end;
	
	// Movement init.
	if (state_timer == 1) {
		// A normal scrapbomb, that has never teleported before.
		if (!has_tpd) switch (bomb_angle) {
			case 45:
				vsp = -9;
				hsp = 3.5*spr_dir;
				break;
			case 90:
				vsp = -10;
				hsp = 2.5*spr_dir;
				break;
			case 0:
				vsp = -3.5;
				hsp = 5.5*spr_dir;
				break;
		}
	    // A scrapbomb that hs teleported to a pipe and returned from "stasis"
	    else {
	    	bomb_fuse = 16;
	    	sound_play(sound_get("door_open"));
	    	spawn_hit_fx(x, y-16, HFX_GEN_SPIN);
	    	switch (bomb_angle) {
	    		case 90:
	    		// Up or default pipe, sends out bomb at a 90 angle
	    			vsp = -18;
	    			hsp = 0*tp_dir;
	    			break;
	    		case 75:
	    		// Up or default pipe, sends out bomb at a 90 angle
	    			vsp = -17.5;
	    			hsp = 2*tp_dir;
	    			break;
	    		case 60:
	    		// Angle used w/ extra spray from bag bomb
	    			vsp = -17;
	    			hsp = 5*tp_dir;
	    			break;
	    		case 45:
	    		// Slanted Pipe, sends out bomb at a 45 degree angle
	    			vsp = -16;
	    			hsp = 10*tp_dir;
	    			break;
	    		case 30:
	    		// Angle used w/ extra spray from bag bomb
	    			vsp = -12;
	    			hsp = 12*tp_dir;
	    			break;
	    		
	    	}
	    }
	    old_hsp = hsp;
	}	
	
	// Bounce on walls
	if (hit_wall) {
		hsp = old_hsp*-0.8;
		sound_play(asset_get("sfx_mol_norm_bounce1"), false, noone, 0.4, 1.4+(0.4*random_func(0, 1, false)));
	}
	
	// Bomb gravity physics kinda
    if (free) {
    	vsp += 0.5
    	was_free = true;
    }
    else if (!free) {
		if (has_bounced) {
			if (hsp > 0.1) hsp -= 0.1;
			else if (hsp < -0.1) hsp += 0.1;
			else hsp = 0;
		} else {
			vsp = -3;
			fuse_active = true;
			has_bounced = true;
		}
		if (was_free) {
			was_free = false;
			sound_play(asset_get("sfx_mol_norm_bounce1"), false, noone, 0.4, 1.4+(0.4*random_func(0, 1, false)));
		}
	}
    	
    // Hitbox management
	if (state_timer == 1) contact_hitbox = create_hitbox( AT_NSPECIAL, 2, x, y );
    if (instance_exists(contact_hitbox)){
		contact_hitbox.x = x;
		contact_hitbox.y = y;
		contact_hitbox.hsp = hsp;
		contact_hitbox.vsp = vsp;
		if (contact_hitbox.has_hit) bomb_fuse = 10;
		if (!free) contact_hitbox.length = 0; 
    }

	// Rotation for bombs
	angle_scrapb -= hsp;
	
    // SFX
    if (bomb_fuse == 10 && fuse_active) fuse_sound = sound_play(asset_get("sfx_mol_flash_light"), false, noone, 0.7, 1.3);
}

if (state == 2){ // SCRAP BOMB DELAY
	state_end = 10; //duration of tp delay
	// We fully stop the bomb in its tracks while its delayed inside a pipe. theres no fuse to it yet so its chill
	hsp = clamp(hsp, 0, 0)
	vsp = clamp(vsp, 0, 0)
	
    if (state_timer == state_end){//when the timer reaches end of this state's duration
        state_timer = 0; //reset state timer
        
		state = 1;
    }
}

// // // // STATE 11 - BAG BOMB IDLE
if (state == 11) { //
	image_index_scrapb =  state_timer * 3 / state_end;

	// Movement init.
	// Bag bombs cannot be spawned from pipes, so a TPD check is not needed.
	if (state_timer == 1) switch (bomb_angle) {
		case 45:
			vsp = -9;
			hsp = 3.5*spr_dir;
			break;
		case 90:
			vsp = -10;
			hsp = 2.5*spr_dir;
			break;
		case 0:
			vsp = -3.5;
			hsp = 5.5*spr_dir;
			break;
	}
	
    // Bomb gravity physics
    if (free) vsp += 0.5
    else if (vsp >= 0) {
    	hsp = 0;
    	fuse_active = true;
    }
    
    // Hitbox management
    if (state_timer == 1) contact_hitbox = create_hitbox( AT_NSPECIAL, 4, x, y );
    if (instance_exists(contact_hitbox)){
		contact_hitbox.x = x;
		contact_hitbox.y = y;
		contact_hitbox.hsp = hsp;
		contact_hitbox.vsp = vsp;
		// if (contact_hitbox.has_hit) bomb_fuse = 10;
		if (!free && state_timer > 1) contact_hitbox.length = 0; 
	}
    
    // Anim management
    if (free || state_timer == 1) {
    	image_index = min(state_timer/4, 2);
    	bag_land_timer = -3;
    } else {
    	if (bag_land_timer == -3) sound_play(asset_get("sfx_dust_knuckle"), false, noone, 0.5, 0.8);
    	if (bag_land_timer < 0) image_index = 3;
    	else image_index = 4 + (bag_land_timer/12)%3
    	bag_land_timer++;
    }
}

if (state == 12) { // BAG BOMB TELEPORTED (splitter manager)
	visible = false;
	state_end = 10; //duration of tp delay
	// We fully stop the bomb in its tracks while its delayed inside a pipe. theres no fuse to it yet so its chill
	hsp = clamp(hsp, 0, 0)
	vsp = clamp(vsp, 0, 0)
	
    if (state_timer == state_end){//when the timer reaches end of this state's duration
    	var old_spr_dir = player_id.spr_dir;
    	player_id.bomb_type = 0;
    	
    	player_id.bomb_angle = bomb_angle;
    	var bomb = instance_create(x, y, "obj_article2");
    	bomb.has_tpd = true;
    	bomb.tp_dir = tp_dir;
    	
    	if (bomb_angle == 45) player_id.bomb_angle = 60;
    	else player_id.bomb_angle = 75;
    	var bomb = instance_create(x, y, "obj_article2");
    	bomb.has_tpd = true;
    	bomb.tp_dir = tp_dir;
    	
    	if (bomb_angle == 45) player_id.bomb_angle = 30;
    	else tp_dir *= -1; // bomb angle pulled from above
    	var bomb = instance_create(x, y, "obj_article2");
    	bomb.has_tpd = true;
    	bomb.tp_dir = tp_dir;
    	
    	player_id.spr_dir = old_spr_dir;
        instance_destroy();
        exit;
    }
}

// // // // STATE 97 - SCRAP BOMB EXPLODING
if (state == 97){ //
	var explosionHitbox = create_hitbox( AT_NSPECIAL, 1, x, y );
	sound_play(asset_get("sfx_abyss_hazard_burst"));
    spawn_hit_fx( x, y, player_id.splatter);
    instance_destroy();//remove article
    exit;//exits the code (not 100% necessary but its good to be safe)

}



// // // // STATE 98 - BAG BOMB EXPLODING
if (state == 98){ //
	image_index = 7;
	
	if (state_timer == 1) {
		var explosionHitbox = create_hitbox( AT_NSPECIAL, 3, x, y );
		sound_play(asset_get("sfx_abyss_hazard_burst"));
	    spawn_hit_fx( x, y, player_id.splatter);
	}
    if (state_timer == 5) {
	    instance_destroy();//remove article
	    exit;//exits the code (not 100% necessary but its good to be safe)
    }
}

// // // // STATE 99 - DIE SILENTLY OR DIE TRYING
if (state == 99){ //

    instance_destroy();//remove article
    exit;//exits the code (not 100% necessary but its good to be safe)

}

old_hsp = hsp;