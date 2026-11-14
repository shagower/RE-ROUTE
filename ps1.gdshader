shader_type canvas_item;

const float jitter_amount = 0.1;
const vec2 virtual_resolution = vec2(640.0, 480.0);

uniform sampler2D screen_tex : hint_screen_texture;

void fragment() {
    // Sample the current viewport texture
    vec2 uv = SCREEN_UV;

    // Pixel snapping
    vec2 snapped_uv = floor(uv * virtual_resolution) / virtual_resolution;

    // PS1-style jitter
    float jitter = sin(TIME * 60.0) * jitter_amount / virtual_resolution.x;
    snapped_uv.x += jitter * 1.0;

    // Sample the screen
    vec4 col = texture(screen_tex, snapped_uv);

    // Color banding (5 bits per channel)
    float levels = 32.0;
    col.rgb = floor(col.rgb * levels) / levels;

    // Blend with original
    vec4 original = texture(screen_tex, uv);
    COLOR = mix(original, col, 1.0);
}
