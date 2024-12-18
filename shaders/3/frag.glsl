#version 330 core

in vec3 vertexColor;
in vec2 TexCoord;

out vec4 FragColor;

uniform vec4 new_color;
uniform sampler2D texture0;
uniform sampler2D texture1;

void main() {
    FragColor = mix(texture(texture0, TexCoord), texture(texture1, TexCoord), new_color) + (new_color * vec4(vertexColor, 1.0));
}