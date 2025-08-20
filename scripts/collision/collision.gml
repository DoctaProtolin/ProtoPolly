
function Vector(_x, _y) constructor {
    x = _x;
    y = _y;
}

function Line(x1, y1, x2, y2) constructor {
    
    type = "line";
    
    a = {
        x: x1,
        y: y1,
    }
    
    b = {
        x: x2,
        y: y2,
    }
}

function isVertical(line) {
    return line.a.x == line.b.x;
}

function getSlope(line) {
    return (line.a.y - line.b.y)/(line.a.x - line.b.x);
}

function getIntercept(line) {
    return (line.a.y - getSlope(line) * line.a.x);
}

function solveLine(line, x) {
    return getSlope(line) * x + getIntercept(line);
}

function inRange(line, x) {
    var lesserX = min(line.a.x, line.b.x);
    var greaterX = max(line.a.x, line.b.x);
    
    // Maybe shouldn't be <= in case you select two lines joined at their edges.
    return lesserX < x && x < greaterX;
}

function getIntersection(lineA, lineB) {
  
  if (isVertical(lineA) || isVertical(lineB)) {
    
    if (isVertical(lineB) && !isVertical(lineA)) {
      var xx = lineB.a.x;
      var yy = solveLine(lineA, xx);

      if (inRange(lineA, xx) && inRange(lineB, yy)) {
        //println("Yep");
        return new Vector(xx, yy);
      }
    } else if (isVertical(lineA) && !isVertical(lineB)) {
      var xx = lineA.a.x;
      var yy = solveLine(lineB, xx);
      // Untested code
      if (inRange(lineB, xx) && inRange(lineA, yy)) {
        println("Yep");
        return new Vector(xx, yy);
      }
    }
    
    println("Vertical");
    
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
                z = Floor.z;
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
        var line = new Line(cornerA.x, cornerA.y, cornerB.x, cornerB.y);
        
        println(["Slope: ", getSlope(line)]);
        
        array_push(hitbox, line);
        
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
    
    var ray = new Line(point.x, point.y, point.x + 50000, point.y); 
    var intersections = 0;
    
    for (var i = 0; i < array_length(hitbox); i ++) {
        
        var l = hitbox[i];
    
        //if (l.isVertical()) {
        //  if (ray.inRange(l.a.x)) {
        //    intersections ++;
        //    continue;
        //  }
        //}
    
        var xx = getIntersection(l, ray).x;
    
        if (inRange(l, xx) && inRange(ray, xx)) {
            intersections ++;
            println("Intersection");
        }
    }
    
    return intersections % 2;
}