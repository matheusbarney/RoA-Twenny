is_twenny_bomb = true;

bomb_type = player_id.bomb_type; // 0 = scrap, 1 = bag

sprite_index = bomb_type ? sprite_get("b_bagbomb") : sprite_get("empty_sprite");
mask_index = bomb_type ? sprite_get("b_bagbomb_mask") : sprite_get("b_scrapbomb_mask");

can_be_grounded = true;
ignores_walls = false;

article_xscale = 1; //this is the horizontal scale
article_yscale = 1; //this is the vertical scale
image_xscale = 1; //this is the horizontal scale
image_yscale = 1; //this is the vertical scale
image_alpha = 1; //this can alter the sprite alpha (transparency)
image_angle = 0; //this can alter the sprite angle (rotation)

state = bomb_type ? 11 : 1;  // 1 = scrap, 11 = bag
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
bomb_fuse = bomb_type ? 200 : 45; // 45 = scrap, 200 = bag
fuse_active = false;

has_tpd = false;
has_boosted = false;
tp_dir = 1;

contact_hitbox = noone;

old_hsp = 0;

bag_land_timer = 0; // for anim management