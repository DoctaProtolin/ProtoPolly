



    vbuffer = vertex_create_buffer();

    vertex_begin(vbuffer, Camera.vertex_format);
    
    bottomA = [
        [-0.5, -0.5, -0.5],
        [-0.5, 0.5, -0.5],
        [0.5, 0.5, -0.5],
    ];
    
    bottomB = [
        [-0.5, -0.5, -0.5],
        [0.5, -0.5, -0.5],
        [0.5, 0.5, -0.5],
    ];

    topA = [
        [-0.5, -0.5, 0.5],
        [-0.5, 0.5, 0.5],
        [0.5, 0.5, 0.5],
    ];
    
    topB = [
        [-0.5, -0.5, 0.5],
        [0.5, -0.5, 0.5],
        [0.5, 0.5, 0.5],
    ];

    southA = [
        [-0.5, -0.5, -0.5],
        [-0.5, -0.5, 0.5],
        [0.5, -0.5, 0.5],
    ];
    
    southB = [
        [-0.5, -0.5, -0.5],
        [0.5, -0.5, -0.5],
        [0.5, -0.5, 0.5],
    ];

   northA = [
        [-0.5, 0.5, -0.5],
        [-0.5, 0.5, 0.5],
        [0.5, 0.5, 0.5],
    ];
    
    northB = [
        [-0.5, 0.5, -0.5],
        [0.5, 0.5, -0.5],
        [0.5, 0.5, 0.5],
    ];

    westA = [
        [-0.5, -0.5, -0.5],
        [-0.5, -0.5, 0.5],
        [-0.5, 0.5, 0.5],
    ];
    
    westB = [
        [-0.5, -0.5, -0.5],
        [-0.5, 0.5, -0.5],
        [-0.5, 0.5, 0.5],
    ];

    eastA = [
        [0.5, -0.5, -0.5],
        [0.5, -0.5, 0.5],
        [0.5, 0.5, 0.5],
    ];
    
    eastB = [
        [0.5, -0.5, -0.5],
        [0.5, 0.5, -0.5],
        [0.5, 0.5, 0.5],
    ];

    bottomNorm = [ 0,  0, -1];
    topNorm    = [ 0,  0,  1];
    southNorm  = [ 0,  1,  0];
    northNorm  = [ 0, -1,  0];
    westNorm   = [-1,  0,  0];
    eastNorm   = [ 1,  0,  0];
    
    vertAddTriangle(vbuffer, bottomA, bottomNorm, 0, 0, c_aqua, 1);
    vertAddTriangle(vbuffer, bottomB, bottomNorm, 0, 0, c_aqua, 1);

    vertAddTriangle(vbuffer, topA, topNorm, 0, 0, c_aqua, 1);
    vertAddTriangle(vbuffer, topB, topNorm, 0, 0, c_aqua, 1);

    vertAddTriangle(vbuffer, southA, southNorm, 0, 0, c_red, 1);
    vertAddTriangle(vbuffer, southB, southNorm, 0, 0, c_red, 1);

    vertAddTriangle(vbuffer, northA, northNorm, 0, 0, c_white, 1);
    vertAddTriangle(vbuffer, northB, northNorm, 0, 0, c_white, 1);

    vertAddTriangle(vbuffer, westA, westNorm, 0, 0, c_blue, 1);
    vertAddTriangle(vbuffer, westB, westNorm, 0, 0, c_blue, 1);

    vertAddTriangle(vbuffer, eastA, eastNorm, 0, 0, c_fuchsia, 1);
    vertAddTriangle(vbuffer, eastB, eastNorm, 0, 0, c_fuchsia, 1);

    //vertAddPoint(vbuffer, 0, 0, 0, 0, 0, 1, 0, 0, c_blue, 1);
    //vertAddPoint(vbuffer, 0, 100, 0, 0, 0, 1, 0, 0, c_blue, 1);
    //vertAddPoint(vbuffer, 100, 100, 0, 0, 0, 1, 0, 0, c_blue, 1);
    
    //vertAddPoint(vbuffer, 0, 0, 0, 0, 0, 1, 0, 0, c_blue, 1);
    //vertAddPoint(vbuffer, 100, 0, 0, 0, 0, 1, 0, 0, c_blue, 1);
    //vertAddPoint(vbuffer, 100, 100, 0, 0, 0, 1, 0, 0, c_blue, 1);

    vertex_end(vbuffer);

  
    // Set properties
    z = 100;

    size_x = 100;
    size_y = 100;
    size_z = 100;

    timer = 0;

    matrix = [];
