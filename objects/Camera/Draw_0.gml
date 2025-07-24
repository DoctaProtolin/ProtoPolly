     
    // If using viewports, camera_get_active returns the viewport currently in use.
    var camera = camera_get_active();

    camera_set_view_mat(camera, matrix_build_lookat(x, y, z, room_width/2, room_height/2, 0, 0, 0, -1));
    camera_set_proj_mat(camera, matrix_build_projection_perspective_fov(60, window_get_width()/window_get_height(), 1, 8000));

    shader_set(shdPointLight);
    
    // Update shader
    var u_lightPosition = shader_get_uniform(shdPointLight, "u_lightPosition");
    var u_lightIntensity = shader_get_uniform(shdPointLight, "u_lightIntensity");
    var u_ambientIntensity = shader_get_uniform(shdPointLight, "u_ambientIntensity");

    shader_set_uniform_f(u_lightPosition, room_width/2, room_height/2, 100);
    shader_set_uniform_f(u_lightIntensity, 500000);
    shader_set_uniform_f(u_ambientIntensity, 0.05);
    
    lightAngle += 2;

    //println(dsin(lightAngle) * 200 + 100);

    // Apply camera
    camera_apply(camera);

    // Render objects
    vertex_submit(vbuffer, pr_trianglelist, sprite_get_texture(sprGrass, 0));
    
    with (Object3D) {
        // var matrix = matrix_build(x, y, z, rotX, rotY, rotZ, sizeX, sizeY, sizeZ);
        var _vbuffer = vertex_create_buffer();
        
        vertex_begin(_vbuffer, Camera.vertex_format);
        
        for (var i = 0; i < array_length(vertices); i ++) {
            var vertex = vertices[i];
            
            
            vertex = vertexScale(vertex);
            //vertex = vertexTranslate(vertex);
            
            var normal = vertexNormals[i];
            
            vertAddPoint(_vbuffer, vertex[0], vertex[1], vertex[2], normal[0], normal[1], normal[2], 0, 0, c_green, 1);
        }
        
        vertex_end(_vbuffer);
        
        //matrix_set(matrix_world, matrix);
        vertex_submit(_vbuffer, pr_trianglelist, -1);
        //matrix_set(matrix_world, matrix_build_identity()); // Reset
    }

    shader_reset();

    // You need to draw everything after you set the camera object.

    // https://youtu.be/XLpcn0XQJj8?list=PL_hT--4HOvrcML9uqHe4fwBVTm650Vy3V&t=711
    // When a sprite is added to a tileset, Game Maker seems to only accept the sprite as a tileset, so weird things happen.
    // I removed this sprite from the tileset per the tutorial's instructions and it worked flawlessly.
   