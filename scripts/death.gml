// kill pipes
with (asset_get("obj_article1")) if (player == other.player) {
    state = 2;
    state_timer = 0;
}

in_hstance = false;

if (setting_visible) {
    setting_visible = false;
    // the game handles it from here
}