function PlayerAnimations(hVel, vVel){
    if (hVel > 0) { Dir = 1; }
    if (hVel < 0) { Dir = 3; }
    if (vVel > 0) { Dir = 2; }
    if (vVel < 0) { Dir = 0; }

    if (hVel == 0 and vVel == 0) {
        switch(Dir) {
            case 0:
                sprite_index = spr_Player_Idle_Up;
                break;
            case 1:
                sprite_index = spr_Player_Idle_Right;
                break;
            case 2:
                sprite_index = spr_Player_Idle_Down;
                break;
            case 3:
                sprite_index = spr_Player_Idle_Left;
                break;
        }
    } else {
        switch(Dir) {
            case 0:
                sprite_index = spr_Player_Walk_Up;
                break;
            case 1:
                sprite_index = spr_Player_Walk_Right;
                break;
            case 2:
                sprite_index = spr_Player_Walk_Down;
                break;
            case 3:
                sprite_index = spr_Player_Walk_Left;
                break;
        }
    }
}