
switch (attack) {
    case AT_FTILT:
        if (my_hitboxID.hbox_num == 1) {
            sound_play(asset_get("sfx_blow_medium2"));
            sound_play(asset_get("sfx_rag_plant_shoot"));
        }
        else sound_play(asset_get("sfx_metal_hit_weak"));
        break;
        
    case AT_FAIR:
        if (my_hitboxID.hbox_num < 3) {
            var y_dest = my_hitboxID.y - my_hitboxID.image_yscale*100; // equivalent to y + (height/2)
            hit_player_obj.y = lerp(hit_player_obj.y, y_dest, 0.2);
        }
        break;
        
    case AT_BAIR:
        sound_play(asset_get("sfx_blow_heavy2"));
        if (strong_charge > 15) sound_play(sound_get("thunderpunchedited"), false, noone, 0.7, 0.9);
        break;
        
    case AT_DAIR:
        if (my_hitboxID.hbox_num == 1) sound_play(asset_get("sfx_blow_heavy1"), false, noone, 0.7,  0.9);;
        break;
    
    case AT_FSTRONG:
        sound_play(asset_get("sfx_blow_heavy2"), false, noone, 0.5,  1.2);
        break;
    
    case AT_USTRONG:
        if (my_hitboxID.hbox_num > 1 && my_hitboxID.hbox_num < 7) sound_play(asset_get("sfx_absa_singlezap1"), false, noone, 1,  1);
        else if (my_hitboxID.hbox_num == 7) sound_play(asset_get("sfx_absa_kickhit"), false, noone, 1,  1);
        has_long_endlag = false //pseudo whifflag
        break;
    
    // Claw grab
    case AT_EXTRA_3:
        if (my_hitboxID.hbox_num == 1) {
            window = 3;
    		window_timer = 0;
    		grabbed_player_obj = hit_player_obj;
    		my_hitboxID.destroyed_next = true;
    		
    		hitpause = true;
    		hitstop = hit_player_obj.hitstop;
    		hitstop_full = hitstop;
        } else if (my_hitboxID.hbox_num == 2 || my_hitboxID.hbox_num == 3) sound_play(asset_get("sfx_frog_uspecial_cast"), false, noone, 0.6, 1.2);
        else if (my_hitboxID.hbox_num == 4) sound_play(asset_get("sfx_abyss_hazard_burst"));
        break;
    
    case AT_NSPECIAL:
        //turn into rune post-release
        //if (my_hitboxID.hbox_num == 3) {
        //    sound_play(asset_get("sfx_swish_medium"), false, noone, 1.2, 0.6);
        //    
        //    if (!hit_player_obj.twenny_hexed) {
        //        hit_player_obj.twenny_text_timer = 120;
        //        sound_play(sound_get("hexed"));
        //    }
        //    
        //    hit_player_obj.twenny_hexed = true;
        //    hit_player_obj.twenny_hex_owner = player;
        //    hit_player_obj.twenny_hex_timer = 360;
        //    hit_player_obj.twenny_hex_outline = brittle_outline;
        //    hit_player_obj.knockback_scaling += brittle_kb_mod;
        //    
        //    with (hit_player_obj) {
        //        outline_color = twenny_hex_outline;
        //        init_shader();
        //    }
        //}
        break;

    
}