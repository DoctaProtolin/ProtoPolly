
    // Get input
    var moveVertical = keyboard_check(vk_up) - keyboard_check(vk_down);
    var moveHorizontal = keyboard_check(vk_right) - keyboard_check(vk_left);
    var lookDepth = keyboard_check(ord("W")) - keyboard_check(ord("S"));
    var lookHorizontal = keyboard_check(ord("A")) - keyboard_check(ord("D"));

    if (mode == WALK) {
        // Update velocity
        velX += dcos(lookAngle - 90) * Speed * moveVertical;
        velY += dsin(lookAngle - 90) * Speed * moveVertical;
    
        velX += dcos(lookAngle) * Speed * moveHorizontal;
        velY += dsin(lookAngle) * Speed * moveHorizontal;
    
        
        // Update friction
        if (moveHorizontal == 0) {
            if (abs(velX) > 1) velX *= Friction;
            else velX = 0;
        }
        
        if (moveVertical == 0) {
            if (abs(velY) > 1) velY *= Friction;
            else velY = 0;
        }
    
        lookAngle += lookHorizontal * 2;
        lookAngleZ += lookDepth * 2;
    
        // Clamp velocity
        velX = clamp(velX, -5, 5);
        velY = clamp(velY, -5, 5);
        velZ = clamp(velZ, -5, 5);
    
        // Update position
        x += velX;
        y += velY;
        z += velZ;
    } else {
        
        lookAngle += moveHorizontal * 2;
        
        z += moveVertical * 10;
        
        focusDist -= lookDepth * 10;
        
        x = dcos(lookAngle) * focusDist + room_width/2;
        y = dsin(lookAngle) * focusDist + room_height/2;
    }
