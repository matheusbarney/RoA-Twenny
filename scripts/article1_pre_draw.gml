
draw_sprite_ext(sprite_index_pipe, image_index_pipe, x, y, spr_dir, 1, 0, pipe_color, 1)
draw_sprite_ext(sprite_get("pipe_cracks"), pipe_angle != 90, x, y, 1*spr_dir, 1, 0, pipe_color, warp_usages > 0 && state == 1)

draw_sprite_ext(sprite_get("pipe_outline"), pipe_angle != 90, x, y, 1*spr_dir, 1, 0, hud_col, state == 1 && pipewarp_cd == 0 && player_id.num_pipes > 1);

if (pipe_flash_timer > 0) {
    shader_end();
    gpu_set_fog(true, c_white, depth, depth);
    draw_sprite_ext(sprite_index_pipe, image_index_pipe, x, y, spr_dir, 1, 0, c_white, pipe_flash_timer/pipe_flash_duration);
    gpu_set_fog(false, c_white, 1, 1);
}