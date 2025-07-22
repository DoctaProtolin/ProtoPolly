//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 diffuseLight;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    vec3 lightDirection = vec3(0., 0., 1.);
    
    // The up Z direction is positive here unlike in my current setup
    vec3 lightPosition = vec3(0., 0, 100.);
    
    vec4 lightColor = vec4(1., 1., 1., 1.);
    float lightIntensity = 900000.;
    
    float diffuseStrength = clamp(dot(lightPosition, in_Position), 0., 1.);
 
    float dist = distance(in_Position, lightPosition); // Distance from light
    
    diffuseLight = (lightColor * lightIntensity * diffuseStrength) / (dist * dist);
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
