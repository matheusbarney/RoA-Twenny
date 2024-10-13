
switch (attack){
    case AT_USPECIAL:
        if (hbox_num == 1){
            if (place_meeting(x, y, asset_get("par_block"))) || (place_meeting(x, y, asset_get("par_jumpthrough"))) {
                destroyed = true;
            }
        
        print_debug(warpcoord_x);    
            
        //if (place_meeting(x, y, asset_get("obj_article1"))) && player_id.numof_twenny_pipes > 1 {
        //        with asset_get("obj_article1") {
        //            create_hitbox( AT_USPECIAL, 2, warpcoord_x, warpcoord_y);
        //            other.destroyed = true;
        //        }
    	//	}
    }
    break;
}