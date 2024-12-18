#version 330 core

in vec3 vertexColor;
out vec4 FragColor;

uniform vec4 new_color;

void main() {
    FragColor = new_color * vec4(vertexColor, 1.0);
}