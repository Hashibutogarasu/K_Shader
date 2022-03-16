#version 120

varying vec2 lmcoord;
varying vec2 texcoord;
varying vec4 glcolor;

uniform float frameTimeCounter;

void main() {

	gl_Position = ftransform();

	float speed = 0.25;
	float pi = 3.14;

	float water_wave = 2.0;

    float magnitude = (sin((frameTimeCounter * pi / ((28.0) * speed))) * 0.05 + 0.15) * 0.17;
    float d0 = sin(frameTimeCounter * pi / (132.0 * speed)) * 3.0 - 1.5;
    float d1 = sin(frameTimeCounter * pi / (132.0 * speed)) * 3.0 - 1.5;
    float d2 = sin(frameTimeCounter * pi / (132.0 * speed)) * 3.0 - 1.5;
    float d3 = sin(frameTimeCounter * pi / (132.0 * speed)) * 3.0 - 1.5;
    gl_Position.x += sin((frameTimeCounter * pi / (13.0 * speed)) + (gl_Position.x + d0)*0.9 + (gl_Position.z + d1)*0.9) * magnitude * water_wave;
    gl_Position.y += sin((frameTimeCounter * pi / (15.0 * speed)) + (gl_Position.z + d2) + (gl_Position.x + d3)) * magnitude * water_wave;
    gl_Position.y -= 0.04;

	texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
	lmcoord = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
	glcolor = gl_Color;    
}