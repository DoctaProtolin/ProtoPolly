
function getGroundPoint() {
    return new Vector(x, y + scaleY);
}

function playerCollision() {
    
    var hitbox = getHitbox(Floor.x, Floor.y, Floor.scaleX, Floor.scaleY);
    var groundPoint = getGroundPoint();
    
    if (pointInHitbox(groundPoint, hitbox)) {
        grounded = true;
    } else println("No collision");
        
    if (grounded) {
        y = Floor.y - Floor.scaleY - scaleY;
    }
}