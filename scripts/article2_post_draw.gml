
if (player_id.debug) draw_debug_text( x, y, string("fuse: ") + string(bomb_fuse) )

if ((state == 1 || state == 11) && get_match_setting(SET_HITBOX_VIS)) draw_sprite_ext(mask_index, 0, x, y, 1, 1, 0, c_white, 0.5);