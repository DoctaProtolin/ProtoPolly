     
    // If using viewports, camera_get_active returns the viewport currently in use.
    var camera = camera_get_active();

    camera_set_view_mat(camera, matrix_build_lookat(x, y, z, room_width/2, room_height/2, 0, 0, 0, -1));
    camera_set_proj_mat(camera, matrix_build_projection_perspective_fov(60, window_get_width()/window_get_height(), 1, 8000));

    shader_set(shdLighting);
    camera_apply(camera);

    // Render objects
    vertex_submit(vbuffer, pr_trianglelist, sprite_get_texture(sprGrass, 0));
    
    with (Cube) {
        matrix_set(matrix_world, matrix);
        vertex_submit(vbuffer, pr_trianglelist, -1);
        matrix_set(matrix_world, matrix_build_identity());
    }

    with (Object3D) {
        matrix_set(matrix_world, matrix);
        vertex_submit(vbuffer, pr_trianglelist, -1);
        matrix_set(matrix_world, matrix_build_identity());
    }

    shader_reset();

    // You need to draw everything after you set the camera object.

    // https://youtu.be/XLpcn0XQJj8?list=PL_hT--4HOvrcML9uqHe4fwBVTm650Vy3V&t=711
    // When a sprite is added to a tileset, Game Maker seems to only accept the sprite as a tileset, so weird things happen.
    // I removed this sprite from the tileset per the tutorial's instructions and it worked flawlessly.
   