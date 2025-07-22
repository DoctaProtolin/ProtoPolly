
function vertexScale(inVertex) {
    var origin = {
        x: x,
        y: y,
        z: z,
    };
    
    var vertex = {
        x: inVertex[0],
        y: inVertex[1],
        z: inVertex[2],
    };
    
    var radius = point_distance_3d(origin.x, origin.y, origin.z, vertex.x, vertex.y, vertex.z);
    
    var diffX = vertex.x - origin.x;
    var diffY = vertex.y - origin.y;
    var diffZ = vertex.z - origin.z;
    
    println(radius);
    
    // Normalize
    diffX /= radius;
    diffY /= radius;
    diffZ /= radius;
    
    return [
        x + diffX * radius,
        y + diffY * radius,
        z + diffZ * radius,
    ];
}