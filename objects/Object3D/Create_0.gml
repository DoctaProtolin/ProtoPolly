
    vbuffer = vertex_create_buffer();

  
    // Set properties
    z = 100;

    sizeX = 100;
    sizeY = 100;
    sizeZ = 100;

    rotX = 0;
    rotY = 0;
    rotZ = 0;

    matrix = [];

    vertex_begin(vbuffer, Camera.vertex_format);
    loadModel("C:/Users/yello/GameMakerProjects/CubeShooter/Cube.obj", vbuffer);
    vertex_end(vbuffer);

