#version 330 core
out vec4 FragColor;
in vec3 ourColor;

void main() {
    FragColor = vec4(ourColor, 1.0);//vec4(1.0, 0.5, 0.2, 1.0);
}
