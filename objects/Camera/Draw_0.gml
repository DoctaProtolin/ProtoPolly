     
    // If using viewports, camera_get_active returns the viewport currently in use.
    var camera = camera_get_active();

    camera_set_view_mat(camera, matrix_build_lookat(x, y, z, room_width/2, room_height/2, 0, 0, 0, -1));
    camera_set_proj_mat(camera, matrix_build_projection_perspective_fov(60, window_get_width()/window_get_height(), 1, 8000));

    shader_set(shdPointLight);
    camera_apply(camera);

    // Render objects
    vertex_submit(vbuffer, pr_trianglelist, sprite_get_texture(sprGrass, 0));
    
    with (Object3D) {
        var matrix = matrix_build(x, y, z, rotX, rotY, rotZ, sizeX, sizeY, sizeZ);
        var _vbuffer = vertex_create_buffer();
        
        vertex_begin(_vbuffer, Camera.vertex_format);
        
        for (var i = 0; i < array_length(vertices); i ++) {
            var vertex = vertices[i];
            var normal = vertexNormals[i];
            vertAddPoint(_vbuffer, vertex[0], vertex[1], vertex[2], normal[0], normal[1], normal[2], 0, 0, c_green, 1);
        }
        
        vertex_end(_vbuffer);
        
        matrix_set(matrix_world, matrix);
        vertex_submit(_vbuffer, pr_trianglelist, -1);
        matrix_set(matrix_world, matrix_build_identity()); // Reset
    }

    shader_reset();

    // You need to draw everything after you set the camera object.

    // https://youtu.be/XLpcn0XQJj8?list=PL_hT--4HOvrcML9uqHe4fwBVTm650Vy3V&t=711
    // When a sprite is added to a tileset, Game Maker seems to only accept the sprite as a tileset, so weird things happen.
    // I removed this sprite from the tileset per the tutorial's instructions and it worked flawlessly.
   