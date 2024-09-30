//hitbox init, FOR PROJECTILES SPECIFICALLY

switch (attack) {
    case AT_FTILT:
    if (my_hitboxID.hbox_num == 1) sound_play(asset_get("sfx_blow_medium2"));
    break;
    
    case AT_FSTRONG:
    sound_play(asset_get("sfx_blow_heavy2"), false, noone, 0.5,  1.2);
    break;
    
    case AT_FTILT:
    if (my_hitboxID.hbox_num == 1) sound_play(asset_get("sfx_rag_plant_shoot"));
    else sound_play(asset_get("sfx_metal_hit_weak"));
    break;
    
    case AT_DAIR:
    if (my_hitboxID.hbox_num == 1) sound_play(asset_get("sfx_blow_heavy1"), false, noone, 0.7,  0.9);;
    break;
    
    case AT_BAIR:
        sound_play(asset_get("sfx_blow_heavy2"));
        if (strong_charge > 15) sound_play(sound_get("thunderpunchedited"), false, noone, 0.7, 0.9);
    break;
    
}