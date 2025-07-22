
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
    
    var scaleLength = sqrt(sqr(vertex.x) + sqr(vertex.y) + sqr(vertex.z));
    
    // Normalize the direction in which to scale
    var scaleDirection = {
        x: vertex.x / scaleLength,
        y: vertex.y / scaleLength,
        z: vertex.z / scaleLength,
    }
    
    return [
        x + scaleDirection.x * scaleX,
        y + scaleDirection.y * scaleY,
        z + scaleDirection.z * scaleZ,
    ];
}