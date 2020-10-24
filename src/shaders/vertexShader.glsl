#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aColor;

out vec3 ourColor;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
uniform bool sun;

void main() {
    gl_Position = projection * view * model * vec4(aPos, 1);
    if(sun) ourColor = vec3(0.5f, 1.0f, 0);
    else ourColor = aColor;
}
