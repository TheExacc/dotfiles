#version 330
// Gradient compensation shader for bottom-whitish TN display
// Place this in: ~/.config/picom/shaders/gradient-fix.glsl

uniform sampler2D tex;

void main() {
    vec2 texcoord = gl_TexCoord[0].xy;
    vec4 color = texture2D(tex, texcoord);
    
    // Get vertical position (0.0 at top, 1.0 at bottom)
    float y = texcoord.y;
    
    // Create smooth gradient that starts darkening from middle to bottom
    // ADJUST THESE VALUES:
    float darkenStart = 0.45;   // Start darkening at 45% from top (middle area)
    float darkenAmount = 0.70;  // Bottom will be 30% darker
    
    // Smooth interpolation from middle to bottom
    float darkenFactor = 1.0;
    if (y > darkenStart) {
        float normalizedY = (y - darkenStart) / (1.0 - darkenStart);
        // Smooth curve for natural transition
        darkenFactor = mix(1.0, darkenAmount, smoothstep(0.0, 1.0, normalizedY));
    }
    
    // Apply darkening to RGB channels
    color.rgb *= darkenFactor;
    
    gl_FragColor = color;
}
