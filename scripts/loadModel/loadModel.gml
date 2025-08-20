
function loadModel(vbuffer, source) {
    
    var file = file_text_open_read(source);
    println(file);
    var lines = [];
    
    for (var i = 0; !file_text_eof(file); i ++) {
        lines[i] = file_text_read_string(file);
        
        file_text_readln(file);
    }
    
    var vertices = [];
    var vertexNormals = [];
    var textureCoords = [];
    var faces = [];
    
    var outputVertices = [];
    var outputNormals = []; // Packed so we can refresh object normals when they're rotated
    
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
            
            case "vt":
                var textureCoord = [
                    real(tokens[1]),
                    real(tokens[2]),
                ];
            
                textureCoords[array_length(textureCoords)] = textureCoord;
            break;
            
            case "f":
                var faceVertexIndex = [];
                var faceNormalIndex = [];
                var faceTexcoordIndex = [];
                
                for (var j = 1; j < array_length(tokens); j ++) {
                    var faceData = string_split(tokens[j], "/");
                    
                    faceVertexIndex[j-1]   = real(faceData[0]);
                    faceTexcoordIndex[j-1] = real(faceData[1]);
                    faceNormalIndex[j-1]   = real(faceData[2]);
                }
            
                faces[array_length(faces)] = {
                    faceVertexIndexes: faceVertexIndex,
                    faceNormalIndexes: faceNormalIndex,
                    faceTexcoordIndexes: faceTexcoordIndex,
                }
            break;
        }
    }
    
    for (var i = 0; i < array_length(faces); i ++) {
        var face = faces[i];
        
        var pointList = [];
        var normList = [];
        var texList = [];
        
        for (var j = 0; j < array_length(face.faceVertexIndexes); j ++) {
            var vertIndex    = face.faceVertexIndexes[j]   - 1;
            var normIndex    = face.faceNormalIndexes[j]   - 1;
            var textureIndex = face.faceTexcoordIndexes[j] - 1;
            
            var vertex   = vertices[vertIndex];
            var normal   = vertexNormals[normIndex];
            var texCoord = textureCoords[textureIndex];
            
            pointList[j] = vertex;
            normList[j] = normal;
            texList[j] = texCoord;
        }
        
        var index = 0;
        var j = 0;
        
        while (floor(j / 3) < array_length(pointList)-2) {
            
            var point = pointList[index];
            var normal = normList[index];
            var texCoords = texList[index];
            
            var newIndex = array_length(outputVertices);
            
            outputNormals[newIndex] = [
                normal[0],
                normal[1],
                normal[2],
            ];
            
            outputVertices[newIndex] = [
                point[0],
                point[1],
                point[2],
            ];
            
            vertAddPoint(vbuffer, point[0], point[1], point[2], normal[0], normal[1], normal[2], texCoords[0], texCoords[1], c_white, 1);
            
            // Needed to use a table for this part. Thank you Dr. Orlov
            j ++;
            index = (j % 3) + floor(j / 3);
            if (j % 3 == 0) index = 0;
        }
        
        println("Added face");
    }
    
    file_text_close(file);
}