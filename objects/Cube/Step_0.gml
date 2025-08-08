    
    switch (dimension) {
        case 0: scaleX = dsin(timer) * offset + inScaleX; break;
        case 1: scaleY = dsin(timer) * offset + inScaleY; break;
        case 2: scaleZ = dsin(timer) * offset + inScaleZ; break;
    }
    
    timer += s;
