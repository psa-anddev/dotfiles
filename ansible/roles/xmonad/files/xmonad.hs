import XMonad
import XMonad.Util.SpawnOnce
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig
import XMonad.Layout.NoBorders
import XMonad.Prompt
import XMonad.Prompt.Input
import Text.Printf

main = xmonad =<< statusBar upBar upBarConfiguration upBarToggleStructsKey configuration
startup = do
	spawnOnce "xrdb -merge ~/.Xresources"
	spawnOnce "~/.fehbg"
        spawnOnce "picom"
        spawnOnce "clipmenud"
        spawnOnce "dunst"
        spawnOnce "flameshot"
        spawnOnce "udiskie"
        spawnOnce "tasks_notify"

configuration = ewmh defaultConfig
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
    , ("M-C-p", spawn "dmenu_power")
    , ("M-S-p", spawn "preferences_menu")
    , ("<XF86AudioRaiseVolume>", spawn "volume_control -i 5")
    , ("<XF86AudioLowerVolume>", spawn "volume_control -d 5")
    , ("<XF86AudioMute>", spawn "volume_control -t")
    , ("M-S-b", spawn "qutebrowser")
    , ("M-v", spawn (defaultTerminal ++ " -e nvim"))
    , ("M-c", spawn "rambox")
    , ("M-a", spawn "android-studio")
    , ("M-s", spawn (defaultTerminal ++ " -e newsboat"))
    , ("M-S-s", spawn (defaultTerminal ++ " -e podboat"))
    , ("M-S-v", spawn "vlc")
    , ("M-S-m", spawn "meetings")
    , ("<Print>", spawn "flameshot full -p ~/pictures/screenshots/")
    , ("M-<Print>", spawn "flameshot gui")
    , ("M-C-m", spawn(defaultTerminal ++ " -e neomutt"))
    , ("M-/", spawn "safe_passmenu")
    , ("M-C-a", taskWarriorPrompt promptConfig)
    , ("M-C-v", spawn "clipmenu")
    ]

workspacesConfiguration :: [String]
workspacesConfiguration = ["dev", "www", "chat", "sys", "doc", "mus", "ex1", "ex2"]

-- Layouts
layoutHookConfiguration = Tall 1 (3/100) (1/2) ||| noBorders Full ||| Mirror(Tall 1 (3/100) (1/2))

-- Prompts
myFont :: String
myFont = "xft:SauceCodePro Nerd Font Mono:regular:size=9:antialias=true:hinting=true"

promptConfig:: XPConfig
promptConfig = def
    { font = myFont
    , position = Top
    }

taskWarriorPrompt::XPConfig->X()
taskWarriorPrompt cfg = do
    str <- inputPrompt cfg "New Task: "
    case str of
        Just s  -> spawn $ printf "task add %s" s
        Nothing -> pure ()
