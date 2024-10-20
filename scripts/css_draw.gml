
init_shader();
switch (get_player_color( player ) ){
	default:
		draw_sprite_ext(sprite_get("css_bg_main"),1,x+8,y+8,2,2,0,-1,1);
    case 16:
        draw_sprite_ext(sprite_get("css_bg_flowey"),1,x+8,y+8,2,2,0,-1,1);
    break;
    case 19:
        draw_sprite_ext(sprite_get("css_bg_dead"),1,x+8,y+8,2,2,0,-1,1);
    break;
}


//--- ---
//
// hyuponia's "ae" css code
//
// this is my single most user-UNfriendly code.
// read my code and suffer, or just simply edit the only things you need to change.
// feel free to use or edit or redistribute, long as you don't claim the original template as yours.
// shoutouts to muno for css+ functions.
//
// to refresh the custom code proper, you have to temporarily change qe_b value or load another character with this code,
// for example hyuponia's characters, and then load your character back. sorry, there wasn't really any better way i could find.
//
// and just in case, this code goes into css_draw.gml.
//
// now, please change this string to your character's name. used for resetting the values after other characters.
//--- --
var qe_b = "Twenny"

// ! you can now scroll down until you reach "the primary part you should change."

var tmp_cur = 0;
var tmp_i = [0, 0, 0, 0, 0];
var tmp_x = [0, 0, 0, 0, 0];
var tmp_y = [0, 0, 0, 0, 0];
with(asset_get("cs_playercursor_obj")){
	tmp_cur = (!tmp_i[0])?0:(!tmp_i[1])?1:(!tmp_i[2])?2:(!tmp_i[3])?3:4
	tmp_i[tmp_cur] = 1
	tmp_x[tmp_cur] = get_instance_x( self )
	tmp_y[tmp_cur] = get_instance_y( self )
}
var tmp_pt = abs(player-5)-1
var temp_x = x + 8;
var temp_y = y + 9;
var tmp_xl = 9
var tmp_bw = 32
var tmp_yl = 151
var tmp_bh = 20
var tmp_xl1 = x+tmp_xl
var tmp_xl2 = tmp_xl1+tmp_bw
var tmp_yl1 = y+tmp_yl
var tmp_yl2 = tmp_yl1+tmp_bh
draw_set_halign(fa_left);

var ye = false;
if (variable_instance_exists(id,"qe")){
	if (qe != qe_b){
	ye = true;
	}
}

if (!variable_instance_exists(id,"ae") || ye == true){
	stance = 3;
	char_flash_alpha = 0
	
	qe = qe_b
	ae = "ae"
	oe = 0;
	ue = 0; //cur
	ne = 0; //tmp
	ee = 0;
	ee_m = 60;
	ie = 0;
	ye = false;
	dial_time = 0;
	dial_max = 8;
	
	//--- ---
	// the primary part you should change.
	//--- ---
	altsel = 0; // change the alt select sound here. if you don't want to change the sound, put 0 here.
	color_desc_activate = true; // optional "alt color description button". set to "true" to turn it on.
	
	col_max = 24; // number of alternate color palettes. 0 is the default color, count it accordingly.
	
	//first array index is for alternate color. second array index is for distinguishing the information in it.
	ce[0,0] = make_color_rgb(236, 0, 79) // "color preview square" color. can be any color!
	ce[0,1] = "An Ambrosian Anomaly" // the name of the alternate color.
	ce[0,2] = "The default color." // description to display if "alt color description button" is on. keep it blank if none, and you can remove it if you didn't turn it on.
	
	ce[1,0] = make_color_rgb(110, 24, 53)
	ce[1,1] = "New Horizon"
	ce[1,2] = "Blue alt, named lifted from SSL. [ROAACO]"
	
	ce[2,0] = make_color_rgb(52, 156, 236)
	ce[2,1] = "Fiery Passion"
	ce[2,2] = "Red alt, name lifted from SSL. [ROAACO]"
	
	ce[3,0] = make_color_rgb(91, 173, 95)
	ce[3,1] = "Green Envy"
	ce[3,2] = "Green alt, name lifted from SSL. [ROAACO]"
	
	ce[4,0] = make_color_rgb(255, 0, 234)
	ce[4,1] = "Of Hearts and Acid"
	ce[4,2] = "Purple and pink alt, name lifted from SSL. [ROAACO]"
	
	ce[5,0] = make_color_rgb(93, 83, 125)
	ce[5,1] = "Monochrome Monitor"
	ce[5,2] = "When you're feeling grey. [ROAACO]"
	
    ce[6,0] = make_color_rgb(162, 99, 44)
	ce[6,1] = "Unpleasant Gradient"
	ce[6,2] = "What are you doing when this shows up at your doorstep?"

	ce[7,0] = make_color_rgb(204, 65, 105)
	ce[7,1] = "CMYK Savant"
	ce[7,2] = "Based on TehEnd's reaper, Avant."
	
    ce[8,0] = make_color_rgb(193, 44, 45)
	ce[8,1] = "Page of Excalibur"
	ce[8,2] = "Based on F.Fungus's reaper Julee."
	
    ce[9,0] = make_color_rgb(40, 46, 93)
	ce[9,1] = "Bloody Revival"
	ce[9,2] = "Based on scaurai's reaper, Saelune."
	
    ce[10,0] = make_color_rgb(148, 168, 146)
	ce[10,1] = "Masked Nuzzle"
	ce[10,2] = "Based on Nuzl's character, Lunzg."
	
	ce[11,0] = make_color_rgb(224, 78, 217)
	ce[11,1] = "Arisen Anew"
	ce[11,2] = "this purple mfer with the smoke always keeps popping back up"
	
	ce[12,0] = make_color_rgb(27, 227, 100)
	ce[12,1] = "Radiant Devourer"
	ce[12,2] = "Based on Spider Boi's character, Chimera."
	
	ce[13,0] = make_color_rgb(117, 64, 128)
	ce[13,1] = "Cold Cuts"
	ce[13,2] = "Based on Kokacup's character, Sarolyn."
	
    ce[14,0] = make_color_rgb(132, 182, 205)
	ce[14,1] = "Crude Spoonful"
	ce[14,2] = "Based on Yuuma Toutetsu from Touhou Project."
	
    ce[15,0] = make_color_rgb(99, 42, 142)
	ce[15,1] = "Mirror Magic"
	ce[15,2] = "Based on Badeline/Part of You from Celeste."
	
    ce[16,0] = make_color_rgb(222, 38, 167)
	ce[16,1] = "Hopping Stalker"
	ce[16,2] = "Based on Hsien-ko/Lei-Lei from Darkstalkers."
	
	ce[17,0] = make_color_rgb(165, 174, 82)
	ce[17,1] = "Welcome to Chaos"
	ce[17,2] = "Based on Kaiman from Dorohedoro."
	
	ce[18,0] = make_color_rgb(250, 200, 228)
	ce[18,1] = "Pastel Clouds"
	ce[18,2] = "Eat the sky."
	
	ce[19,0] = make_color_rgb(144, 83, 194)
	ce[19,1] = "Generous Envy"
	ce[19,2] = "Eat your heart out."
	
    ce[20,0] = make_color_rgb(98, 66, 214)
	ce[20,1] = "All-Starve"
	ce[20,2] = "Based on the color scheme for the All-Star Heroines pack."
	
    ce[21,0] = make_color_rgb(240, 194, 46)
	ce[21,1] = "Feasting & Winning"
	ce[21,2] = "Based on the color scheme for the Black Lives Winning group."
	
	ce[22,0] = make_color_rgb(48, 236, 0)
	ce[22,1] = "Gutrolce"
	ce[22,2] = "Putrolce's evil twin from lore who is kind of green."
	
    ce[23,0] = make_color_rgb(152, 168, 181)
	ce[23,1] = "Colorful Stances"
	ce[23,2] = "Changes colors based on your current stance."
	
	ce[24,0] = make_color_rgb(206, 17, 38)
	ce[24,1] = "Mexico"
	ce[24,2] = "
	hell yes."
	
	ce[25,0] = make_color_rgb(206, 17, 38)
	ce[25,1] = "Undefined"
	ce[25,2] = ""
	
	ce[26,0] = make_color_rgb(206, 17, 38)
	ce[26,1] = "Undefined"
	ce[26,2] = ""
	
	ce[27,0] = make_color_rgb(206, 17, 38)
	ce[27,1] = "Undefined"
	ce[27,2] = ""
	

	// you can add more, by copypasting and changing the first index of the array accordingly.
	// ! changing part end.
	// you can ignore the mess below...
}

if (ae == "ae"){
	ae = "oe";
}
if (ae == "oe"){
	ae = "ue";
}
if (ne != ue){
    ie = (ue == col_max && ne == 0) ? -1 : (ue == 0 && ne == col_max) ? 1 : (ne < ue) ? 1 : -1 
    ne = ue;
    ae = "ne";
    if (altsel!=0){
    sound_stop(asset_get("mfx_change_color"));
    sound_stop(altsel);
    sound_play(altsel);
    }
}
if (ae == "ne"){
	ee = ee_m;
	ae = "ue";
}
if (ee > 0){
	var tw = ease_quartOut(0, 1, ee, ee_m);
	var tw_b = (ease_quartOut(0, 1, ee, ee_m)/3) - (ease_quartIn(0, 1, ee, ee_m)/3);
	var tw_c = (ease_quartOut(0, 1, ee, ee_m)/6) - (ease_quartIn(0, 1, ee, ee_m)/6);
	var tw_d = (ease_quartOut(0, 1, ee, ee_m)/3) + (ease_quartIn(0, 1, ee, ee_m));
	var tw_e = (ease_quartOut(0, 1, ee, ee_m)/6) + (ease_quartIn(0, 1, ee, ee_m)/8);
	var tw_f = (ease_quartOut(0, 1, ee, ee_m)/8) + (ease_quartIn(0, 1, ee, ee_m)/6);
	var tw_g = (ease_quartOut(0, 1, ee, ee_m)) + (ease_quartIn(0, 1, ee, ee_m)/3);
	var dist = 16;//14
	var typ = round(ease_expoIn(0, dist, ee, ee_m-2));
	//using muno's function;
	//up
	if (ue-2>=0){
	rectDraw(temp_x + 2, temp_y + 74 +(0-(dist*2)-10+(typ*ie)), temp_x + 16, temp_y + 91 +(0-(dist*2)-6+(typ*ie)),
	ce[clamp(ue-2,0,col_max),0], c_gray, (ie==-1) ? tw_c : tw_e );
	}
	if (ue-1>=0){
	rectDraw(temp_x + 2, temp_y + 74 +(0-dist-5+(typ*ie)), temp_x + 16, temp_y + 91 +(0-dist-3+(typ*ie)),
	ce[clamp(ue-1,0,col_max),0], c_gray, (ie==-1) ? tw_b : tw_d );
	}
	
	rectDraw(temp_x + 2, temp_y + 74 +(typ*ie), temp_x + 16, temp_y + 91 +(typ*ie), ce[ue,0], c_white, tw);
	
	if (ue+1<=col_max){
	rectDraw(temp_x + 2, temp_y + 74 +(dist+5+(typ*ie)), temp_x + 16, temp_y + 91 +(dist+3+(typ*ie)),
	ce[clamp(ue+1,0,col_max),0], c_gray, (ie==1) ? tw_b : tw_d );
	}
	if (ue+2<=col_max){
	rectDraw(temp_x + 2, temp_y + 74 +((dist*2)+10+(typ*ie)), temp_x + 16, temp_y + 91 +((dist*2)+6+(typ*ie)),
	ce[clamp(ue+2,0,col_max),0], c_gray, (ie==1) ? tw_c : tw_e );
	}
	//down
	
	/*if (ue+(3*-ie)<=col_max && ue+(3*-ie)>=0){
	rectDraw(temp_x + 2, temp_y + 77 +((((dist*3)+9)*-ie)+(typ*ie)),
	temp_x + 16, temp_y + 91 +((((dist*3)+9)*-ie)+(typ*ie)),
	ce[clamp(ue+(3*-ie),0,col_max),0], c_gray, tw_f);
	}*/
	
	if (dial_time == 0){
		textDraw(temp_x + 2 + ((player==0)?32:0), temp_y + 130, "fName", c_white, 0, 1000, 1, true, tw_g, ce[ue,1]);
	}
	
	ee--;
}
	ue = get_player_color(player);

//this part does button stuff, drawing etc
if (color_desc_activate){
	if (tmp_x[tmp_pt]>tmp_xl1 && tmp_x[tmp_pt]<tmp_xl2 && tmp_y[tmp_pt]>tmp_yl1 && tmp_y[tmp_pt]<tmp_yl2){
		if (dial_time<dial_max){ dial_time++; }
	}else{
		if (dial_time>0){ dial_time--; }
	}
	draw_set_alpha(0.4);
	draw_rectangle_colour(tmp_xl2-1, tmp_yl1+7, tmp_xl2, tmp_yl2, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
	textDraw(round(tmp_xl1+(tmp_bw/2))-3, round(tmp_yl1+(tmp_bh/2))-4, "fName", c_dkgray, 0, 100, 1, false, 0.3, "?");
	var dial_ease = ease_linear( 0, 100, dial_time, dial_max )
	draw_set_alpha(dial_ease/120);
	draw_rectangle_colour(x+10, y+82-round(dial_ease/30), x+210, y+153, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(dial_ease/500);
	draw_rectangle_colour(tmp_xl1, tmp_yl1+3, tmp_xl2, tmp_yl2, c_white, c_white, c_white, c_white, false);
	draw_set_alpha(1);
	textDraw(x+14, (y+87)-round(dial_ease/30), "fName", c_white, 18, 200, 1, false, dial_ease/100, string(ue)+": "+ce[ue,1]);
	textDraw(x+14, (y+107)-round(dial_ease/30), "fName", c_gray, 18, 200, 1, false, dial_ease/100, ce[ue,2]);
}
//ae code end


//aesthetics

if (get_player_color( player ) == 23) { // Stance colors
    if (get_gameplay_time() % 90 == 89) {
    	stance++;
    	if (stance == 5) stance = 1;
    	init_shader();
    	char_flash_alpha = 0.6;
    }
    char_flash_alpha -= 0.06;
}
else char_flash_alpha = 0;

if (char_flash_alpha > 0) {
	shader_end();
	gpu_set_fog(true, c_white, 0, 0);
	draw_sprite_ext(get_char_info(player, INFO_CHARSELECT), 0, x+8, y+8, 2, 2, 0, c_white, char_flash_alpha);
	gpu_set_fog(false, c_white, 0, 0);
}

//

//--- ---
// altered version of muno's functions. if you have other css codes, this part needs to be at the bottom of the code.
//--- ---



#define textDraw(x, y, font, color, lineb, linew, scale, outline, alpha, string)

draw_set_font(asset_get(argument[2]));

if argument[7]{
    for (i = -1; i < 2; i++){
        for (j = -1; j < 2; j++){
            draw_text_ext_transformed_color(argument[0] + i * 2, argument[1] + j * 2, argument[9], argument[4], argument[5], argument[6], argument[6], 0, c_black, c_black, c_black, c_black, 1);
        }
    }
}

draw_text_ext_transformed_color(argument[0], argument[1], argument[9], argument[4], argument[5], argument[6], argument[6], 0, argument[3], argument[3], argument[3], argument[3], argument[8]);

return string_width_ext(argument[9], argument[4], argument[5]);


#define rectDraw(x1, y1, x2, y2, color, out_color, alpha)

//starred land

//draw_set_alpha(argument[6]);
//main
draw_sprite_ext( sprite_get("stomachCSS"), 0, argument[0], argument[1], 1, 1, 0, argument[4], argument[6] )
//draw_rectangle_color(argument[0], argument[1], argument[2], argument[3], argument[5], argument[5], argument[5], argument[5], false);
//outline
//draw_set_alpha(argument[6]*1.5);
draw_sprite_ext( sprite_get("stomachCSS"), 1, argument[0], argument[1], 1, 1, 0, argument[5], argument[6]*1.5 )
//draw_rectangle_color(argument[0]+2, argument[1]+2, argument[2]-2, argument[3]-2, argument[4], argument[4], argument[4], argument[4], false);
//draw_set_alpha(1);

