///@arg x_offset
///@arg y_offset
///@arg obj

/*
    - Checks for a collision between the colling instance 
    and the given object without the added tolerance value 
    applied to GM's "instance_place"
    - Returns id of object upon collision
    - DO NOT PUT X OR Y FOR X_OFFSET OR Y_OFFSET!
*/

function collision_real_id(argument0,argument1,argument2) {
    var x_offset = argument0;
    var y_offset = argument1;
    var obj = argument2;
    var collision_id = noone;
    
    for(var i=0;i<instance_number(obj);i++) {
        var obj_id = instance_find(obj,i);
        
        if bbox_top + y_offset < obj_id.bbox_bottom 
        && bbox_left + x_offset < obj_id.bbox_right 
        && bbox_bottom + y_offset > obj_id.bbox_top 
        && bbox_right + x_offset > obj_id.bbox_left {
            collision_id = obj_id;
        }
    }
    
    return collision_id;
}
