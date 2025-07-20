
function loadModel(source, vbuffer) {
    var file = file_text_open_read(source);
    println(file);
    var lines = [];
    
    for (var i = 0; !file_text_eof(file); i ++) {
        lines[i] = file_text_read_string(file);
        
        file_text_readln(file);
    }
    
    println("Displaying file contents: ");
    
    for (var i = 0; i < array_length(lines); i ++) {
        println(lines[i]);
    }
    
    var vertices = [];
    var vertexNormals = [];
    var faces = [];
    
    for (var i = 0; i < array_length(lines); i ++) {
        var tokens = string_split(lines[i], " ");
        var startToken = tokens[0];

        switch (startToken) {
            case "v":
            
                var vertex = [
                    real(tokens[1]),
                    real(tokens[2]),
                    real(tokens[3]),
                ];
            
                vertices[array_length(vertices)] = vertex; // Append
            break;
            
            case "vn":
            
                var vertexNormal = [
                    real(tokens[1]),
                    real(tokens[2]),
                    real(tokens[3]),
                ];
            
                vertexNormals[array_length(vertexNormals)] = vertexNormal; // Append
            break;
            
            case "f":
                var faceVertexIndex = [];
                var faceNormalIndex = [];
                
                for (var j = 1; j < array_length(tokens); j ++) {
                    var faceData = string_split(tokens[j], "/");
                    
                    faceVertexIndex[j-1] = real(faceData[0]);
                    faceNormalIndex[j-1] = real(faceData[2]);
                }
            
                faces[array_length(faces)] = {
                    faceVertexIndexes: faceVertexIndex,
                    faceNormalIndexes: faceNormalIndex,
                }
            break;
        }
    }
    
    for (var i = 0; i < array_length(faces); i ++) {
        var face = faces[i];
        
        var pointList = [];
        var normList = [];
        
        for (var j = 0; j < array_length(face.faceVertexIndexes); j ++) {
            var vertIndex = face.faceVertexIndexes[j] - 1;
            var normIndex = face.faceNormalIndexes[j] - 1;
            
            var vertex = vertices[vertIndex];
            var normal = vertexNormals[normIndex];
            
            pointList[j] = vertex;
            normList[j] = normal;
        }
        
        println("Point");
        println(pointList);
        println("Normals");
        println(normList[0]);
        vertAddTriangle(vbuffer, pointList, normList[0], 0, 0, c_red, 1);
    }
    
    
    
}