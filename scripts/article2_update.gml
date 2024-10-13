if (bomb_fuse > 0 && bomb_fuse < 999) {
	bomb_fuse--
}
if (bomb_fuse == 0) {
	if (state != 97){
				state = 97;
				state_timer = 0;
			}
}


// // // // STATE 0 - START

if (init == 0){
    init = 1;
	//do whatever to start out in update gml here if you want, very much optional
	
	//this bit of code makes it so that if you have more than 1 of this article out in the stage, all the other ones you had around will be removed
	//change the values of course, like change "obj_article2" accordingly to what article number this is or etc
	//it can be safely removed or disabled
    //with (asset_get("obj_article2")){
    //    if (id != other.id && player_id == other.player_id){
	//		if (state != 2){
	//			state = 2;
	//			state_timer = 0;
	//		}
    //    }
    //}
}

state_timer++; //progress the timer

if (state == 0){ //
	state_end = 1; //duration of this state in frames
    //image_index = 0 + state_timer * 5 / summon_time;
	//that's:
	//starting animation frame +
	//current time *
	//number of anim frame in the duration /
	//time it takes
	
    if (state_timer == state_end){//when the timer reaches end of this state's duration
        state = 1; //go to idle
        state_timer = 0; //reset timer manually
    }

}

// // // // STATE 1 - SCRAPBOMB IDLE
if (state == 1){ //
	state_end = 30; //duration of this state in frames
	image_index_scrapb =  state_timer * 3 / state_end;
	
	// Rotation for bombs
	if (hsp*spr_dir > 0.9 || vsp != 0) {
    		angle_scrapb += 5;
    	}
    	
	if (state_timer == 0) scrapb_hitbox = create_hitbox( AT_NSPECIAL, 2, x, y );
    if (instance_exists(scrapb_hitbox)){
	scrapb_hitbox.x = x;
	scrapb_hitbox.y = y;
	scrapb_hitbox.hsp = hsp;
	scrapb_hitbox.vsp = vsp;
	if (scrapb_hitbox.has_hit){
			bomb_fuse = 10;
		}
	if (!free) {
		scrapb_hitbox.length = 0; 
	}
}

	// A normal scrapbomb, that has never teleported before.
    if (!has_tpd) {
    	switch (bomb_angle) {
    		case 45:
    			if (state_timer == 0) {
    				vsp = -9;
    				hsp = 3.5*spr_dir;
    			}
    		break;
    		case 90:
    			if (state_timer == 0) {
    				vsp = -10;
    				hsp = 2.5*spr_dir;
    			}
    		break;
    		case 0:
    			if (state_timer == 0) {
    				vsp = -3.5;
    				hsp = 5.5*spr_dir;
    			}
    		break;
    	}
    	
    
    // A scrapbomb that hs teleported to a pipe and returned from "stasis"
    } else {
    	
    	switch (bomb_angle) {
    		case 90:
    		// Up or default pipe, sends out bomb at a 90 angle
    			vsp = clamp(vsp, -18, -18);
    			hsp = 0*tp_dir;
    			bomb_fuse = 16;
    			sound_play(sound_get("door_open"));
    			spawn_hit_fx( x, y-32, HFX_GEN_SPIN);
    			bomb_angle = 1; //only do this for one frame. prob hacky but its an honest living
    		break;
    		case 45:
    		// Slanted Pipe, sends out bomb at a 45 degree angle
    			vsp = clamp(vsp, -16, -16);
    			hsp = 10*tp_dir;
    			bomb_fuse = 16;
    			sound_play(sound_get("door_open"));
    			spawn_hit_fx( x, y-16, HFX_GEN_SPIN);
    			bomb_angle = 1; //only do this for one frame. prob hacky but its an honest living
    		break;
    	}
    }
    
    // Bomb gravity physics kinda
    if free vsp += 0.5
    else if (!free && hsp*spr_dir >= 0) {
    		if (has_bounced) {
    			// this looks soo stupid but its so there isnt weird behavior when bombs are at fully 0 speed
    			if ((spr_dir > 0 && hsp > 0) || (spr_dir < 0 && hsp < 0))
    				hsp -= 0.1*spr_dir;
    			else
    				hsp = 0;
    		}
    		else {
    			vsp = -3;
    			if bomb_fuse == 999
					bomb_fuse = bomb_scrp_fusemax;
    			has_bounced = true;
    		}
    	}
    	
	//that's:
	//starting animation frame +
	//current time *
	//number of anim frame in the duration /
	//time it takes
	
    if (state_timer == state_end){//when the timer reaches end of this state's duration
        state_timer = 0; //reset state timer
		image_index = 0; //you may have to reset the image_index to start of the loop manually
    }
}

if (state == 2){ //DELAY
	state_end = 10; //duration of tp delay
	// We fully stop the bomb in its tracks while its delayed inside a pipe. theres no fuse to it yet so its chill
	hsp = clamp(hsp, 0, 0)
	vsp = clamp(vsp, 0, 0)
	
    if (state_timer == state_end){//when the timer reaches end of this state's duration
        state_timer = 0; //reset state timer
        
		state = 1;
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

//you can safely add more states, copypaste state 0 or so and change the state number

// // // // STATE 99 - DIE SILENTLY OR DIE TRYING
//set state = 2 and state_timer = 0 to make it disappear with this state
if (state == 99){ //

    instance_destroy();//remove article
    exit;//exits the code (not 100% necessary but its good to be safe)

}

