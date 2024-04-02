uniform float utime;
uniform float uBigWavesElevation;
uniform vec2 uBigWavesFrequency;
uniform float uBigWavesSpeed;

void main() {
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    // Elevation 
    float elevation = sin(modelPosition.x * uBigWavesFrequency.x + utime * uBigWavesSpeed) * 
                      sin(modelPosition.z * uBigWavesFrequency.y + utime * uBigWavesSpeed) * 
                      uBigWavesElevation;

    modelPosition.y += elevation;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedMatrix = projectionMatrix * viewPosition;

    gl_Position = projectedMatrix;
}