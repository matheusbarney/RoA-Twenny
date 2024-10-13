
draw_sprite_ext(sprite_index_pipe, image_index_pipe, x, y, 1*spr_dir, 1, 0, pipe_color, 1)
draw_sprite_ext(sprite_get("pipe_cracks"), pipe_angle != 90, x, y, 1*spr_dir, 1, 0, pipe_color, warp_usages > 0 && state == 1)

draw_sprite_ext(sprite_get("pipe_outline"), pipe_angle != 90, x, y, 1*spr_dir, 1, 0, hud_col, state == 1 && pipewarp_cd == 0 && player_id.numof_twenny_pipes > 1)