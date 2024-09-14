{ pkgs, ...}:
{
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = ["amdgpu"];
}
