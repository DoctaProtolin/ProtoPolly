

function vertAddTriangle(vbuffer, pointList, normList, u, v, color, opacity) {
    for (var i = 0; i < array_length(pointList); i ++) {
        var point = pointList[i];

        var xx = point[0];
        var yy = point[1];
        var z  = point[2];
        
        var normx = normList[0];
        var normy = normList[1];
        var normz = normList[2];
        
        vertAddPoint(vbuffer, xx, yy, z, normx, normy, normz, u, v, color, opacity);
    }
}