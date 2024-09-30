//in article#_init.gml

sprite_index = sprite_get("empty_sprite")  ;//this is the sprite
mask_index = sprite_get("b_scrapbomb_mask");//this is the sprite

can_be_grounded = true;
ignores_walls = false;

article_xscale = 1; //this is the horizontal scale
article_yscale = 1; //this is the vertical scale
image_xscale = 1; //this is the horizontal scale
image_yscale = 1; //this is the vertical scale
image_alpha = 1; //this can alter the sprite alpha (transparency)
image_angle = 0; //this can alter the sprite angle (rotation)

init = 0;

state = 0;
state_timer = 0;
state_end = 0;

free = false;
can_be_grounded = true;
ignores_walls = false;
uses_shader = true;

//

image_index_scrapb = 0;
angle_scrapb = 0;
has_bounced = false;

spr_dir = player_id.spr_dir
bomb_angle = player_id.bomb_angle;

bomb_fuse = 999
bomb_scrp_fusemax = 45; 
bomb_big_fusemax = 200;

has_tpd = false;
has_boosted = false;
tp_dir = 1;

bomb_type = player_id.bomb_type; // 0 = scrap, 1 = big

scrapb_hitbox = noone;