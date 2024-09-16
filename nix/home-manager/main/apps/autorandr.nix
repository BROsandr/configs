{ pkgs, ... }: {
    programs.autorandr = {
        enable = true;
        profiles = {
            "work" = {
                fingerprint = {
                    DP-2 = "00ffffffffffff001e6d50776604010004220104b5462878fa7ba1ae4f44a9260c5054210800d1c061400101010101010101010101014dd000a0f0703e8030203500b9882100001a000000fd00283c1e873c000a202020202020000000fc004c472048445220344b0a202020000000ff003430344e54524c31593636320a01be02031f7223090707830100004401030410e2006ae305c000e606050159595204740030f2705a80b0588a00b9882100001e565e00a0a0a0295030203500b9882100001a1a3680a070381f402a263500b9882100001a000000000000000000000000000000000000000000000000000000000000000000000000000000000000ea";
                    DP-3 = "00ffffffffffff0004722602084b70142f15010368301b782ec585a459499a24125054b30c00714f818081009500d1c0010101010101023a801871382d40582c4500dd0c1100001e000000fd00324c1e5311000a202020202020000000ff005134323038303033343230300a000000fc004163657220453232304851560a0043";
                };
                config = {
                    DP-2 = {
                        enable = true;
                        primary = true;
#                        position = "0x0";
                        mode = "3840x2160";
#                        rate = "60.00";
                        rotate = "normal";
#                        dpi = 140;
#                        scale = {
#                            x = 0.7;
#                            y = 0.7;
#                        };
                    };
                    DP-3 = {
                        enable = true;
                        primary = false;
                        position = "3840x0";
                        mode = "1920x1080";
                        rotate = "normal";
#                        dpi = 96;
#                        scale = {
#                            x = 1.3;
#                            y = 1.3;
#                        };
#                        framebuffer = "6336x2160";
                        transform = null;
                    };
                };
            };
        };
        hooks = {
            postswitch = {
                "notify-i3" = "${pkgs.i3}/bin/i3-msg restart";
                "change-dpi" = ''
                    case "$AUTORANDR_CURRENT_PROFILE" in
                        work)
                            DPI=140
                            ;;
                        *)
                            echo "Unknown profile: $AUTORANDR_CURRENT_PROFILE"
                            exit 1
                    esac

                    echo "Xft.dpi: $DPI" | ${pkgs.xorg.xrdb}/bin/xrdb -merge
                    '';
            };
        };
    };
}