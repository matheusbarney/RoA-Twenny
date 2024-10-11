sprite_index = sprite_get("empty_sprite") 
mask_index = sprite_get("pipe_mask") 
depth = 1;
article_xscale = 1;
article_yscale = 1;
spr_dir = player_id.spr_dir;
image_xscale = player_id.spr_dir; //this is the horizontal scale
image_yscale = 1; //this is the vertical scale
image_alpha = 1; //this can alter the sprite alpha (transparency)
image_angle = 0; //this can alter the sprite angle (rotation)
init = 0;

can_be_grounded = true;
ignores_walls = false;
free = false;

state = 0;
state_timer = 0;
state_end = 0;

uses_shader = true;

pipe_color = c_white

//--- identifier for pipe
pipe_id = -1;

summon_time = 8;

//--- Hey Peebrain, You Teleport?
warpcoord_x = 0;
warpcoord_y = 0;
warpcoord_dir = 1;
warpcoord_angle = 90;
//
pipewarp_cd = 0;
pipewarp_cd_max = 120; //limits how many frames the cooldown is
//
warp_usages = 0;
warp_usages_max = 2;
//---------------------------------

//--- PIPE'S ANGLE gets defined here.
pipe_angle = player_id.latest_pipe_angle
if (pipe_angle == 90) {
    mask_index = sprite_get("pipe_mask") 
    sprite_index_pipe =  sprite_get("pipe_straight")   
}
else {
    mask_index = sprite_get("pipe_mask_slanted"); 
    sprite_index_pipe =  sprite_get("pipe_slanted");
    spr_dir = player_id.latest_pipe_dir;
    image_xscale = player_id.latest_pipe_dir;
}
image_index_pipe = 0;
//--- EMBELISHMENTS
pipe_slightlyused = $cccccc;
pipe_darkener = $999999;
cracked_alpha = 0;
hud_col = get_player_hud_color(player);  
