var xDiff = (obj_Camera.camWidth / 2);
var yDiff = (obj_Camera.camHeight / 2);
var slotSize = 34; 
var itemScale = 1.5;

if (InvOpen) {
    // Inventory
    for (var i = 0; i < array_length(Inv); i++) {
        var xx = xDiff - 72 + (i mod InvWidth) * 36;
        var yy = yDiff - 40 + (i div InvWidth) * 38;
        
        if (i > InvWidth - 1) { yy = yy + 6}
        
        draw_sprite_ext(spr_Inventory_Slot, 0, xx, yy, 1, 1, 0, c_white, 1)
        
        // draw item in slot
        if (Inv[i] != -1) {
            var Sprite = Inv[i][0].Sprite;
            var spriteW = sprite_get_width(Sprite) * itemScale;
            var spriteH = sprite_get_height(Sprite) * itemScale;
            
            var itemX = xx - (slotSize - spriteW) - 2;
            var itemY = yy - (slotSize - spriteH) - 3;
            
            draw_sprite_ext(Sprite, 0, itemX, itemY, itemScale, itemScale, 0, c_white, 1);
            
            // draw amount
            if (Inv[i][1] > 1) {
                draw_set_halign(fa_right);
            
                // main text
                draw_set_color(c_white);
                draw_text_transformed(xx + 14, yy + 3, string(Inv[i][1]), 1.2, 1.2, 0);
                
                draw_set_halign(fa_left);
            }
        }
        
        // Draw Hover
        if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), xx-21, yy-22, xx+21, yy+22)) {
            draw_sprite_ext(spr_Inventory_Slot_Hover, 0, xx - slotSize/2, yy - slotSize/2, 1.05, 1.05, 0, c_white, 1);
            
            if (mouse_check_button_pressed(mb_left)) {
                InvStartDrag(Inv, i);
            }
            
            if (mouse_check_button_released(mb_left)) {
                InvEndDrag(Inv, i);
            }
        }
    }   
    
    ShowItemDrag();
} else {
    // Hotbar
    for (var i = 0; i < InvWidth ; i++) {
        var xx = xDiff - 72 + (i mod InvWidth) * 36;
        var yy = yDiff + 110;
        
        draw_sprite(spr_Inventory_Slot, 0, xx, yy)
        // draw item in slot
        if (Inv[i] != -1) {
            var Sprite = Inv[i][0].Sprite;
            var spriteW = sprite_get_width(Sprite) * itemScale;
            var spriteH = sprite_get_height(Sprite) * itemScale;
            
            var itemX = xx - (slotSize - spriteW) - 2;
            var itemY = yy - (slotSize - spriteH) - 3;
            
            draw_sprite_ext(Sprite, 0, itemX, itemY, itemScale, itemScale, 0, c_white, 1);
            
            // draw amount
            if (Inv[i][1] > 1) {
                draw_set_halign(fa_right);
                            
                // main text
                draw_set_color(c_white);
                draw_text_transformed(xx + 14, yy + 3, string(Inv[i][1]), 1.2, 1.2, 0);
                
                draw_set_halign(fa_left);
            }
        }
        
        if (i == HotBarSelect) {
            draw_sprite_ext(spr_Inventory_Slot_Hover, 0, xx - slotSize/2, yy - slotSize/2, 1.05, 1.05, 0, c_white, 1);
        }
    }
}

// Use Items
if (mouse_check_button_pressed(mb_left) and !InvOpen) {
    var NC = instance_nearest(mouse_x, mouse_y, obj_Plot);
    if (NC.Crop != undefined) {
        if (NC.Tick >= NC.Crop.GrowTime) {
            if (
                point_in_rectangle(mouse_x, mouse_y, NC.x - 8, NC.y - 8, NC.x + 8, NC.y + 8) 
                and point_distance(obj_Player.x, obj_Player.y, NC.x, NC.y) < 32
            ) {
                var Item = NC.Crop.Drop[0];
                var Amount = NC.Crop.Drop[1];
                
                repeat(Amount) {
                    var Drop = instance_create_depth(NC.x, NC.y, 0, obj_Item);
                    Drop.Item = Item;
                }
                
                NC.Tick = 0;
                NC.Crop = undefined;
            }   
        }
    }
    
    if (Inv[HotBarSelect] != -1) {
        switch (Inv[HotBarSelect][0].ItemType) {
            case "Crop":
                break;
            case "Tool":
                var xx = round(mouse_x / 20) * 20;
                var yy = round(mouse_y / 16) * 16;
            
                if (!collision_rectangle(xx - 2, yy - 2, xx + 2, yy + 2, obj_Plot, 0, 1)) {
                    instance_create_depth(xx, yy, 0, obj_Plot);
                }
            
                break;
            case "Seed":
                var NP = instance_nearest(mouse_x, mouse_y, obj_Plot);
                if (
                    point_in_rectangle(mouse_x, mouse_y, NP.x - 8, NP.y - 8, NP.x + 8, NP.y + 8) 
                    and point_distance(obj_Player.x, obj_Player.y, NP.x, NP.y) < 32
                ) {
                    var Crop = undefined;
                    switch (Inv[HotBarSelect][0]) {
                        case global.ItemWheatSeed:
                            Crop = global.CropWheat;
                            break;
                        case global.ItemTomatoSeed:
                            Crop = global.CropTomato;
                            break;
                    }
                    
                    NP.Crop = Crop; 
                    InventoryRemove(Inv, Inv[HotBarSelect][0], 1);
                }
                break;
        }
    }
}

// Draw Dialogue

if (instance_exists(obj_TextBox)) {
    obj_Player.state = "stop";
    var kNext = keyboard_check_pressed(vk_space)
    
    // Handle Pages
    if kNext {
        if (obj_TextBox.CurrentChar >= string_length(obj_TextBox.Text[obj_TextBox.Page])) {
            if (obj_TextBox.Page < array_length(obj_TextBox.Text) - 1) {
                obj_TextBox.Page++;
                obj_TextBox.CurrentChar = 0;
                obj_TextBox.String = "";
            } else {
                instance_destroy(obj_TextBox);
                obj_Player.state = "move";
            }
        } else {
            obj_TextBox.CurrentChar = string_length(obj_TextBox.Text[obj_TextBox.Page]);
        }  
    }
    
    // Handle Typewritter effect
    if instance_exists(obj_TextBox) {
       if (obj_TextBox.CurrentChar < string_length(obj_TextBox.Text[obj_TextBox.Page])) {
           obj_TextBox.CurrentChar += obj_TextBox.TextSpeed * global.DT;
       }
    }
    
    // Reset string and Add new string +1 character each update
    if instance_exists(obj_TextBox) {
        if (string_length(obj_TextBox.String) < string_length(obj_TextBox.Text[obj_TextBox.Page])) {
            for (var i = 0; i < obj_TextBox.CurrentChar + 1; i++) {
                var Char = string_copy(obj_TextBox.Text[obj_TextBox.Page], 1, obj_TextBox.CurrentChar);
                obj_TextBox.String = string(Char);
            }
        }
    }
    
    // Draw TextBox
    if instance_exists(obj_TextBox) {
        obj_TextBox.Anim += 1 * global.DT;
        draw_sprite_stretched(spr_TextBox_Neutral, obj_TextBox.Anim, obj_TextBox.TBX, obj_TextBox.TBY, obj_TextBox.TBoxWidth, obj_TextBox.TBoxHeight);
        
        draw_set_font(global.FontDialogue);
        draw_text_ext(obj_TextBox.TBX + obj_TextBox.Border, obj_TextBox.TBY + obj_TextBox.Border, obj_TextBox.String, obj_TextBox.LinePadding, obj_TextBox.Width);
    }
}
















