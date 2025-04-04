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
/*
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
PlayerAnimations(hVel, vVel);

