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
    
    vec4 color = lightDiff * lightColor * 1./(dist*dist) * u_lightIntensity * texture2D(gm_BaseTexture, v_vTexcoord);
    
    float luminance = (0.2126 * color.r + 0.7152 * color.g + 0.0722 * color.b);
    
    if (luminance < u_ambientIntensity) {
        gl_FragColor = texture2D(gm_BaseTexture, v_vTexcoord) * u_ambientIntensity;
        //gl_FragColor = normalize(gl_FragColor);
        //gl_FragColor *= u_ambientIntensity;
    } else {
        gl_FragColor = color;
    }
    
    gl_FragColor.a = 1.;
}
