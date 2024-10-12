
switch (attack){
    case AT_USPECIAL:
        if (hbox_num == 1){
            if (place_meeting(x, y, asset_get("par_block"))) || (place_meeting(x, y, asset_get("par_jumpthrough"))) {
                destroyed = true;
            }
    }
    break;
}