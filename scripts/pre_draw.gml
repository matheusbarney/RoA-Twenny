

if (attack == AT_NSPECIAL && window == 2) {
    switch (bomb_angle) {
        case 45: //str8
            draw_sprite_ext(sprite_get("vfx_nspec_arrows"), 1, x+32*spr_dir, y-64, 1*spr_dir , 1 ,0, c_white, 1);
        break;
        case 90: //uppies
            draw_sprite_ext(sprite_get("vfx_nspec_arrows"), 0, x+16*spr_dir, y-96, 1*spr_dir , 1 ,0, c_white, 1);
        break;
        case 0: //downies
            draw_sprite_ext(sprite_get("vfx_nspec_arrows"), 2, x+42*spr_dir, y-44, 1*spr_dir , 1 ,0, c_white, 1);
        break;
    }
}