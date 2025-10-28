const vulkan = @import("vulkan.zig");
const window = @import("window.zig");
const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {}); // We are providing our own entry point
    @cInclude("SDL3/SDL_main.h");
});


pub fn renderer(windows: []window.Window) void {
    var event : c.SDL_Event = undefined;
    for (windows) |*w| {
        while (!w.should_close) {
            while (c.SDL_PollEvent(&event)) 
            {
                switch (event.type) {
                    c.SDL_EVENT_WINDOW_CLOSE_REQUESTED => {
                        w.should_close = true;
                    },
                    else => {}
                }
            }
        }
    }
}
