
function getIntersection(lineA, lineB) {
  
    var aVertical = isVertical(lineA);
    var bVertical = isVertical(lineB);
    
    if (aVertical || bVertical) { 
        if (bVertical && !aVertical) {
            var xx = lineB.a.x;
            var yy = solveLine(lineA, xx);
            
            if (inRange(lineA, xx) && inRangeY(lineB, yy)) {
                return new Vector(xx, yy);
            }
            
        } else if (aVertical && !bVertical) {
            var xx = lineA.a.x;
            var yy = solveLine(lineB, xx);
            
            if (inRange(lineB, xx) && inRangeY(lineA, yy)) {
                return new Vector(xx, yy);
            }
            
        } else {
            println("Panic?!");
        }
    }
  
    var xx = (getIntercept(lineB) - getIntercept(lineA)) / (getSlope(lineA) - getSlope(lineB)); 
    var yy = solveLine(lineA, xx);
      
    return new Vector(xx, yy);
}

function getHitbox(x, y, scaleX, scaleY) {
    
    static debugSpheres = [NULL, NULL, NULL, NULL];
    
    for (var i = 0; i < 4; i ++) {
        if (debugSpheres[i] == NULL) {
            debugSpheres[i] = instance_create_layer(0, 0, "Objects", Sphere);
            
            with (debugSpheres[i]) {
                z = 100;
                self.scaleX = 20;
                self.scaleY = 20;
                self.scaleZ = 20;
                texture = -1;
                displayModel = 1;
            }
            
            println("Creating new sphere");
        }
    }
    
    var corners = [
        new Vector(x - scaleX, y - scaleY),
        new Vector(x + scaleX, y - scaleY),
        new Vector(x + scaleX, y + scaleY),
        new Vector(x - scaleX, y + scaleY),
    ]
    
    var hitbox = [];
    
    var drawSphereA = true;
    
    for (var i = 1; i < 4; i ++) {
        var cornerA = corners[i-1];
        var cornerB = corners[i];
        var l = new Line(cornerA.x, cornerA.y, cornerB.x, cornerB.y);
        
        array_push(hitbox, l);
        
        if (drawSphereA) {
            debugSpheres[i-1].x = cornerA.x;
            debugSpheres[i-1].y = cornerA.y;
            drawSphereA = false;
        }
        
        debugSpheres[i].x = cornerB.x;
        debugSpheres[i].y = cornerB.y;
    }
    
    return hitbox;
}

function pointInHitbox(point, hitbox) {
    
    var ray = new Line(point.x, point.y, point.x + 5000, point.y); 
    var intersections = 0;
    
    for (var i = 0; i < array_length(hitbox); i ++) {
        var l = hitbox[i];
        
        var xx = getIntersection(l, ray).x;
        
        if (inRange(l, xx) && inRange(ray, xx)) {
            intersections ++;
        }
    }
    // Check if odd
    return intersections % 2;
}