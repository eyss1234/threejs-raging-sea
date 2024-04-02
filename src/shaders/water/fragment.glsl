uniform vec3 uDepthColor;
uniform vec3 uSurfaceColor;
uniform float uColorOffset;
uniform float uColorMultiplier;

varying float vElevation;

void main(){
    // output colour in sRGB olour space
    #include <colorspace_fragment>

    float mixStregth = vElevation * uColorMultiplier + uColorOffset;
    vec3 color = mix(uDepthColor, uSurfaceColor, mixStregth);

    gl_FragColor = vec4(color, 1.0);
}