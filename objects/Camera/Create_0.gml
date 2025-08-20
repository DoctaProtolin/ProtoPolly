
    #macro WALK "walk"
    #macro ORBIT "orbit"

    random_set_seed(10);

    gpu_set_ztestenable(true);
    gpu_set_zwriteenable(true);

    // Basis of everything you draw in gamemaker. And computers?
    
    vertex_format_begin();
    vertex_format_add_position_3d();
    vertex_format_add_normal();
    vertex_format_add_texcoord();
    vertex_format_add_color();

    vertex_format = vertex_format_end();

    vbuffer = vertex_create_buffer();
    vertex_begin(vbuffer, vertex_format); // Now you can add data to a buffer to draw on the screen.
    
    var x1 = 400, y1 = 400;
    var x2 = 600, y2 = 600;
    
    var s = 64;
    var checker_z = -100;

    for (var i = 0; i < room_width; i += s) {
        for (var j = 0; j < room_height; j += s) {
            
            var col = ((i + j) / s) mod 2 == 0 ? c_white : c_aqua;
            
            vertAddPoint(vbuffer, i,      j, checker_z, 0, 0, 1,      0, 0, col, 1);
            vertAddPoint(vbuffer, i + s, j, checker_z, 0, 0, 1,       1, 0, col, 1);
            vertAddPoint(vbuffer, i + s, j + s, checker_z, 0, 0, 1,   1, 1, col, 1);
        
            vertAddPoint(vbuffer, i, j, checker_z, 0, 0, 1,           0, 0, col, 1);
            vertAddPoint(vbuffer, i, j + s, checker_z, 0, 0, 1,       0, 1, col, 1);
            vertAddPoint(vbuffer, i + s, j + s, checker_z, 0, 0, 1,   1, 1, col, 1);
        }
    }

    vertex_end(vbuffer);

    mainSurface = -1;

    x = room_width/2;
    y = room_height;
    z = 100;

    lookAngle = 180;
    lookAngleZ = 0;
    Speed = 20;
    Friction = 0.9;

    focusDist = 200;

    velX = 0;
    velY = 0;
    velZ = 0;

    mode = ORBIT;

    lightAngle = 0;

    disableCameraMovement = true;

    h = 0;
