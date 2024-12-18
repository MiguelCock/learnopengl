package main

import "core:fmt"
import "core:c"
import "core:strings"
import "core:os"
import "core:math"

import stb "vendor:stb/image"
import gl "vendor:OpenGL"
import "vendor:glfw"

PROGRAMNAME :: "Program"

GL_MAJOR_VERSION : c.int : 4
GL_MINOR_VERSION :: 6

running : b32 = true

main :: proc(){
    window := setWindow()
    if window == nil {
        return
    }
    defer glfw.Terminate()
    defer glfw.DestroyWindow(window)
	
    // ====================================== shaders
    shaderProgram := create_shader()
    defer gl.DeleteShader(shaderProgram)

    // ====================================== Set up vertex data and buffers
    vbo, ebo, vao: u32
    vxo2(&vbo, &ebo, &vao)
    defer gl.DeleteBuffers(1, &vbo)
    defer gl.DeleteBuffers(1, &ebo)
    defer gl.DeleteVertexArrays(1, &vao)

    colorLocation := gl.GetUniformLocation(shaderProgram, "new_color")
    if colorLocation < 0 {
        fmt.println("Failed to find color location")
        return
    }

    wit, hig, nrCha: i32
    data := stb.load("a", &wit, &hig, &nrCha, 0)

    // ======================================
	for (!glfw.WindowShouldClose(window) && running) {
		glfw.PollEvents()

		gl.ClearColor(0.2, 0.3, 0.3, 1.0)
        gl.Clear(gl.COLOR_BUFFER_BIT)

        //===================
        time := cast(f32)glfw.GetTime()
        val := (math.sin(time) / 2.0) + 0.5;
        gl.Uniform4f(colorLocation, 1, val, 1, 1)
        //===================

        gl.UseProgram(shaderProgram)

        // Bind VAO and draw the triangle
        gl.BindVertexArray(vao)
        gl.DrawElements(gl.TRIANGLES, 6, gl.UNSIGNED_INT, nil)
        //gl.DrawArrays(gl.TRIANGLES, 0, 6)
        //gl.BindVertexArray(0)

		glfw.SwapBuffers(window)
	}
}