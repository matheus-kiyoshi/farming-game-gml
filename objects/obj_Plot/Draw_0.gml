draw_self();

if (Crop != undefined) {
    var Sprite = Crop.Sprite;
    var SubImage = 0;
    var TotalTime = Crop.GrowTime;
    var GrowHalf = TotalTime / 3;
    
    if (Tick >= 0 and Tick <= GrowHalf) { SubImage = 0; }
    else if (Tick > GrowHalf and Tick <= (GrowHalf*2)) { SubImage = 1; }
    else if (Tick > (GrowHalf*2) and Tick < TotalTime) { SubImage = 2; }
    else { SubImage = 3; }
    
    draw_sprite_ext(Sprite, SubImage, x - 1, y - 2, 1, 1, 0, c_white, 1);    
    
}