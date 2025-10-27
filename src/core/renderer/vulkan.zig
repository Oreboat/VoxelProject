const vk = @import("vulkan");

const VulkanEngine = struct {
    instance: vk.Instance,
    debug_messenger: vk.DebugUtilsMessengerEXT,
    gpu: vk.PhysicalDevice,
    device: vk.Device,
    surface: vk.SurfaceKHR
};