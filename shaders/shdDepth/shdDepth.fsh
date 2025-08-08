//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying vec3 position;

void main() {
    gl_FragColor = vec4(vec3(1. - (length(position) / 1000.)), 1.);
}
