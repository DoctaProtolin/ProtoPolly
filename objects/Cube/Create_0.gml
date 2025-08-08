
    event_inherited();
    
    vertex_begin(vbuffer, Camera.vertex_format);
    loadModel(vbuffer, "C:/Users/yello/GameMakerProjects/ProtoPolly/Cube.obj");
    vertex_end(vbuffer);

    var sprite = choose(sprBrick, sprMetal, sprWood);
    texture = sprite_get_texture(sprite, 0);

    if (sprite == sprMetal) {
        material.specularIntensity = 10000;
        material.specularPower = 5;
    }

    timer = 0;
