if (Item != undefined) {
    draw_sprite(Item.Sprite, 0, x, y);
}

if InventoryHasRoom(obj_GUI.Inv, Item) {
    x = lerp(x, obj_Player.x, .1*global.DT);
    y = lerp(y, obj_Player.y, .1*global.DT);
    
    if (distance_to_object(obj_Player) <= 4) {
        InventoryAdd(obj_GUI.Inv, Item, 1);
        instance_destroy();
    }
}
