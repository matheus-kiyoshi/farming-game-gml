// Handle Time
Time += 1 * global.DT;
TimeOfDay = sin(Time * DayNightSpeed) * 1;
TimeOfDay = clamp(TimeOfDay, 0, .8);

if (TimeOfDay > .3) {
    R = lerp(R, NightColor[0], ColorChange * global.DT);
    G = lerp(G, NightColor[1], ColorChange * global.DT);
    B = lerp(B, NightColor[2], ColorChange * global.DT);
} else {
    R = lerp(R, DayColor[0], ColorChange * global.DT);
    G = lerp(G, DayColor[1], ColorChange * global.DT);
    B = lerp(B, DayColor[2], ColorChange * global.DT);
}

var DarkColor = make_color_rgb(R, G, B);

if (!surface_exists(LightninSurface)) {
    LightninSurface = surface_create(room_width, room_height);
}

surface_set_target(LightninSurface);

// Draw darkness over screen
draw_clear_alpha(DarkColor, TimeOfDay);

// Loop throught light objects
with (obj_Torch) {
    gpu_set_blendmode(bm_subtract);
    
    var SizeOff = random_range(-.01, .01);
    draw_sprite_ext(spr_Light_Cutout, 0, x, y - 5, .45 + SizeOff, .45 + SizeOff, 0, c_white, .8);
    
    gpu_set_blendmode(bm_add);
    
    var Color = c_orange;
    draw_sprite_ext(spr_Light_Cutout, 0, x, y - 5, .45 + SizeOff, .45 + SizeOff, 0, Color, .5);
    
    gpu_set_blendmode(bm_normal);
}

surface_reset_target();

draw_surface(LightninSurface, 0, 0);
