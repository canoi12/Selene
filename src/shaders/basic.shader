#shader vertex
#version 330

in vec2 v_Pos;
in vec3 v_Color;
in vec2 v_TexCoord;

out vec3 in_Color;
out vec2 in_TexCoord;

uniform mat4 world;
uniform mat4 view;
uniform mat4 model;

uniform vec4 spriteFrame;
out vec4 sprFrame;

void main() {
     gl_Position = world * view * model * vec4(v_Pos, 0.0, 1.0);
     //gl_Position = vec4(v_Pos, 0.0, 1.0);

     in_Color = v_Color;
     in_TexCoord = vec2(v_TexCoord.x, v_TexCoord.y);

     sprFrame = spriteFrame;
}

#shader fragment
#version 330

in vec3 in_Color;
in vec2 in_TexCoord;
in vec4 sprFrame;

out vec4 Color;

uniform sampler2D tex;

void main() {
     vec2 UV = sprFrame.xy + (in_TexCoord * sprFrame.zw);
     Color = texture(tex, UV) * vec4(in_Color, 1.0);
     //Color = texture(tex, UV);
}