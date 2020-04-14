import XMonad
import XMonad.Util.SpawnOnce
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig

main = xmonad =<< statusBar upBar upBarConfiguration upBarToggleStructsKey configuration
startup = do
	spawnOnce "xrdb -merge ~/.Xresources"
	spawnOnce "~/.fehbg"
        spawnOnce "picom"
        spawnOnce "clipmenud"
        spawnOnce "dunst"

configuration = defaultConfig
	{ terminal = defaultTerminal
	, modMask = mod4Mask
	, borderWidth = 3
	, startupHook = startup
        , workspaces = workspacesConfiguration
	} `additionalKeysP` myShortcuts

upBar = "xmobar"
upBarConfiguration = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "[" "]" }
upBarToggleStructsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
defaultTerminal = "alacritty"

myShortcuts = 
    [("M-C-q", spawn "betterlockscreen -l")
    , ("M-<Space>", spawn "dmenu_run")
    , ("M-p", sendMessage NextLayout)
    , ("M-C-p", spawn "~/repos/dotfiles/scripts/dmenu_power")
    , ("<XF86AudioRaiseVolume>", spawn "~/repos/dotfiles/scripts/volume_control -i 5")
    , ("<XF86AudioLowerVolume>", spawn "~/repos/dotfiles/scripts/volume_control -d 5")
    , ("<XF86AudioMute>", spawn "~/repos/dotfiles/scripts/volume_control -t")
    ]

workspacesConfiguration :: [String]
workspacesConfiguration = ["dev", "www", "chat", "sys", "doc", "mus", "ex1", "ex2"]
