package main

import "core:fmt"

import gl "vendor:OpenGL"
import "vendor:glfw"

setWindow :: proc() -> glfw.WindowHandle{
    // ======================================
	glfw.WindowHint(glfw.RESIZABLE, 1)
	glfw.WindowHint(glfw.CONTEXT_VERSION_MAJOR,GL_MAJOR_VERSION)
	glfw.WindowHint(glfw.CONTEXT_VERSION_MINOR,GL_MINOR_VERSION)
	glfw.WindowHint(glfw.OPENGL_PROFILE,glfw.OPENGL_CORE_PROFILE)
	if(glfw.Init() != true){
		fmt.println("Failed to initialize GLFW")
		return nil
	}

    // ======================================
	window := glfw.CreateWindow(700, 700, PROGRAMNAME, nil, nil)
	if window == nil {
		fmt.println("Unable to create window")
		return nil
	}
	
    // ======================================
	glfw.MakeContextCurrent(window)
	glfw.SwapInterval(1)
	glfw.SetKeyCallback(window, key_callback)
	glfw.SetFramebufferSizeCallback(window, size_callback)
	gl.load_up_to(int(GL_MAJOR_VERSION), GL_MINOR_VERSION, glfw.gl_set_proc_address)

    return window
}