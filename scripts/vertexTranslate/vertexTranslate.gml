
function vertexTranslate(inVertex) {
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
    
    return [
        origin.x + vertex.x,
        origin.y + vertex.y,
        origin.z + vertex.z,
    ];
    
}