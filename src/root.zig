//! By convention, root.zig is the root source file when making a library.

pub fn init() !void {
    const app = try @import("core/app.zig").App.new();
    _ = app;
}
