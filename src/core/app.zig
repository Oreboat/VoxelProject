const flecs = @import("flecs");
const vulkan = @import("renderer/vulkan.zig");
const window = @import("renderer/window.zig");
const entity = @import("ecs/entity.zig");
const render = @import("renderer/render.zig");

pub const App = struct {
    const Ready = flecs.OnStart;
    const PreUpdate = flecs.PreUpdate;
    const Update = flecs.OnUpdate;
    const PostUpdate = flecs.PostUpdate;
    world: *flecs.world_t,

    pub fn new() !*App {
        const app = App{ .world = flecs.init() };

        app.component(window.Window);
        app.component(vulkan.VulkanEngine);

        const renderer = app.new_entity("renderer");
        renderer.set(window.Window, window.Window.new());
        renderer.set(vulkan.VulkanEngine);

        app.system(App.Ready, render.renderer);

        return &app;
    }

    pub fn component(self: *App, comptime T: type) void {
        flecs.COMPONENT(self.world, T);
    }

    pub fn new_entity(self: *App, name: [*:0]const u8) entity.Entity {
        return entity.Entity{ .world = self.world, .id = flecs.new_entity(self.world, name) };
    }

    pub fn system(self: *App, phase: u64, system_desc: *flecs.system_desc_t) void {
        flecs.SYSTEM(self.world, phase, system_desc);
    }

    pub fn progress(self: *App) void {
        flecs.progress(self.world, 0);
    }
};
