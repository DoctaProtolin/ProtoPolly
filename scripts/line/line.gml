
function Line(x1, y1, x2, y2) constructor {
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
    // Maybe shouldn't be <= in case you select two lines joined at their edges.
    return min(line.a.x, line.b.x) <= x && x <= max(line.a.x, line.b.x);
}

function inRangeY(line, y) {
    // Maybe shouldn't be <= in case you select two lines joined at their edges.
    return min(line.a.y, line.b.y) <= y && y <= max(line.a.y, line.b.y);
}