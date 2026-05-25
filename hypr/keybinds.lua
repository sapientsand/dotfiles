--default application bindings
local terminal = "kitty"
local fileManager = "dolphin"
local screenshot = "hyprshot -m region -o ~/Pictures/screencaps/current"
local browser = "firefox"
local menu = "qs -c noctalia-shell ipc call launcher toggle"

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Resize windows with mainMod + shift + j/k
-- move windows between columts with mainMod + shift + h/l
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + SHIFT + j ", hl.dsp.layout("colresize -conf"))
hl.bind(mainMod .. " + SHIFT + k ", hl.dsp.layout("colresize +conf"))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.layout("swapcol r"))
hl.bind(mainMod .. " + CTRL + h", hl.dsp.layout("consume"))
hl.bind(mainMod .. " + CTRL + l", hl.dsp.layout("expel"))
-- Full size column and fullscreen binds
hl.bind(mainMod .. " + f ", hl.dsp.layout("colresize 1.0"))
hl.bind(mainMod .. " + SHIFT + f", hl.dsp.window.fullscreen({ toggle }))
-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Bindings for custom applications
-- screenshot bindings
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(screenshot))

-- obs global shortcuts
hl.bind(mainMod .. "+ SHIFT + bracketleft", hl.dsp.global("com.obsproject.Studio:_toggle_recording"))
hl.bind(mainMod .. "+ SHIFT + bracketright", hl.dsp.global("com.obsproject.Studio:_toggle_replay_buffer"))
hl.bind(mainMod .. "+ SHIFT + backslash", hl.dsp.global("com.obsproject.Studio:ReplayBuffer.Save"))
