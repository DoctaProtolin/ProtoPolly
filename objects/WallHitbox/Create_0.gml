
    event_inherited();
    
    vertex_begin(vbuffer, Camera.vertex_format);
    loadModel(vbuffer, "C:/Users/yello/GameMakerProjects/ProtoPolly/Cube.obj");
    vertex_end(vbuffer);

    x = 50;
    y = room_height;
    z = -100;
    
    scaleX = 500;
    scaleY = 50;
    scaleZ = 50;
