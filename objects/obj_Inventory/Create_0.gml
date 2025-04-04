ItemInformation();
CropInformation();

InvWidth = 5;
invHeight = 3;

Inv = array_create(InvWidth*invHeight, -1);
InvOpen = false;

HotBarSelect = 0;

// Drag 
InvFrom = undefined;
InvTo = undefined;
SlotFrom = undefined;
SlotTo = undefined;


display_set_gui_size(obj_Camera.camWidth, obj_Camera.camHeight);

InventoryAdd(Inv, global.ItemMilk, 24);
InventoryAdd(Inv, global.ItemEgg, 4);
InventoryAdd(Inv, global.ItemWheatSeed, 2);
InventoryAdd(Inv, global.ItemTomatoSeed, 4);
InventoryAdd(Inv, global.ItemScythe, 1);
