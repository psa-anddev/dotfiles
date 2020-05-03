import XMonad
import XMonad.Util.SpawnOnce
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import XMonad.Layout.NoBorders

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
        , layoutHook = layoutHookConfiguration
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
    , ("M-S-b", spawn "qutebrowser")
    , ("M-v", spawn (defaultTerminal ++ " -e nvim"))
    , ("M-c", spawn "rambox")
    , ("M-a", spawn "android-studio")
    , ("M-s", spawn (defaultTerminal ++ " -e newsboat"))
    , ("M-S-s", spawn (defaultTerminal ++ " -e podboat"))
    , ("M-S-v", spawn "vlc")
    , ("M-S-m", spawn "~/repos/dotfiles/scripts/meetings")
    ]

workspacesConfiguration :: [String]
workspacesConfiguration = ["dev", "www", "chat", "sys", "doc", "mus", "ex1", "ex2"]

-- Layouts
layoutHookConfiguration = Tall 1 (3/100) (1/2) ||| noBorders Full ||| Mirror(Tall 1 (3/100) (1/2))
