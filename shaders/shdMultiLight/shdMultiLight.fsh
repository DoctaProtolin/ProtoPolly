//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// Arguments
uniform vec3 u_lightPositions[16];
uniform vec3 u_lightColors[16];
uniform float u_diffuseIntensities[16];

uniform vec3 u_cameraPosition;

//uniform float u_diffuseIntensity;
uniform float u_ambientIntensity;
uniform float u_specularIntensity;
uniform float u_specularPower;

varying vec3 v_normal;
varying vec4 v_worldPosition;

void main()
{
    
    // Wouldn't want to warp lighting, now would we?
    vec3 normal = normalize(v_normal);
    
    vec4 lightColor = vec4(1., 1., 1., 1.);
    vec3 cameraDirection = normalize(u_cameraPosition - v_worldPosition.xyz);
    
    vec4 ambientLight = vec4(1.) * u_ambientIntensity * texture2D(gm_BaseTexture, v_vTexcoord);
    
    for (int i = 0; i < 16; i ++) {
        vec3 lightPosition = u_lightPositions[i];
        float diffuseIntensity = u_diffuseIntensities[i];
        
        vec3 lightDirection = normalize(lightPosition - v_worldPosition.xyz);
        
        float dist = distance(lightPosition, v_worldPosition.xyz);
        float lightDiff = max(dot(normal, lightDirection), 0.);
        
        vec4 diffuseLight = lightDiff * lightColor * 1./pow(dist, 1.65) * diffuseIntensity * texture2D(gm_BaseTexture, v_vTexcoord);
        
        // Specular Calculations below
        vec3 lightReflect = normalize(reflect(lightDirection, normal));
        float specularFactor = pow(max(dot(lightReflect, cameraDirection), 0.), u_specularPower); // why must cameraDirection be negative?
    
        vec4 specularLight = specularFactor * vec4(1.) * u_specularIntensity * 1./pow(dist, 2.) * texture2D(gm_BaseTexture, v_vTexcoord);
        
        gl_FragColor += diffuseLight + specularLight;
    }
    
    // This already pretends to be the result of lots of light interactions.
    gl_FragColor += ambientLight;

    gl_FragColor.a = 1.;
}
