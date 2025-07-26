
    event_inherited();
    
    vertex_begin(vbuffer, Camera.vertex_format);
    loadModel(vbuffer, "C:/Users/yello/GameMakerProjects/ProtoPolly/Cube.obj");
    vertex_end(vbuffer);

    x = room_width/2;
    y = room_height/2;

    scaleX = 100;
    scaleY = 100;
    scaleZ = 100;

    timer = 0;
