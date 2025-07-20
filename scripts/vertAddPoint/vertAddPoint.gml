
/// @param vbuffer
/// @param x
/// @param y
/// @param z
/// @param normx
/// @param normy
/// @param normz
/// @param u
/// @param v
/// @param color
/// @param opacity


// Vertex add point
function vertAddPoint(vbuffer, x, y, z, normx, normy, normz, u, v, color, opacity){
    vertex_position_3d(vbuffer, x, y, z);
    vertex_normal(vbuffer, normx, normy, normz);
    vertex_texcoord(vbuffer, u, v);
    vertex_color(vbuffer, color, opacity);
}