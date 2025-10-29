const vk = @import("vulkan");
const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {}); // We are providing our own entry point
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3/SDL_vulkan.h");
});

pub const VulkanEngine = struct {
    instance: *vk.Instance,
    debug_messenger: *vk.DebugUtilsMessengerEXT,
    gpu: *vk.PhysicalDevice,
    device: *vk.Device,
    surface: *vk.SurfaceKHR,

    pub fn new() !VulkanEngine {
        var engine = VulkanEngine{
            .instance = undefined,
            .debug_messenger = undefined,
            .gpu = undefined,
            .device = undefined,
            .surface = undefined
        };
        try engine.init_vulkan();
        try engine.init_swapchain();
        try engine.init_commands();
        try engine.init_sync_buffers();

        return engine;
    }

    fn init_vulkan(self: *VulkanEngine) !void{
        const extension_count = 0;
        const extensions =  c.SDL_Vulkan_GetInstanceExtensions(extension_count);

        const application_info = vk.ApplicationInfo{
            .s_type = vk.StructureType.application_info,
            .p_application_name = "Voxel Project",
            .application_version = 0.0,
            .api_version = 0.0,
            .p_engine_name = "mei-hua-engine",
            .engine_version = 0.0
        };

        const create_info = vk.InstanceCreateInfo{
            .s_type = vk.StructureType.instance_create_info,
            .p_application_info = &application_info,
            .pp_enabled_extension_names = @ptrCast(extensions),
            .enabled_extension_count = extension_count,
            .enabled_layer_count = 0
        };
        const create_instace = vk.PfnCreateInstance{};
        if(create_instace(create_info, null, self.instance) != vk.Result.success){
            return error.InitializationFailed;
        }
    }

    fn init_swapchain(self: *VulkanEngine) !void{
        _ = self;
    }

    fn init_commands(self: *VulkanEngine) !void{
        _ = self;
    }

    fn init_sync_buffers(self: *VulkanEngine) !void{
        _ = self;
    }

};
