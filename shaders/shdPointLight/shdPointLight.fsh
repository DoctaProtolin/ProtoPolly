//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// Arguments
uniform vec3 u_lightPosition;
uniform float u_lightIntensity;
uniform float u_ambientIntensity;

varying vec3 v_normal;
varying vec4 v_worldPosition;

void main()
{
    vec4 lightColor = vec4(1., 1., 1., 1.);
    
    vec3 lightDirection = normalize(u_lightPosition - v_worldPosition.xyz);
    
    // Wouldn't want to warp lighting, now would we?
    vec3 normal = normalize(v_normal);
    
    float dist = distance(u_lightPosition, v_worldPosition.xyz);
    float lightDiff = max(dot(normal, lightDirection), 0.);
    
    gl_FragColor = lightDiff * lightColor * 1./(dist*dist) * u_lightIntensity * texture2D(gm_BaseTexture, v_vTexcoord) + vec4(u_ambientIntensity);
    gl_FragColor.a = 1.;
}
