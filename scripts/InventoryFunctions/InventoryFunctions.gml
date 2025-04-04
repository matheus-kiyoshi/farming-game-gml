function InvAdd(InvArray, Item){
    // if item already exists in the inventory
    for (var i = 0; i < array_length(InvArray); i++) {
        if (InvArray[i] != -1) {
            if (InvArray[i][0] == Item) {
                InvArray[i][1]++;
                return;
            }
        }
    }
    
    // add new stack
    for (var i = 0; i < array_length(InvArray); i++) {
        if (InvArray[i] == -1) {
            InvArray[i] = [Item, 1];
            return;
        }
    }
}

function InventoryAdd(InvArray, Item, Quantity) {
    repeat(Quantity) {
        InvAdd(InvArray, Item);
    }
    return;
}

function InvRemove(InvArray, Item){
    for (var i = 0; i < array_length(InvArray); i++) {
        if (InvArray[i] != -1) {
            if (InvArray[i][0] == Item) {
                if (InvArray[i][1] > 1) {
                    InvArray[i][1]--;    
                    return;
                } else {
                    InvArray[i] = -1
                    return; 
                }
            }
        }
    }
}

function InventoryRemove(InvArray, Item, Quantity) {
    repeat(Quantity) {
        InvRemove(InvArray, Item);
    }
    return;
}

function InvStartDrag(InvArray, Slot) {
    if (InvFrom == undefined and InvArray[Slot] != -1) {
        InvFrom = InvArray;
        SlotFrom = Slot;
    }
    return;
}

function InvEndDrag(InvArray, Slot) {
    if (InvFrom != undefined) {
        InvTo = InvArray;
        SlotTo = Slot;
        
        var TempFrom = InvFrom[SlotFrom];
        var TempTo = InvTo[SlotTo];
        
        InvFrom[SlotFrom] = TempTo;
        InvTo[SlotTo] = TempFrom;
        
        InvFrom = undefined;
        SlotFrom = undefined;
        InvTo = undefined;
        SlotTo = undefined;
    }
    return;
}

function ShowItemDrag() {
    if (InvFrom != undefined) {
        var Sprite = InvFrom[SlotFrom][0].Sprite;
        draw_sprite_ext(Sprite, 0, device_mouse_x_to_gui(0) - 16, device_mouse_y_to_gui(0) - 16, 2, 2, 0, c_white, 1);
    }
}

function InventoryHasRoom(InvArray, Item) {
    for (var i = 0; i < array_length(InvArray); i++) {
        if (InvArray[i] == -1) return true
        else  if (InvArray[i] != -1) {
            if (InvArray[i][0] == Item) {
                return true    
            }       
        }
    }
    return false;
}

