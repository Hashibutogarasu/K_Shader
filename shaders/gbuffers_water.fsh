#version 120


uniform sampler2D lightmap;
uniform sampler2D texture;
uniform float frameTimeCounter;

varying vec2 lmcoord;
varying vec2 texcoord;
varying vec4 glcolor;

void main() {
    
    vec4 diffuse = texture2D(texture, texcoord) * glcolor;
    diffuse *= texture2D(lightmap, lmcoord);

	diffuse.rgb *= vec3(1.0,1.0,1.0);

    #ifdef GRASS_AO
		if (ao < 0.999) color.rgb *= sqrt(ao) * 0.5 + 0.5;
	#endif

    gl_FragData[0] = diffuse;
}