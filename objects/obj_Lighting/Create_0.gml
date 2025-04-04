// sem usar shaders
depth = -y;
LightninSurface = surface_create(room_width, room_height);

Time = 0;
TimeOfDay = 0;
DayNightSpeed = .001;

// Colors
R = 0;
G = 0;
B = 0;

ColorChange = .01;

DayColor = [255, 255, 201];
NightColor = [30, 12, 51];
