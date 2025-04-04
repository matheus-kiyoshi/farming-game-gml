if (follow != noone) {
    xTo = follow.x;
    yTo = follow.y;
}

x = lerp(x, xTo, .05*global.DT);
y = lerp(y, yTo, .05*global.DT);


camera_set_view_pos(view_camera[0], x - (camWidth / 2), y - (camHeight / 2));
