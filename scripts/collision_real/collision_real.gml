///@arg x_offset
///@arg y_offset
///@arg obj

/*
    - Checks for a collision with given object without the 
    added tolerance value applied to GM's "place_meeting"
    - Returns true if collision with given object
    - DO NOT PUT X OR Y FOR X_OFFSET OR Y_OFFSET!
*/

function collision_real(argument0,argument1,argument2) {
    var x_offset = argument0;
    var y_offset = argument1;
    var obj = argument2;
    var collision_detected = false;
    
    for(var i=0;i<instance_number(obj);i++) {
        var obj_id = instance_find(obj,i);
        
        if bbox_top + y_offset < obj_id.bbox_bottom 
        && bbox_left + x_offset < obj_id.bbox_right 
        && bbox_bottom + y_offset > obj_id.bbox_top 
        && bbox_right + x_offset > obj_id.bbox_left {
            collision_detected = true;
        }
    }
    
    return collision_detected;
}
