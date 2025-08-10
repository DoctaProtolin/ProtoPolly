
    event_inherited();

    vertex_begin(vbuffer, Camera.vertex_format);
    loadModel(vbuffer, "C:/Users/yello/GameMakerProjects/ProtoPolly/Cube.obj");
    vertex_end(vbuffer);

    scaleX = 50;
    scaleY = 50;
    scaleZ = 100;

    texture = sprite_get_texture(sprBrick, 0);

    gravity = 0.02175;

    velX = 0;
    velY = 0;
    velZ = 0;

    Friction = 0.1;

    Speed = 0.5;
