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
    
    float lightNormal = dot(normal, lightDirection);
    
    vec4 diffuseLight = lightDiff * lightColor * 1./pow(dist, 1.65) * u_lightIntensity * texture2D(gm_BaseTexture, v_vTexcoord);
    vec4 specularLight = dot(lightDirection, cameraDirection) * vec4(1.) * vec4(10000.) * 1./pow(dist, 2.);
    vec4 ambientLight = vec4(1.) * u_ambientIntensity * texture2D(gm_BaseTexture, v_vTexcoord);
    //color += pow(dot(lightDirection, cameraDirection), 3.) * vec4(1., 0., 0., 1.) * vec4(100000.) * 1./pow(dist, 2.);
    
    //float luminance = 0.2126 * color.r + 0.7152 * color.g + 0.0722 * color.b;

    gl_FragColor = diffuseLight + ambientLight;
    gl_FragColor.a = 1.;
}
