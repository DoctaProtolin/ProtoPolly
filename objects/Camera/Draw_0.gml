     
    // If using viewports, camera_get_active returns the viewport currently in use.

    #macro DISPLAY_WIDTH display_get_width()
    #macro DISPLAY_HEIGHT display_get_height()

    if (!surface_exists(mainSurface)) {
        mainSurface = surface_create(display_get_width(), display_get_height());
    }

    surface_set_target(mainSurface);
    draw_clear_alpha(c_black, 0);

    var camera = camera_get_active();

    if (instance_exists(Player) and false) {
        
        x = dcos(Player.cameraAngle) * Player.cameraDist + Player.x;
        y = Player.y;
        z = dsin(Player.cameraAngle) * Player.cameraDist + Player.z;
        
        var lookMatrix = matrix_build_lookat(x, y, z, Player.x, Player.y, Player.z, 0, -1, 0);
        camera_set_view_mat(camera, lookMatrix);
    } else {
        var lookMatrix = matrix_build_lookat(DISPLAY_WIDTH/2, DISPLAY_HEIGHT/2, -800, DISPLAY_WIDTH/2, DISPLAY_HEIGHT/2, 0, 0, -1, 0);
        camera_set_view_mat(camera, lookMatrix);
    }
    camera_set_proj_mat(camera, matrix_build_projection_perspective_fov(60, window_get_width()/window_get_height(), 1, 8000));

    //println(dsin(lightAngle) * 200 + 100);

    // Apply camera
    camera_apply(camera);
    
    shader_set(DEFAULT_RENDERER);
    vertex_submit(vbuffer, pr_trianglelist, sprite_get_texture(sprGrass, 0));
    shader_reset();

    var lightPositions = [];
    var lightColours = [];
    var lightIntensities = [];

    var lightBufferLength = 16 * 3;

    var pointLightCount = instance_number(PointLight);

    for (var i = 0; i < lightBufferLength; i ++) {
        
        if (floor(i/3) >= pointLightCount) {
            // Fill'er up
            array_push(lightPositions, 0);
            array_push(lightColours, 0);
            continue;
        }
        
        var pointLight = instance_find(PointLight, floor(i/3));
        
        var coord = 0, color = 0;
        
        switch (i mod 3) {
            case 0: 
                coord = pointLight.x;
                color = pointLight.r;
            
                array_push(lightIntensities, pointLight.intensity);
                break;
            case 1:
                coord = pointLight.y;
                color = pointLight.g;
                break;
            case 2:
                coord = pointLight.z;
                color = pointLight.b;
                break;
        }
        
        array_push(lightPositions, coord);
        array_push(lightColours, color);
    }

    #macro DEFAULT_RENDERER shdMultiLight   

    with (Object3D) {
        if (!displayModel) continue;
        
        shader_set(DEFAULT_RENDERER);
        
        #region Lights
        
            var u_lightPositions = shader_get_uniform(DEFAULT_RENDERER, "u_lightPositions");
            var u_lightColours = shader_get_uniform(DEFAULT_RENDERER, "u_lightColours");
            var u_diffuseIntensities = shader_get_uniform(DEFAULT_RENDERER, "u_diffuseIntensities");
            
            shader_set_uniform_f_array(u_lightPositions, lightPositions);
            shader_set_uniform_f_array(u_lightColours, lightColours);
            shader_set_uniform_f_array(u_diffuseIntensities, lightIntensities);
        
        #endregion
        
        var u_cameraPosition = shader_get_uniform(DEFAULT_RENDERER, "u_cameraPosition");
        shader_set_uniform_f(u_cameraPosition, x, y, z);
    
        var u_ambientIntensity = shader_get_uniform(DEFAULT_RENDERER, "u_ambientIntensity");
        shader_set_uniform_f(u_ambientIntensity, 0.3);
        
        #region Specular Highlight
        
            var u_specularIntensity = shader_get_uniform(DEFAULT_RENDERER, "u_specularIntensity");
            var u_specularPower = shader_get_uniform(DEFAULT_RENDERER, "u_specularPower");
        
            shader_set_uniform_f(u_specularIntensity, specularIntensity);
            shader_set_uniform_f(u_specularPower, material.specularPower);
        
        #endregion
        
        var matrix = matrix_build(x, y, z, rotX, rotY, rotZ, scaleX, scaleY, scaleZ);
        matrix_set(matrix_world, matrix);
        vertex_submit(vbuffer, pr_trianglelist, texture);
        matrix_set(matrix_world, matrix_build_identity()); // Reset
        
        shader_reset();
    }
    surface_reset_target();    
    
    shader_set(shdMirror);
    draw_surface(mainSurface, 0, 0);
    shader_reset();
    

    // You need to draw everything after you set the camera object.

    // https://youtu.be/XLpcn0XQJj8?list=PL_hT--4HOvrcML9uqHe4fwBVTm650Vy3V&t=711
    // When a sprite is added to a tileset, Game Maker seems to only accept the sprite as a tileset, so weird things happen.
    // I removed this sprite from the tileset per the tutorial's instructions and it worked flawlessly.
   