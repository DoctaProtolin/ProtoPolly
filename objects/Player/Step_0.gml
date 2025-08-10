
    var moveVertical = keyboard_check(vk_up) - keyboard_check(vk_down);
    var moveHorizontal = keyboard_check(vk_right) - keyboard_check(vk_left);
    var lookHorizontal = keyboard_check(ord("A")) - keyboard_check(ord("D"));

    cameraAngle -= lookHorizontal * 5;
    cameraAngle = cameraAngle mod 360;
    
    velX += Speed * moveHorizontal;
    velY += Speed * moveVertical;

    if (moveHorizontal == 0) {
        if (abs(velX) > 1) velX *= Friction;
        else velX = 0;
    }
    
    if (moveVertical == 0) {
        if (abs(velY) > 1) velY *= Friction;
        else velY = 0;
    }

    // Clamp velocity
    velX = clamp(velX, -5, 5);
    velY = clamp(velY, -5, 5);
    velZ = clamp(velZ, -5, 5);

    // Update position
    x += velX;
    y += velY;
    z += velZ;
    
