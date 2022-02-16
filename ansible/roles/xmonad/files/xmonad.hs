import XMonad
import XMonad.Util.SpawnOnce
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Layout.NoBorders
import XMonad.Layout.ShowWName
import XMonad.Prompt
import XMonad.Prompt.Input
import Text.Printf

-- Theme --
colorBackground = "#282a36"
colorCurrentLine = "#44475a"
colorComment = "#6272a4"
colorForeground = "#f8f8f2"
colorCyan = "#8be9fd"
colorGreen = "#50fa7b"
colorOrange = "#ffb86c"
colorPink = "#ff79c6"
colorPurple = "#bd93f9"
colorRed = "#ff5555"
colorYellow = "#f1fa8c"


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
    spawnOnce "vdirsyncer sync"

configuration = ewmh def
    { terminal = defaultTerminal
    , modMask = mod4Mask
    , borderWidth = 3
    , normalBorderColor = colorCurrentLine
    , focusedBorderColor = colorOrange
    , startupHook = startup
    , workspaces = workspacesConfiguration
    , layoutHook = layoutHookConfiguration
    } `additionalKeysP` myShortcuts

upBar = "xmobar"
upBarConfiguration = xmobarPP { 
    ppCurrent = xmobarColor colorGreen "" . wrap ("<box type=Bottom width=2 mb=2 color=" ++ colorGreen ++ ">") "</box>"
    ,ppVisible = xmobarColor colorGreen "" 
    ,ppHidden = xmobarColor colorComment "" 
    ,ppHiddenNoWindows = xmobarColor colorYellow ""
    ,ppUrgent = xmobarColor colorRed "" . wrap "¡" "!"
    ,ppTitle = xmobarColor colorOrange "" . shorten 60
    ,ppSep = "<fc=" ++ colorForeground ++ "> | </fc>"
    ,ppOrder = \(ws:l:t:ex) -> [ws, l] ++ [t] ++ ex
}
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
    , ("M-s", spawn (defaultTerminal ++ " -e newsboat"))
    , ("M-S-s", spawn (defaultTerminal ++ " -e podboat"))
    , ("M-S-v", spawn "vlc")
    , ("M-S-m", spawn "meetings")
    , ("<Print>", spawn "flameshot full -p ~/pictures/screenshots/")
    , ("M-<Print>", spawn "flameshot gui")
    , ("M-/", spawn "safe_passmenu")
    , ("M-C-v", spawn "clipmenu")
    , ("M-t p b", spawn "touch ~/.cache/pomodoro_session")
    , ("M-t p e", spawn "rm ~/.cache/pomodoro_session")
    , ("M-t p g", spawn "echo '5 1' > ~/.cache/pomodoro_session")
    , ("M-t t a", taskWarriorPrompt promptConfig)
    , ("M-c s", spawn "signal-desktop")
    , ("M-c e", spawn "element-desktop")
    , ("M-c m", spawn(defaultTerminal ++ " -e neomutt"))
    , ("M-c t", spawn(defaultTerminal ++ " -e tg"))
    ]

workspacesConfiguration :: [String]
workspacesConfiguration = ["dev", "www", "chat", "sys", "doc", "mus", "ex1", "ex2"]

-- Layouts
tall = Tall 1 (3/100) (1/2)
full = noBorders Full
mirrorTall = Mirror tall
layoutHookConfiguration = showWName' windowNameConfiguration defaultLayouts
    where
        defaultLayouts = tall ||| full ||| mirrorTall

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
        Just s  -> spawn $ printf "task add %s && task sync" s
        Nothing -> pure ()

-- Show workspace name configuration
windowNameConfiguration :: SWNConfig
windowNameConfiguration = def
    { swn_font = "xft:SauceCodePro Nerd Font Mono:bold:size=60:antialias=true:hinting=true"
    , swn_bgcolor = colorBackground
    , swn_color = colorForeground
    }
