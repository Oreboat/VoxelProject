const vulkan = @import("vulkan.zig");
const window = @import("window.zig");

pub fn renderer(windows: []window.Window) void {
    for (windows) |*w| {
        while (!w.should_close) {
            window.c.SDL_PollEvent();
        }
    }
}
