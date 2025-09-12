shader_type canvas_item;

uniform float noise_strength : hint_range(0.0, 1.0) = 0.15;
uniform float scanline_strength : hint_range(0.0, 1.0) = 0.4;
uniform float vignette_strength : hint_range(0.0, 1.0) = 0.5;
uniform float static_intensity : hint_range(0.0, 1.0) = 0.08;
uniform sampler2D screen_texture : hint_screen_texture;

float random(vec2 uv) {
    return fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453123);
}

float noise(vec2 uv) {
    vec2 i = floor(uv);
    vec2 f = fract(uv);
    
    float a = random(i);
    float b = random(i + vec2(1.0, 0.0));
    float c = random(i + vec2(0.0, 1.0));
    float d = random(i + vec2(1.0, 1.0));
    
    vec2 u = f * f * (3.0 - 2.0 * f);
    
    return mix(a, b, u.x) + (c - a) * u.y * (1.0 - u.x) + (d - b) * u.x * u.y;
}

void fragment() {
    vec2 uv = SCREEN_UV;
    
    // Get base color
    vec4 color = texture(screen_texture, uv);
    
    // VHS interference lines (horizontal static bars)
    float interference_wave = sin(uv.y * 50.0 + TIME * 10.0);
    float interference = 0.0;
    if (interference_wave > 0.95) {
        interference = 0.1;
    }
    color.rgb += vec3(interference);
    
    // More prominent scanlines with varying intensity
    float scanline = sin(uv.y * 600.0) * scanline_strength;
    float scanline_flicker = 0.5 + 0.5 * sin(TIME * 8.0);
    scanline *= scanline_flicker;
    color.rgb *= 1.0 - scanline;
    
    // Enhanced static/noise with temporal variation
    float enhanced_static = noise(uv * 150.0 + TIME * 100.0) * static_intensity;
    float static_flicker = 0.7 + 0.3 * sin(TIME * 20.0);
    enhanced_static *= static_flicker;
    color.rgb += enhanced_static;
    
    // VHS brightness flicker
    float brightness_var = 1.0 + sin(TIME * 5.0) * 0.05;
    color.rgb *= brightness_var;
    
    // More grain
    float grain = random(uv + TIME) * noise_strength;
    color.rgb += grain - noise_strength * 0.5;
    
    // Stronger vignette for that tube TV feel
    vec2 center = uv - 0.5;
    float vignette = 1.0 - dot(center, center) * vignette_strength;
    vignette = clamp(vignette, 0.0, 1.0);
    color.rgb *= vignette;
    
    // Enhanced VHS color grading (more desaturated, warmer)
    float gray = dot(color.rgb, vec3(0.299, 0.587, 0.114));
    color.rgb = mix(vec3(gray), color.rgb, 0.75); // More desaturated
    color.rgb *= vec3(1.05, 0.98, 0.95); // Warmer, more yellow tint
    
    // Slight contrast boost for that VHS look
    color.rgb = pow(color.rgb, vec3(0.9));
    
    // Clamp to prevent overbrightness
    color.rgb = clamp(color.rgb, 0.0, 1.0);
    
    COLOR = color;
}