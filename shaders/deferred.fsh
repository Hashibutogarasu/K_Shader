#version 120

uniform sampler2D gcolor;

varying vec2 texcoord;

void main() {
	vec3 diffuse = texture2D(gcolor, texcoord).rgb;

	gl_FragData[0] = vec4(diffuse, 1.0);
}