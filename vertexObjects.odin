package main

import gl "vendor:OpenGL"

//gl.DrawArrays(gl.TRIANGLES, 0, 6)
//gl.BindVertexArray(0)
generateVXO :: proc(vbo, vao: ^u32){
    vertices: [36]f32 =  {
        //x, y, z           r, g, b
        -0.5, 0.5, 0.0,     1.0, 0.0, 0.0,
        0.5, 0.5, 0.0,      0.0, 1.0, 0.0,
        -0.5, -0.5, 0.0,    0.0, 0.0, 1.0,
        
        0.5, 0.5, 0.0,      0.0, 1.0, 0.0,
        0.5, -0.5, 0.0,     1.0, 0.0, 0.0,
        -0.5, -0.5, 0.0,    0.0, 0.0, 1.0,

        /*
        -0.9, 0.9, 0.0,      1.0, 1.0, 1.0,
        0.9, 0.9, 0.0,     1.0, 1.0, 1.0,
        0.9, 0.7, 0.0,    1.0, 1.0, 1.0,
        */
    }
    
    gl.GenBuffers(1, vbo)
    gl.BindBuffer(gl.ARRAY_BUFFER, vbo^)
    gl.BufferData(gl.ARRAY_BUFFER, size_of(vertices), &vertices, gl.STATIC_DRAW)

    gl.GenVertexArrays(1, vao)
    gl.BindVertexArray(vao^)

    // VERTEX POSITIONS
    gl.VertexAttribPointer(0, 3, gl.FLOAT, gl.FALSE, 6 * size_of(f32), 0)
    gl.EnableVertexAttribArray(0)

    // VERTEX COLORS
    gl.VertexAttribPointer(1, 3, gl.FLOAT, gl.FALSE, 6 * size_of(f32), 3 * size_of(f32))
    gl.EnableVertexAttribArray(1)
}

//gl.DrawElements(gl.TRIANGLES, 6, gl.UNSIGNED_INT, nil)
vxo2 :: proc(vbo, ebo, vao: ^u32) {
    vertices: [24]f32 = {
        0.5,  0.5, 0.0,     0.89, 0.26, 0.34,// top right
        0.5, -0.5, 0.0,     0.27, 0.58, 0.54,// bottom right
       -0.5, -0.5, 0.0,     2.7, 0.49, 0.83,// bottom left
       -0.5,  0.5, 0.0,     0.27, 0.58, 0.54,// top left 
    }

    indices: [6]i32 = {  // note that we start from 0!
       0, 1, 3,   // first triangle
       1, 2, 3,   // second triangle
    }

    gl.GenVertexArrays(1, vao)
    gl.BindVertexArray(vao^)

    gl.GenBuffers(1, vbo)
    gl.BindBuffer(gl.ARRAY_BUFFER, vbo^)
    gl.BufferData(gl.ARRAY_BUFFER, size_of(vertices), &vertices, gl.STATIC_DRAW)

    gl.GenBuffers(1, ebo)
    gl.BindBuffer(gl.ELEMENT_ARRAY_BUFFER, ebo^)
    gl.BufferData(gl.ELEMENT_ARRAY_BUFFER, size_of(indices), &indices, gl.STATIC_DRAW)

    // VERTEX POSITIONS
    gl.VertexAttribPointer(0, 3, gl.FLOAT, gl.FALSE, 6 * size_of(f32), 0)
    gl.EnableVertexAttribArray(0)

    gl.VertexAttribPointer(1, 3, gl.FLOAT, gl.FALSE, 6 * size_of(f32), 3 * size_of(f32))
    gl.EnableVertexAttribArray(1)

    gl.BindBuffer(gl.ARRAY_BUFFER, 0)
    gl.BindVertexArray(0)
}

//gl.DrawElements(gl.TRIANGLES, 6, gl.UNSIGNED_INT, nil)
vxo3 :: proc(vbo, ebo, vao: ^u32) {
    vertices: [32]f32 = {
        //position          //color
        0.5,  0.5, 0.0,     0.89, 0.26, 0.34,   1.0, 0.0,// top right
        0.5, -0.5, 0.0,     0.27, 0.58, 0.54,   1.0, 1.0,// bottom right
       -0.5, -0.5, 0.0,     2.7, 0.49, 0.83,    0.0, 1.0,// bottom left
       -0.5,  0.5, 0.0,     0.27, 0.58, 0.54,   0.0, 0.0,// top left 
    }

    indices: [6]i32 = {  // note that we start from 0!
       0, 1, 3,   // first triangle
       1, 2, 3,   // second triangle
    }

    gl.GenVertexArrays(1, vao)
    gl.BindVertexArray(vao^)

    gl.GenBuffers(1, vbo)
    gl.BindBuffer(gl.ARRAY_BUFFER, vbo^)
    gl.BufferData(gl.ARRAY_BUFFER, size_of(vertices), &vertices, gl.STATIC_DRAW)

    gl.GenBuffers(1, ebo)
    gl.BindBuffer(gl.ELEMENT_ARRAY_BUFFER, ebo^)
    gl.BufferData(gl.ELEMENT_ARRAY_BUFFER, size_of(indices), &indices, gl.STATIC_DRAW)

    // VERTEX POSITIONS
    gl.VertexAttribPointer(0, 3, gl.FLOAT, gl.FALSE, 8 * size_of(f32), 0)
    gl.EnableVertexAttribArray(0)

    gl.VertexAttribPointer(1, 3, gl.FLOAT, gl.FALSE, 8 * size_of(f32), 3 * size_of(f32))
    gl.EnableVertexAttribArray(1)

    gl.VertexAttribPointer(2, 2, gl.FLOAT, gl.FALSE, 8 * size_of(f32), 6 * size_of(f32))
    gl.EnableVertexAttribArray(2)

    gl.BindBuffer(gl.ARRAY_BUFFER, 0)
    gl.BindVertexArray(0)
}