
    vbuffer = vertex_create_buffer();

    // Set properties
    z = 100;

    if (useDefaultScale) {
        scaleX = 100;
        scaleY = 100;
        scaleZ = 100;
    } else {
        scaleX = inScaleX;
        scaleY = inScaleY;
        scaleZ = inScaleZ;
    }

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
