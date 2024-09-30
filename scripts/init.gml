hurtbox_spr = sprite_get("1_idlehbox");
crouchbox_spr = sprite_get("2_crouchhbox");
air_hurtbox_spr = -1;
hitstun_hurtbox_spr = -1;

char_height = 50;
idle_anim_speed = .2;
crouch_anim_speed = .1;
walk_anim_speed = .125;
dash_anim_speed = .25;
pratfall_anim_speed = .25;


//quick wait anim setup
wait_time = sprite_get_number(sprite_get("idle"))*(2/*[Amount of Idle Loops]*/)/idle_anim_speed
wait_length = sprite_get_number(sprite_get("idle_fidget")) * 4;//replace last number with amount of in-game frame each anim-frame plays
wait_sprite = sprite_get("idle_fidget");//put the wait anim sprite here

walk_speed = 3.25;
walk_accel = 0.2;
walk_turn_time = 9;
initial_dash_time = 12;
initial_dash_speed = 7;
dash_speed = 6.5;
dash_turn_time = 11;
dash_turn_accel = 1.4;
dash_stop_time = 4;
dash_stop_percent = .35; //the value to multiply your hsp by when going into idle from dash or dashstop
ground_friction = .4;
moonwalk_accel = 1.4;

jump_start_time = 5;
jump_speed = 10.99;
short_hop_speed = 5.5;
djump_speed = 10;
leave_ground_max = 7; //the maximum hsp you can have when you go from grounded to aerial without jumping
max_jump_hsp = 6; //the maximum hsp you can have when jumping from the ground
air_max_speed = 5; //the maximum hsp you can accelerate to when in a normal aerial state
jump_change = 3; //maximum hsp when double jumping. If already going faster, it will not slow you down
air_accel = .3;
prat_fall_accel = .9; //multiplier of air_accel while in pratfall
air_friction = .04;
max_djumps = 1;
double_jump_time = 31; //the number of frames to play the djump animation. Can't be less than 31.
walljump_hsp = 6;
walljump_vsp = 7;
walljump_time = 32;
max_fall = 10; //maximum fall speed without fastfalling
fast_fall = 13; //fast fall speed
gravity_speed = .5;
hitstun_grav = .45;
knockback_adj = 0.9; //the multiplier to KB dealt to you. 1 = default, >1 = lighter, <1 = heavier

land_time = 6; // heavy landtime
prat_land_time = 6;
wave_land_time = 10;
wave_land_adj = 1.35; //the multiplier to your initial hsp when wavelanding. Usually greater than 1
wave_friction = .05; //grounded deceleration when wavelanding

//crouch animation frames
crouch_startup_frames = 3;
crouch_active_frames = 1;
crouch_recovery_frames = 2;

//parry animation frames
dodge_startup_frames = 2;
dodge_active_frames = 1;
dodge_recovery_frames = 3;

//tech animation frames
tech_active_frames = 1;
tech_recovery_frames = 1;

//tech roll animation frames
techroll_startup_frames = 2
techroll_active_frames = 2;
techroll_recovery_frames = 2;
techroll_speed = 9;

//airdodge animation frames
air_dodge_startup_frames = 1;
air_dodge_active_frames = 2;
air_dodge_recovery_frames = 3;
air_dodge_speed = 7.5;

//roll animation frames
roll_forward_startup_frames = 3;
roll_forward_active_frames = 2;
roll_forward_recovery_frames = 4;
roll_back_startup_frames = 3;
roll_back_active_frames = 2;
roll_back_recovery_frames = 4;
roll_forward_max = 9; //roll speed
roll_backward_max = 9;

land_sound = asset_get("sfx_land_med");
landing_lag_sound = asset_get("sfx_land");
waveland_sound = asset_get("sfx_waveland_zet");
jump_sound = asset_get("sfx_jumpground");
djump_sound = asset_get("sfx_jumpair");
air_dodge_sound = asset_get("sfx_quick_dodge");

//visual offsets for when you're in Ranno's bubble
bubble_x = 0;
bubble_y = 8;

//VICTORY MUSIC AND BG SET ---------------------------------------------------------------------------------
//set_victory_bg( sprite_get( "[bg sprite name]" )); //Victory BackGround
//set_victory_theme(sound_get("[victory music file name]")); //Victory BGMusic
//remove the slashes at the start of the lines to use the above 2

//hfx template ---------------------------------------------------------------------------------
//[hit fx name] = hit_fx_create( sprite_get( "[hit fx sprite name]" ), [lifetime/length]);

//hit particles ---------------------------------------------------------------------------------
//just put the sprites into the sprites folder, named as hit_particle[number], like hit_particle1, up to 1-6
//or use below to change mid-game
//set_hit_particle_sprite( [number, start with 1, up to 6], sprite_get("[hit particle sprite name]"));

//usual variables i use ---------------------------------------------------------------------------------
maioeseeanimframes = 0; //I usually use a variable to control image_index/anim frames for animation.gml
//if youre using this as a template, replace "maiosee" with your char's name. 
//unique variables = less mess with other variable owners

//Image Mask
start_predraw = false;

//////////hi twenny
is_twenny = true;
dair_used = false;
was_crouching = false;

//crawl stuff
crawl_time = 0;
crawl_speed = 2.5;
crawl_anim_speed = 0.15;
crawl_sound = noone;
fake_img = 0;

//warp pipe article
my_twenny_pipes = [ ];
numof_twenny_pipes = 0;
latest_pipe_angle = 90;


//-- NSPEC: THE BOMB
nspecCharge = 0;
bomb_type = 0; // 0 = scrap, 1 = big
bomb_angle = 45;
nspecCharge_bagAmount = 45;// Frames to charge garbage bag

//-- Monitor Head Stance.
in_hstance = false;

sting = hit_fx_create( sprite_get( "vfx_sting" ), 21 );
splsh = hit_fx_create( sprite_get( "vfx_splattersplash" ), 21 );
splatter = hit_fx_create( sprite_get( "vfx_splatter" ), 21 );
