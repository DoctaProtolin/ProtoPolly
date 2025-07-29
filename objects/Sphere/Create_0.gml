
    event_inherited();

    vertex_begin(vbuffer, Camera.vertex_format);
    loadModel(vbuffer, "C:/Users/yello/GameMakerProjects/ProtoPolly/Sphere.obj");
    vertex_end(vbuffer);

    scaleX = 100;
    scaleY = 100;
    scaleZ = 100;

    x = room_width/2 - 300;
    y = room_height/2;