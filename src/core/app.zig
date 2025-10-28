const flecs = @import("flecs");
const vulkan = @import("renderer/vulkan.zig");
const sdl = @import("renderer/sdl.zig");
const window = @import("renderer/window.zig");
const entity = @import("ecs/entity.zig");
const render = @import("renderer/render.zig");
const backend = @import("renderer/backend.zig");
const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {}); // We are providing our own entry point
    @cInclude("SDL3/SDL_main.h");
});


pub const App = struct {
    world: *flecs.world_t,

    pub fn new(render_backend: backend.Renderer) !*App {
        var app = App{ .world = flecs.init() };

        app.component(window.Window);
        app.component(vulkan.VulkanEngine);
        app.tag(sdl.SDL);

        var renderer = app.new_entity("renderer");
        
        switch (render_backend) {
            backend.Renderer.VULKAN => {
                renderer.set(window.Window, window.Window.new("Vulkan Engine Project", 1280, 720, c.SDL_WINDOW_VULKAN));
                //renderer.set(vulkan.VulkanEngine, {});
            },
            backend.Renderer.SDL => {
                renderer.set(window.Window, window.Window.new("Engine Project", 1280, 720, c.SDL_WINDOW_VULKAN));
            }
        }
        app.system(flecs.OnStart, render.renderer);

        return &app;
    }

    pub fn component(self: *App, comptime T: type) void {
        flecs.COMPONENT(self.world, T);
    }

    pub fn tag(self: *App, comptime T: type) void{
        flecs.TAG(self.world, T);
    }

    pub fn new_entity(self: *App, name: [*:0]const u8) entity.Entity {
        return entity.Entity{ .world = self.world, .id = flecs.new_entity(self.world, name) };
    }

    pub fn system(self: *App, phase: u64, comptime fn_system: anytype) void {
       _ = flecs.ADD_SYSTEM(self.world,"", phase, fn_system);
    }

    pub fn progress(self: *App) void {
        _ = flecs.progress(self.world, 0);
    }
};
