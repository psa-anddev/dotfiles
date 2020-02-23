import XMonad
import XMonad.Util.SpawnOnce
import XMonad.Hooks.DynamicLog

main = xmonad =<< statusBar upBar upBarConfiguration upBarToggleStructsKey configuration
startup = do
	spawnOnce "xrdb -merge ~/.Xresources"
	spawnOnce "~/.fehbg"
        spawnOnce "picom"
        spawnOnce "clipmenud"
        spawnOnce "dunst"

configuration = defaultConfig
	{ terminal = "kitty"
	, modMask = mod1Mask
	, borderWidth = 3
	, startupHook = startup
	}

upBar = "xmobar"
upBarConfiguration = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "[" "]" }
upBarToggleStructsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
