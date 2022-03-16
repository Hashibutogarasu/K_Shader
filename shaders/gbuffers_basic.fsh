#version 120

uniform sampler2D lightmap;

varying vec2 lmcoord;
varying vec4 glcolor;

void main() {
	vec4 diffuse = glcolor;
	diffuse *= texture2D(lightmap, lmcoord);

	gl_FragData[0] = diffuse;
}