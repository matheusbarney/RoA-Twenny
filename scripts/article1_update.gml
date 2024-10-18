
// // // // STATE 0 - START

if (init == 0){
	var num_pipes = 0;
    with (asset_get("obj_article1")) if (player_id == other.player_id) {
        if (pipe_id == 1) { // Next pipe to be removed
        	pipe_id = -2;
        	state = 2;
			state_timer = 0;
        }
        else if (pipe_id == 2) { // Last pipe placed
        	pipe_id--;
        	pipe_flash_timer = pipe_flash_duration;
        	other.pipe_flash_timer = other.pipe_flash_duration;
        	sound_play(asset_get("sfx_boss_shine"), false, noone, 1, 1.4);
        	num_pipes++;
        }
        else {
        	pipe_id = 2;
        	num_pipes++;
        }
    }
    player_id.num_pipes = num_pipes;
    init = 1;
}


state_timer++; //progress the timer
if (pipe_flash_timer > 0) pipe_flash_timer--;

if (state == 0) { // STATE 0 : SPAWNING PIPE
	state_end = 9; //duration of this state in frames
    image_index_pipe = state_timer * 3 / state_end;
	//that's:
	//starting animation frame +
	//current time *
	//number of anim frame in the duration /
	//time it takes
	
    if (state_timer == state_end){//when the timer reaches end of this state's duration
        state = 1; //go to idle
        state_timer = 0; //reset timer manually
    }
    
    pipe_color = pipe_darkener
}

// // // // STATE 1 - IDLE
if (state == 1){ //
	state_end = 30; //duration of this state in frames
    image_index_pipe = 3;
	//that's:
	//starting animation frame +
	//current time *
	//number of anim frame in the duration /
	//time it takes
	
	
    if (state_timer == state_end){//when the timer reaches end of this state's duration
        state_timer = 0; //reset state timer
		image_index_pipe = 3; //you may have to reset the image_index to start of the loop manually
    }
    
    if (pipewarp_cd > 0) {
        pipewarp_cd--;
        pipe_color = pipe_darkener;
    } else {
    	if (warp_usages == 0) pipe_color = c_white;
    	else {
    		pipe_color = pipe_slightlyused;
    		cracked_alpha = 1;
    	}
    }
    
    if (player_id.num_pipes == 1) {
    	pipe_color = pipe_inactive;
    }
    
    if (player_id.num_pipes > 1) {
        with (asset_get("obj_article1")){
            if (id != other.id && player_id == other.player_id) {
		    	other.warpcoord_dir = spr_dir;
		    	other.warpcoord_angle = pipe_angle;
		    	if (pipe_angle == 90) {
		    		other.warpcoord_x = x;
		    		other.warpcoord_y = y - 24;
		    	} else {
		    		other.warpcoord_x = x + spr_dir * 16;
            		other.warpcoord_y = y - 12;
		    	}
		    	if (other.warp_usages > warp_usages) warp_usages = other.warp_usages;
            }
        }
    }
    
    //Warp handling
    if (player_id.num_pipes == 2 && pipewarp_cd <= 0) {
    
	    //check for electric hitboxes
	    var electrified = false;
	    var elec_owner = noone;
	    with (pHitBox) if (player_id.has_twenny_electric && place_meeting(x, y, other)) {
	    	var hbox_electrified = false;
	    	with (player_id) hbox_electrified = get_hitbox_value(other.attack, other.hbox_num, HG_TWENNY_ELECTRIC);
	    	if (hbox_electrified) {
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
	    		electrified = true;
	    		elec_owner = player_id;
	    	}
	    }
	    if (electrified) {
	    	with (elec_owner) {
	    		var spark = create_hitbox(livespark_attack, livespark_index, other.warpcoord_x, other.warpcoord_y);
	    	}
	    	
	    	if (warpcoord_angle == 90) {
	    		spark.hsp = 0;
	    		spark.vsp = -12;
	    	} else {
	    		spark.proj_angle = -45*warpcoord_dir;
	    		spark.spr_dir = warpcoord_dir;
	    		spark.hsp = 9*warpcoord_dir;
	    		spark.vsp = -9;
	    	}
	    	
	    	pipewarp_cd = pipewarp_cd_max;
			do_warp_effects = true;
	    }
	    
	    //warp bomb
	    if (player_id.num_pipes >= 2) with (asset_get("obj_article2")) {
	        if (other.pipewarp_cd == 0 && "is_twenny_bomb" in self && (state == 1 || state == 11) && place_meeting(x, y, other) && free && vsp >= 0 && has_tpd != other.player) {
	            //--flavor
	            sound_play(sound_get("door_close"));
	            spawn_hit_fx( x, y, HFX_GEN_SPIN);
	            
	            x = other.warpcoord_x;
	            y = other.warpcoord_y - 32;
	            
	            // Set some stuff for the bomb to handle over in its own update
	            has_tpd = other.player; // Boolean trick. Lets has_tpd evaluate to true while also tracking which pair of pipes teleported the bomb last
	            bomb_angle = other.warpcoord_angle;
	            tp_dir = other.warpcoord_dir;
	            if (state == 11) visible = false;
	            
	            if instance_exists(contact_hitbox) contact_hitbox.destroyed = true;
	            
	            state = (state == 11) ? 12 : 2;
	            state_timer = 0;
	            
	            other.warp_usages++;
	            other.pipewarp_cd = other.pipewarp_cd_max;
		    }
	    }
	    
	    //warp you
	    with (oPlayer) {
	        if (is_twenny && place_meeting(x, y, other) && free && vsp >= 0 && pipewarp_cd <= 0 && other.pipewarp_cd <= 0 && other.player_id.num_pipes == 2 && in_hstance) {
	        	other.do_warp_effects = true;
	        	
	            x = other.warpcoord_x;
	            y = other.warpcoord_y;
	            spr_dir = other.warpcoord_dir;
	            in_hstance = false;
	            
	            if (other.warpcoord_angle == 90) {
	            	vsp = -13;
	            } else {
	            	hsp = other.warpcoord_dir * 10
	            	vsp = -10
	            }
	            
	            pipewarp_cd = 10;
	            
	            other.warp_usages++;
	            other.pipewarp_cd = other.pipewarp_cd_max;
		    }
	    }
    }
    
    if (warp_usages >= warp_usages_max){//kill it when its teleported twice already
        state_timer = 0; //reset state timer
		state = 2;
    }
    
}


// // // // STATE 2 - PIPE DISAPPEARING
//set state = 2 and state_timer = 0 to make it disappear with this state
if (state == 2){ //
	state_end = 24; //duration of this state in frames
    image_index_pipe = 3 + state_timer * 4 / state_end;
	pipe_color = pipe_darkener
	
	with (asset_get("obj_article1")){
            if (id != other.id && player_id == other.player_id) {
		    	if (other.warp_usages > warp_usages) warp_usages = other.warp_usages;
            }
        }
	
    if (state_timer == state_end){//when the timer reaches end of this state's duration
        instance_destroy();
        exit;
    }
}


if (do_warp_effects) {
    sound_play(sound_get("door_close"));
    sound_play(sound_get("door_open"));
    spawn_hit_fx(x, y, HFX_GEN_SPIN);
    spawn_hit_fx(warpcoord_x, warpcoord_y, HFX_GEN_SPIN);
    do_warp_effects = false;
}

#define set_spr_dir(new_dir)
spr_dir = new_dir
image_xscale = spr_dir*article_xscale; //ensure direction is correct at all times, flips mask.
image_yscale = article_yscale;
