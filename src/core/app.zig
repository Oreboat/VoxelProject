const flecs = @import("flecs");
const renderer = @import("renderer/vulkan.zig");
const window = @import("renderer/window.zig");


pub const App = struct {
    world: flecs.world_t
};