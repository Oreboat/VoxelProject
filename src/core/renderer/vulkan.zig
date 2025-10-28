const vk = @import("vulkan");

pub const VulkanEngine = struct {
    instance: vk.Instance,
    debug_messenger: vk.DebugUtilsMessengerEXT,
    gpu: vk.PhysicalDevice,
    device: vk.Device,
    surface: vk.SurfaceKHR,

    pub fn new() *VulkanEngine {}
};
