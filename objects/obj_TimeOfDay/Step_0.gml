Tick += 1 * global.DT;
if (Tick >= 10) {
    // Update Crops
    with(obj_Plot) {
        if (Crop != undefined) {
            Tick++;   
        } else {
            Tick = 0;
        }
    }
    Tick = 0;
}
