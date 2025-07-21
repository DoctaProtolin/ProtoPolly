
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
    
    var col = [c_red, c_green, c_blue, c_orange, c_purple, c_fuchsia];
    
    println(["Length of faces:", array_length(faces)]);
    
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
        
        
        //for (var j = 0; j < array_length(pointList); j ++) {
            //
            //var index = (j mod 3) + floor(j / 3);
            //
            //println(index);
            //
            //var point = pointList[index];
            //var normal = normList[index];
            //
            //vertAddPoint(vbuffer, point[0], point[1], point[2], normal[0], normal[1], normal[2], 0, 0, c_yellow, 1);
        //}
        
        var index = 0;
        var j = 0;
        
        println(face);
        
        while (floor(j / 3) < array_length(pointList)-2) {
            
            println(["Index:", index, "J:", j]);
            
            
            var point = pointList[index];
            var normal = normList[index];
            
            vertAddPoint(vbuffer, point[0], point[1], point[2], normal[0], normal[1], normal[2], 0, 0, c_red, 1);
            
            j ++;
            index = (j mod 3) + floor(j / 3);
            if (j mod 3 == 0) index = 0;
        }
        
        println("Added face");
    }
    
    
    
}