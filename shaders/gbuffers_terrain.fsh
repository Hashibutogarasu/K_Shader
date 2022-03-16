#version 120

uniform sampler2D lightmap;
uniform sampler2D texture;

varying vec2 lmcoord;
varying vec2 texcoord;
varying vec4 glcolor;

void main() {
	vec4 diffuse = texture2D(texture, texcoord) * glcolor;
	diffuse *= texture2D(lightmap, lmcoord);

	gl_FragData[0] = diffuse;
}