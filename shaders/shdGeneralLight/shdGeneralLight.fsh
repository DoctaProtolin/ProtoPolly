//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// Arguments
uniform vec3 u_lightPosition;
uniform vec3 u_cameraPosition;

uniform float u_lightIntensity;
uniform float u_ambientIntensity;
uniform float u_specularIntensity;

varying vec3 v_normal;
varying vec4 v_worldPosition;

void main()
{
    vec4 lightColor = vec4(1., 1., 1., 1.);
    
    vec3 lightDirection = normalize(u_lightPosition - v_worldPosition.xyz);
    vec3 cameraDirection = normalize(u_cameraPosition - v_worldPosition.xyz);
    
    // Wouldn't want to warp lighting, now would we?
    vec3 normal = normalize(v_normal);
    
    float dist = distance(u_lightPosition, v_worldPosition.xyz);
    float lightDiff = max(dot(normal, lightDirection), 0.);
    
    vec4 diffuseLight = lightDiff * lightColor * 1./pow(dist, 1.65) * u_lightIntensity * texture2D(gm_BaseTexture, v_vTexcoord);
    vec4 ambientLight = vec4(1.) * u_ambientIntensity * texture2D(gm_BaseTexture, v_vTexcoord);
    
    // Specular Calculations below
    vec3 lightReflect = normalize(reflect(lightDirection, normal));
    float specularFactor = pow(max(dot(lightReflect, -cameraDirection), 0.), 5.); // why must cameraDirection be negative?
    
    vec4 specularLight = specularFactor * vec4(1.) * u_specularIntensity * 1./pow(dist, 1.5) * texture2D(gm_BaseTexture, v_vTexcoord);
    
    //float luminance = 0.2126 * color.r + 0.7152 * color.g + 0.0722 * color.b;

    gl_FragColor = ambientLight + diffuseLight + specularLight;
    gl_FragColor.a = 1.;
}
