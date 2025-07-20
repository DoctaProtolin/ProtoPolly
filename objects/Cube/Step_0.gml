    
    matrix = matrix_build(x, y, z, 0, 0, timer, size_x, size_y, size_z);
    
    bottomNorm = [ 0,  0, -1];
    topNorm    = [ 0,  0,  1];
    southNorm  = [ 0, -1,  0];
    northNorm  = [ 0,  1,  0];
    westNorm   = [-1,  0,  0];
    eastNorm   = [ 1,  0,  0];

    vertex_begin(vbuffer, Camera.vertex_format);

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

    vertex_end(vbuffer);

    timer += 5;

    //show_debug_message(string(dcos(timer+90)));