#version 330 core

in vec3 vertexColor;
in vec2 TexCoord;

out vec4 FragColor;

uniform vec4 new_color;
uniform sampler2D texture1;
uniform sampler2D texture2;

void main() {
    vec4 dept = texture(texture2, TexCoord);
    //if (dept > vec4(0.0)) {
    //    FragColor = dept * (new_color * vec4(vertexColor, 0.0));
    //}

    FragColor = texture(texture1, TexCoord) + mix(vec4(0.4, 0.1, 0.4, 1.0), vec4(0.7, 0.4, 0.8, 1.0), dept.y);

    /*
    if (dept.x > 0.15) {
        FragColor = dept * vec4(vertexColor, 0.0);
    } else {
        FragColor = vec4(0.0); //texture(texture1, TexCoord) + dept * (new_color * vec4(vertexColor, 0.0));
    }
    */
}