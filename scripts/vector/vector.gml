

function Vector(_x, _y) constructor {
    x = _x;
    y = _y;
}

function addVec(v1, v2) {
    return {
        x: v1.x + v2.x,
        y: v1.y + v2.y,
    }
}

function subVec(v1, v2) {
    return {
        x: v1.x - v2.x,
        y: v1.y - v2.y,
    }
}

function multVec(v, s) {
    return {
        x: v.x * s,
        y: v.y * s,
    }
}


function normalize(v) {
    var l = sqrt(sqr(v.x) + sqr(v.y));
    return {
        x: v.x/l,
        y: v.x/l,
    }
}

function getHeading(v) {
    var angle = darctan(v.y / v.x);
    
    if (v.x < 0) {
        angle += 180;
    } else if (v.y < 0) {
        angle += 360;
    }
    
    show_debug_message(v.y);
    
    return angle;
}
