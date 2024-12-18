package main

import "core:fmt"

import stbi "vendor:stb/image"
import gl "vendor:OpenGL"
import "vendor:glfw"

genTexture :: proc(tex: ^u32, filepath: cstring) {
    wit, hig, nrCha: i32
    img := stbi.load(filepath, &wit, &hig, &nrCha, 0)
    if img == nil {
        fmt.printf("could not load image")
        return
    }
    defer stbi.image_free(img)

    gl.GenTextures(1, tex)
    gl.BindTexture(gl.TEXTURE_2D, tex^)
    //gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE)
    //gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE)
    gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST)
    gl.TexImage2D(gl.TEXTURE_2D, 0, gl.RGB, wit, hig, 0, gl.RGBA, gl.UNSIGNED_BYTE, img)
    gl.GenerateMipmap(gl.TEXTURE_2D)
}