
    vbuffer = vertex_create_buffer();

    // Set default properties
    z = -100;
    hitbox = -1;
    
    scaleX = 100;
    scaleY = 100;
    scaleZ = 100;
    
    rotX = 0;
    rotY = 0;
    rotZ = 0;

    displayModel = true;
    
    texture = -1;
    specularIntensity = 0;

    material = {
        specularIntensity: 0,
        specularPower: 1,
    }
