if (state == "move") {
    //Controls
    var kLeft = keyboard_check(ord("A"));
    var kUp = keyboard_check(ord("W"));
    var kDown = keyboard_check(ord("S"));
    var kRight = keyboard_check(ord("D")); 
    //Movement
    var xDir = kRight - kLeft;
    var yDir = kDown - kUp;
    
    var _inputDir = point_direction(0, 0, xDir, yDir);
    var _inputMag = (xDir != 0) || (yDir != 0);

    hspd = lengthdir_x(_inputMag * mspd, _inputDir);
    vspd = lengthdir_y(_inputMag * mspd, _inputDir);
    
    //Scaling
    image_xscale = clamp(image_xscale,1,3);
    image_yscale = clamp(image_yscale,1,3);
    
    //Collisions
    scr_collision();
}

PlayerAnimations(hspd, vspd);

/*
// p old movement
if (state == "move") {
    var kLeft = keyboard_check(ord("A"));
    var kUp = keyboard_check(ord("W"));
    var kDown = keyboard_check(ord("S"));
    var kRight = keyboard_check(ord("D")); 
      
    // Direction
    xDir = kRight - kLeft;
    yDir = kDown - kUp;
      
    var _inputDir = point_direction(0, 0, xDir, yDir);
    var _inputMag = (xDir != 0) || (yDir != 0);
   
    xspd = lengthdir_x(_inputMag * moveSpd, _inputDir);
    yspd = lengthdir_y(_inputMag * moveSpd, _inputDir);
    
    // collision
    var _subpixel = .5;
    if (place_meeting(x + xspd, y, obj_Collision)) {
    var _pixelCheck = _subpixel * sign(xspd);
    while (!place_meeting(x + _pixelCheck, y, obj_Collision)) { x += _pixelCheck }
    xspd = 0;
    }
    
    if (place_meeting(x, y + yspd, obj_Collision)) {
    var _pixelCheck = _subpixel * sign(yspd);
    while (!place_meeting(x, y + _pixelCheck, obj_Collision)) { y += _pixelCheck }
    yspd = 0;
    }
      
    x += xspd;
    y += yspd;
}

PlayerAnimations(xspd, yspd);

// Old Movement
// Input
var kLeft = keyboard_check(ord("A"));
var kUp = keyboard_check(ord("W"));
var kDown = keyboard_check(ord("S"));
var kRight = keyboard_check(ord("D"));

// Movement
var hVel = (kRight - kLeft) * spd;
var vVel = (kDown - kUp) * spd;

var Mag = sqrt((hVel * hVel) + (vVel * vVel));
if Mag == 0 { Mag = 1;}
    
move_and_collide((hVel/Mag)*global.DT, (vVel/Mag)*global.DT, obj_Collision);

if place_meeting(x+hVel,y,obj_Collision) {
    while !place_meeting(x+sign(hVel),y,obj_Collision) {
        x += sign(hVel);
    }
    hVel = 0;
}
x += hVel;

if place_meeting(x,y+vVel,obj_Collision) {
    while !place_meeting(x,y+sign(vVel),obj_Collision) {
        y += sign(vVel);
    }
    vVel = 0;
}
y += vVel;
*/

// PlayerAnimations(hVel, vVel);

depth = -y;
