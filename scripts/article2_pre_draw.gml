
if (state == 1) draw_sprite_ext(sprite_get("b_scrapbomb"), image_index_scrapb, x, y, 1*spr_dir, 1, angle_scrapb, c_white, 1)
  
if (player_id.debug) draw_debug_text( x, y, string("fuse: ") + string(bomb_fuse) )
