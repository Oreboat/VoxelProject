pub const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {}); // We are providing our own entry point
    @cInclude("SDL3/SDL_main.h");
});

pub const Window = struct {
    window: ?*c.struct_SDL_Window,
    should_close: bool,
    pub fn new(title: [*c]const u8, width: c_int, height: c_int, flags: u64) Window {
        //const window = c.SDL_CreateWindow(title, width, height, 0);
        return Window{
            .window = c.SDL_CreateWindow(title, width, height, flags),
            .should_close = false
        };
    }
};
