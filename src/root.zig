//! By convention, root.zig is the root source file when making a library.
const std = @import("std");
const zglfw = @import("zglfw");

pub fn init() !void {
    
    defer zglfw.terminate();
    try start();

}

const App = struct {
    fn new() !App{

    }

    fn run() !App{
        
    }
    fn init_glfw(self: App) !void{
        _ = self;
    }
    fn init_vulkan(self: App) !void{
        _ = self;
    }
    fn main_loop(self: App) !void{
        _ = self;
    }
    fn deinit(self: App) !void{
        _ = self;
    }
};

fn start() !void{
    try zglfw.init();
    const window = try zglfw.createWindow(1280, 720, "Voxel Project", null);
    defer zglfw.destroyWindow(window);

    while (!window.shouldClose()) {
        zglfw.pollEvents();
    }
}


