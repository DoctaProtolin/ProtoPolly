    event_inherited();
    
    vertex_begin(vbuffer, Camera.vertex_format);
    loadModel(vbuffer, "C:/Users/yello/GameMakerProjects/ProtoPolly/Cube.obj");
    vertex_end(vbuffer);

    y = room_height;
    
    scaleX = 50;
    scaleY = 100;
    scaleZ = 50;
    
    texture = sprite_get_texture(sprBrick, 0);
    
    cameraAngle = 90;
    cameraDist = 900;
    
    velX = 0;
    velY = 0;
    velZ = 0;
    
    Gravity = 0; //0.2; // Using the built-in variable increments y
    Friction = 0.1;
    Speed = 0.5;
