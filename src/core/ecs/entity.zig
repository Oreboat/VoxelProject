const flecs = @import("flecs");

pub const Entity = struct {
    world: *flecs.world_t,
    id: u64,

    pub fn set(self: *Entity, comptime T: type, val: T) void {
        _ = flecs.set(self.world, self.id, T, val);
    }

    pub fn remove(self: *Entity, comptime T: type) void {
        flecs.remove(self.world, self.id, T);
    }
};
