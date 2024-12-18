package main

import "core:fmt"
import "core:c"
import gl "vendor:OpenGL"

create_shader :: proc () -> u32 {
    vertexShaderSource := #load("shaders/vert.glsl", cstring)
    fragmentShaderSource := #load("shaders/frag.glsl", cstring)

    vertexShader := gl.CreateShader(gl.VERTEX_SHADER)
    gl.ShaderSource(vertexShader, 1, &vertexShaderSource, nil)
    gl.CompileShader(vertexShader)
    check_shader_compile_status(vertexShader)

    fragmentShader := gl.CreateShader(gl.FRAGMENT_SHADER)
    gl.ShaderSource(fragmentShader, 1, &fragmentShaderSource, nil)
    gl.CompileShader(fragmentShader)
    check_shader_compile_status(fragmentShader)

    shaderProgram := gl.CreateProgram()
    gl.AttachShader(shaderProgram, vertexShader)
    gl.AttachShader(shaderProgram, fragmentShader)
    gl.LinkProgram(shaderProgram)
    check_program_link_status(shaderProgram)

    gl.DeleteShader(vertexShader)
    gl.DeleteShader(fragmentShader)

    return shaderProgram
}

// ======================================
check_shader_compile_status :: proc(shader: u32) {
    success: c.int
    gl.GetShaderiv(shader, gl.COMPILE_STATUS, &success)
    if success == 0 {
        logLength: c.int
        gl.GetShaderiv(shader, gl.INFO_LOG_LENGTH, &logLength)
        log: [^]u8
        gl.GetShaderInfoLog(shader, logLength, nil, log)
        fmt.printf("ERROR::SHADER::COMPILATION_FAILED\n%.*s\n", logLength, &log)
        free(log)
    }
}

check_program_link_status :: proc(program: u32) {
    success: c.int
    gl.GetProgramiv(program, gl.LINK_STATUS, &success)
    if success == 0 {
        logLength: c.int
        gl.GetProgramiv(program, gl.INFO_LOG_LENGTH, &logLength)
        log: [^]u8
        gl.GetProgramInfoLog(program, logLength, nil, log)
        fmt.printf("ERROR::PROGRAM::LINKING_FAILED\n%.*s\n", logLength, log)
        free(log)
    }
}