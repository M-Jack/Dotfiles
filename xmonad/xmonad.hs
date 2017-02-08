import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Simplest 
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops
import qualified XMonad.StackSet as W
import Data.List ((\\))
import System.IO

-- Workspaces description name.
myWorkspaces = ["web", "mail", "music", "steam", "prog", "video", "7", "8", "games"]

--What to do in each workspace
myLayoutHook = onWorkspace "games" (noBorders Simplest) $ smartBorders $ modWorkspaces (myWorkspaces \\ ["video", "games"]) avoidStruts $ layoutHook defaultConfig

-- Mod P launcher
myLauncher = "$(yeganesh -x -- -fn 'xft:Droid Sans Mono:style=Regular:pixelsize=14' -nb '#002b36' -nf '#657b83' -sb '#073642' -sf '#93a1a1')"

-- Hooks management, do specific stuff with specific windowns
appManageHook = composeAll $ concat [
                           [className =? app --> doShift "web"  | app <- webApp],
                           [className =? app --> doShift "mail" | app <- mailApp],
                           [className =? app --> doShift "music"| app <- musicApp],
                           [className =? app --> doShift "steam"| app <- steamApp],
                           [className =? app --> doShift "prog" | app <- progApp],
                           [className =? app --> doShift "video"| app <- videoApp],
                           [className =? app --> doShift "games"| app <- gamesApp]
                          ]
    where webApp = ["Firefox", "Inox", "Chromium"]
          mailApp = ["Thunderbird"]
          musicApp = ["Spotify"]
          steamApp = ["Steam"]
          progApp = ["Emacs"]
          videoApp = ["vlc"]
          gamesApp = ["ck2", "Civ5XP", "XCOM: Enemy Unknown", "XCOM: Enemy Within", "Race The Sun"]




--Hoping that fullscreen won't mess up... SPOILER: They will...
fullManageHook = composeAll [isFullscreen --> doFloat]


--Additionnal keybidding
myKeys = [ ((myMod .|. shiftMask, xK_z), spawn "xscreensaver-command -lock; xset dpms force off")
         , ((myMod, xK_b ), sendMessage ToggleStruts)
         , ((myMod, xK_n), spawn "touch ~/.pomodoro_session")
	 , ((myMod, xK_p),  spawn myLauncher)
         ]


--Change the mod key
myMod = mod4Mask

--Start up configuration

myStartUp  = do
    spawn "chromium"
    spawn "thunderbird"


main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ ewmh defaultConfig {
                             workspaces = myWorkspaces
                             , handleEventHook = fullscreenEventHook
                             , manageHook = appManageHook <+> fullManageHook <+> manageDocks <+> manageHook defaultConfig
                             , layoutHook = myLayoutHook
                             , logHook = dynamicLogWithPP xmobarPP { -- Stuff for xmobar did not touch
                                                                     ppOutput = hPutStrLn xmproc
                                                                     , ppTitle = xmobarColor "green" "" . shorten 50
                                                                     } <+>     setWMName "LG3D"
                             , modMask = myMod     -- Rebind Mod
                             , terminal = "urxvt"
                             , normalBorderColor = "#000000"
                             , focusedBorderColor = "#444444"
                             , startupHook = myStartUp
                             } `additionalKeys` myKeys
    
