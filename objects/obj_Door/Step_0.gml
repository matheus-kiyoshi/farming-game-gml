if image_index >= image_number - 1 {
    image_speed = 0;
    
    if (room == World) room_goto(House);
    else room_goto(World)
}