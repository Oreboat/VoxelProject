const std = @import("std");
const VoxelProject = @import("VoxelProject");

pub fn main() !void {
    try VoxelProject.init(VoxelProject.Backend.Renderer.VULKAN);
}
