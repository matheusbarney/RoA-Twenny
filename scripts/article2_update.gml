
if (fuse_active && !hitstop) bomb_fuse--;
if (bomb_fuse == 0 && state < 97) {
	state = bomb_type ? 98 : 97;
	state_timer = 0;
	sound_stop(fuse_sound);
}

if (!hitstop) state_timer++; //progress the timer

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
    	
    	// platform collision is unreliable, so we have to supplement it [dan why :(]
		if (vsp > 0 && place_meeting(x, y+vsp, asset_get("par_jumpthrough")) && place_meeting(x+hsp, y+vsp, asset_get("par_jumpthrough"))) {
			vsp = floor(vsp);
		}
    }
    else if (!free) {
		if (has_bounced) {
			if (hsp > 0.1) hsp -= 0.1;
			else if (hsp < -0.1) hsp += 0.1;
			else hsp = 0;
		} else {
			if (!fuse_active) fuse_sound = sound_play(asset_get("sfx_mol_flash_light"), false, noone, 0.7, 1.3);
			vsp = -3;
			fuse_active = true;
			has_bounced = true;
		}
		if (was_free) {
			was_free = false;
			sound_play(asset_get("sfx_mol_norm_bounce1"), false, noone, 0.4, 1.4+(0.4*random_func(0, 1, false)));
		}
	}
	
	
    
    // FSpec collision
    with pHitBox if (player_id.is_twenny && other.hit_cooldown <= 0 && attack == AT_FSPECIAL && place_meeting(x, y, other)) {
    	player_id.has_hit = true;
		if (!player_id.hitpause) {
			player_id.old_hsp = player_id.hsp;
			player_id.old_vsp = player_id.vsp;
		}
		player_id.hitpause = true;
		player_id.hitstop = max(player_id.hitstop, hitpause);
		player_id.hitstop_full = player_id.hitstop;
		
		spawn_hit_fx(floor((x+other.x)/2)+hit_effect_x, floor((y+other.y)/2)+hit_effect_y, hit_effect);
		sound_play(sound_effect);
		other.hitstop = max(other.hitstop, hitpause);
		
		sound_play(asset_get("sfx_mol_norm_bounce1"), false, noone, 0.4, 1.4+(0.4*random_func(0, 1, false)));
		
		if (hbox_num < 5) {
			other.hsp = (player_id.x - other.x)/4 + (5*spr_dir);
			other.vsp = (player_id.y < other.y)/10 - 6;
		} else {
			other.hsp = 8 * player_id.spr_dir;
			other.vsp = -8;
		}
		
		// Theft! (ditto interaction)
		if (other.player_id != player_id) {
			other.player_id = player_id;
			other.player = orig_player;
			other.orig_player = orig_player;
			if (instance_exists(other.contact_hitbox)) {
				other.contact_hitbox.destroyed_next = true;
				other.contact_hitbox = noone; // since a new hitbox will be generated below
			}
		}
		
		other.hit_cooldown = self.length;
		other.was_hit = true;
    }
    if (!hitstop && hit_cooldown > 0) hit_cooldown--;
    
    if (was_hit) {
    	if (!instance_exists(contact_hitbox)) contact_hitbox = create_hitbox( AT_NSPECIAL, 2, x, y );
    	if (!fuse_active) fuse_sound = sound_play(asset_get("sfx_mol_flash_light"), false, noone, 0.7, 1.3);
    	bomb_fuse = 45;
    	fuse_active = true;
    	was_hit = false;
    }
    
    // Hitbox management
	if (state_timer == 1) contact_hitbox = create_hitbox( AT_NSPECIAL, 2, x, y );
    if (instance_exists(contact_hitbox)){
		contact_hitbox.x = x;
		contact_hitbox.y = y;
		if (!hitstop) {
			contact_hitbox.hsp = hsp;
			contact_hitbox.vsp = vsp;
		} else {
			contact_hitbox.hsp = 0;
			contact_hitbox.vsp = 0;
		}
		if (contact_hitbox.has_hit) {
			if (!fuse_active) fuse_sound = sound_play(asset_get("sfx_mol_flash_light"), false, noone, 0.7, 1.3);
			bomb_fuse = 7;
			fuse_active = true;
		}
		if (!free) contact_hitbox.length = 0; 
    }

	// Rotation for bombs
	angle_scrapb -= hsp;
}

if (state == 2){ // SCRAP BOMB DELAY
	state_end = 10; //duration of tp delay
	// We fully stop the bomb in its tracks while its delayed inside a pipe. theres no fuse to it yet so its chill
	hsp = clamp(hsp, 0, 0)
	vsp = clamp(vsp, 0, 0)
	
    if (state_timer == state_end){//when the timer reaches end of this state's duration
        state_timer = 0; //reset state timer
		state = 1;
		sound_play(sound_get("door_open"));
    }
}

// // // // STATE 11 - BAG BOMB IDLE
if (state == 11) { //
	image_index_scrapb =  state_timer * 3 / state_end;

	// Movement init.
	// Bag bombs cannot be spawned from pipes, so a TPD check is not needed.
	if (state_timer == 1) {
		switch (bomb_angle) {
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
		old_hsp = hsp;
	}
	
    // Bomb gravity physics
    if (free) vsp += 0.5;
    else if (vsp >= 0) {
    	hsp = 0;
    	fuse_active = true;
    }
    
    // Bag bomb collision
    if (!free) with obj_article2 {
    	if (!free && "is_twenny_bomb" in self && state == 11 && self != other && place_meeting(x, y, other)) {
    		if (x < other.x) {
    			hsp = -2;
    			other.hsp = 2;
    		} else {
    			hsp = 2;
    			other.hsp = -2;
    		}
    	}
    }
    
    // FSpec collision
    with pHitBox if (player_id.is_twenny && other.hit_cooldown <= 0 && attack == AT_FSPECIAL && place_meeting(x, y, other)) {
    	player_id.has_hit = true;
		if (!player_id.hitpause) {
			player_id.old_hsp = player_id.hsp;
			player_id.old_vsp = player_id.vsp;
		}
		player_id.hitpause = true;
		player_id.hitstop = max(player_id.hitstop, hitpause+10);
		player_id.hitstop_full = player_id.hitstop;
		
		spawn_hit_fx(floor((x+other.x)/2)+hit_effect_x, floor((y+other.y)/2)+hit_effect_y, hit_effect);
		sound_play(sound_effect);
		other.hitstop = max(other.hitstop, hitpause+10);
		
		sound_play(asset_get("sfx_forsburn_combust"), false, noone, 0.8, 1);
		
		// Theft! (ditto interaction)
		if (other.player_id != player_id) {
			other.player_id = player_id;
			other.player = orig_player;
			other.orig_player = orig_player;
			if (instance_exists(other.contact_hitbox)) {
				other.contact_hitbox.destroyed_next = true;
				other.contact_hitbox = noone; // since a new hitbox will be generated below
			}
		}
		
		other.hit_cooldown = self.length;
		other.was_hit = true;
		other.tp_dir = player_id.spr_dir;
    }
    if (!hitstop && hit_cooldown > 0) hit_cooldown--;
    
    if (was_hit) {
    	state = 12;
    	state_timer = 9;
    	bomb_angle = 45;
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

if (state == 12) { // BAG BOMB SPLIT (teleport/fspec behavior)
	state_end = 10; //duration of tp delay
	// We fully stop the bomb in its tracks while its delayed inside a pipe. theres no fuse to it yet so its chill
	hsp = clamp(hsp, 0, 0)
	vsp = clamp(vsp, 0, 0)
	
    if (state_timer == state_end){//when the timer reaches end of this state's duration
    	player_id.bomb_type = 0;
    	
    	player_id.bomb_angle = bomb_angle;
    	var bomb = instance_create(x, y, "obj_article2");
    	bomb.has_tpd = 5; // true; not from a pipe
    	bomb.tp_dir = tp_dir;
    	bomb.hit_cooldown = 5;
    	
    	if (bomb_angle == 45) player_id.bomb_angle = 60;
    	else player_id.bomb_angle = 75;
    	var bomb = instance_create(x, y, "obj_article2");
    	bomb.has_tpd = 5; // true; not from a pipe
    	bomb.tp_dir = tp_dir;
    	bomb.hit_cooldown = 5;
    	
    	if (bomb_angle == 45) player_id.bomb_angle = 30;
    	else tp_dir *= -1; // bomb angle pulled from above
    	var bomb = instance_create(x, y, "obj_article2");
    	bomb.has_tpd = 5; // true; not from a pipe
    	bomb.tp_dir = tp_dir;
    	bomb.hit_cooldown = 5;
    	
    	if (has_tpd) sound_play(sound_get("door_open"));
    	
        instance_destroy();
        exit;
    }
}

// // // // STATE 97 - SCRAP BOMB EXPLODING
if (state == 97){ //
	if (instance_exists(contact_hitbox)) contact_hitbox.destroyed_next = true;
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
		if (instance_exists(contact_hitbox)) contact_hitbox.destroyed_next = true;
		sound_play(asset_get("sfx_abyss_hazard_burst"));
	    spawn_hit_fx( x, y, player_id.bigbomb_expl);
	}
    if (state_timer == 4) {
    	var explosionHitbox = create_hitbox( AT_NSPECIAL, 3, x, y-8 );
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
