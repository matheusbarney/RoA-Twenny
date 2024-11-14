is_twenny_bomb = true;
is_playtest = (player_id.object_index == oTestPlayer);

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
scrapbomb_visual = player_id.scrapbomb_visual


angle_scrapb = 0;
has_bounced = false;
was_free = false; // used for sfx

spr_dir = player_id.spr_dir
bomb_angle = player_id.bomb_angle;
bomb_fuse = bomb_type ? 120 : 45; // 45 = scrap, 100 = bag
fuse_active = false;
fuse_color = /*#*/$ffffff;

has_tpd = false;
has_boosted = false;
tp_dir = 1;

contact_hitbox = noone;
has_hit = false;

hit_cooldown = 0; // for fspec
was_hit = 0; // one-frame flag; used to replenish hitbox
old_hsp = 0; // for walls

bag_land_timer = 0; // for anim management
fuse_sound = noone;

