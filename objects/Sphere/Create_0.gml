
    event_inherited();

    vertex_begin(vbuffer, Camera.vertex_format);
    loadModel(vbuffer, "C:/Users/yello/GameMakerProjects/ProtoPolly/Sphere.obj");
    vertex_end(vbuffer);

    texture = sprite_get_texture(sprMetal, 0);

    x = room_width/2;
    y = room_height/2;
    z = -200;

    scaleX = 100;
    scaleY = 100;
    scaleZ = 100;

    material.specularIntensity = 200000;
    material.specularPower = 15;

    