
function getGroundPoint() {
    return new Vector(x, y + scaleY);
}

function playerCollision() {
    
    var groundPoint = getGroundPoint();
    var groundObject = NULL;
    
    for (var i = 0; i < instance_number(WallHitbox); i ++) {
        var object = instance_find(WallHitbox, i);
        var hitbox = getHitbox(object.x, object.y, object.scaleX, object.scaleY);
        
        if (pointInHitbox(groundPoint, hitbox)) {
            grounded = true;
            groundObject = object;
            break;
        }
    }
    
    if (grounded) {
        y = groundObject.y - groundObject.scaleY - scaleY;
    }
}