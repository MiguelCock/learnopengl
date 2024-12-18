#version 330 core

in vec3 vertexColor;
in vec2 TexCoord;

out vec4 FragColor;

uniform vec4 new_color;
uniform sampler2D texture1;
uniform sampler2D texture2;

void main() {
    FragColor = mix(texture(texture1, TexCoord), texture(texture2, TexCoord), new_color) + (new_color * vec4(vertexColor, 0.0));
}