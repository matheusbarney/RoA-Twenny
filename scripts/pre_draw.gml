

if (attack == AT_NSPECIAL && window == 2) {
    switch (bomb_angle) {
        case 45: //str8
            draw_sprite_ext(sprite_get("vfx_nspec_arrows"), 1, x+32, y-64, 1 , 1 ,0, c_white, 1);
        break;
        case 90: //uppies
            draw_sprite_ext(sprite_get("vfx_nspec_arrows"), 0, x+16, y-96, 1 , 1 ,0, c_white, 1);
        break;
        case 0: //downies
            draw_sprite_ext(sprite_get("vfx_nspec_arrows"), 2, x+42, y-44, 1 , 1 ,0, c_white, 1);
        break;
    }
}