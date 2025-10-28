//! By convention, root.zig is the root source file when making a library.
pub const Backend = @import("core/renderer/backend.zig");

pub fn init(backend :Backend.Renderer) !void {
    var app = try @import("core/app.zig").App.new(backend);
    app.progress();
}

