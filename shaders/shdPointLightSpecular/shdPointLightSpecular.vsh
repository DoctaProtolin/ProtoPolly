//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// Arguments
uniform vec3 u_lightPosition;
uniform vec3 u_cameraPosition;
uniform float u_lightIntensity;
uniform float u_ambientIntensity;

varying vec4 v_worldPosition;
varying vec3 v_normal;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    vec4 worldPosition = gm_Matrices[MATRIX_WORLD] * vec4(in_Position, 1.);
    v_worldPosition = worldPosition;
    
    // The up Z direction is positive here unlike in my current setup
    //vec3 lightPosition = vec3(0., 0, 100.);
    
    // Transform normal into world space (optional: normalize here or in frag) (thanks Chat GPT)
    // Apparently this will fail if the surface is scaled with shearing, mirroring, or non-uniform scaling
    
    mat3 normalMatrix = mat3(gm_Matrices[MATRIX_WORLD]);
    v_normal = normalize(normalMatrix * in_Normal);
    
    
    //diffuseLight = lightColor * lightIntensity / (dist*dist); //(lightColor * lightIntensity * diffuseStrength) / (dist * dist);
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
