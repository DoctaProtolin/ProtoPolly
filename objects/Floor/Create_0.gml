    event_inherited();
    
    vertex_begin(vbuffer, Camera.vertex_format);
    loadModel(vbuffer, "C:/Users/yello/GameMakerProjects/ProtoPolly/Cube.obj");
    vertex_end(vbuffer);
    
    x = 0;
    y = room_height;
    z = -100;

    scaleX = room_width;
    scaleY = 30;
    scaleZ = 20;

    texture = sprite_get_texture(sprMetal, 0);
    
    h = 0;
    
