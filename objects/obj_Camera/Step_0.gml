if room == House {
    with (obj_Camera) {
        camWidth = 480;
        camHeight = 270;
    
        x = 176;
        y = 116;
    
        xTo = x;
        yTo = y;
        
        follow = noone; 
    }
    
    var cam = view_camera[0];
    camera_set_view_size(cam, 320, 180);
    camera_set_view_pos(cam, x, y);
} else {
    if (follow != noone) {
        xTo = follow.x;
        yTo = follow.y;
    }
    
    x = lerp(x, xTo, .05*global.DT);
    y = lerp(y, yTo, .05*global.DT);
    
    
    camera_set_view_pos(view_camera[0], x - (camWidth / 2), y - (camHeight / 2));
       
}