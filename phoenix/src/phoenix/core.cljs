(ns phoenix.core
  (:require [clojure.string :as string]
            [phoenix.notifications :as notifications]
            [phoenix.windows :as windows]
            [phoenix.helpers :as helpers]
            [phoenix.mappings :as mappings]))

;; Mapping functions
(defn current-shortcuts []
  "Shows a dialog with the current shortcuts"
  (windows/alert "Current shortcuts" "\nWindow movement\t\t\t\tApplications" "\nCtrl+/\t Shows this modal"))

(defn half-screen-width [window screen-frame]
  "Calculates the left half of the screen for a given window in a given screen frame"
  (/ (- (.-width screen-frame)
        (.-x screen-frame))
     2))

(defn move-to-left-half []
  "Move and resizes the currently active window to extend to the left half of the screen"
  (when-let [window (windows/get-active)]
    (let [screen-frame (.flippedVisibleFrame (.screen window))]
      (windows/move-and-resize-window window 
                              (.-x screen-frame)
                              (.-y screen-frame)
                              (half-screen-width window screen-frame)
                              (.-height screen-frame)))))

(defn move-to-right-half []
  "Moves and resizes the active window to extend to the right half of the screen"
  (when-let [window (windows/get-active)]
    (let [screen-frame (.flippedVisibleFrame (.screen window))]
      (windows/move-and-resize-window window
                              (+ (.-x screen-frame) (half-screen-width window screen-frame))
                              (.-y screen-frame)
                              (half-screen-width window screen-frame)
                              (.-height screen-frame)))))
(defn move-to-top-half []
  "Moves and resizes the currently active window to extend to the top half of the screen."
  (when-let [window (windows/get-active)]
    (let [screen-frame (.flippedVisibleFrame (.screen window))]
      (windows/move-and-resize-window window 
                              (.-x screen-frame)
                              (.-y screen-frame)
                              (.-width screen-frame)
                              (/ (.-height screen-frame) 2)))))

(defn move-to-bottom-half []
  "Moves and resizes the currently active window to extend to the bottom half of the screen."
  (when-let [window (windows/get-active)]
    (let [screen-frame (.flippedVisibleFrame (.screen window))]
      (windows/move-and-resize-window window
                              (.-x screen-frame)
                              (- (+ (.-y screen-frame)
                                    (.-height screen-frame))
                                 (/ (.-height screen-frame) 2))
                              (.-width screen-frame)
                              (/ (.-height screen-frame) 2)))))

(defn maximize-active-window []
  "Maximizes the active Window"
  (windows/maximize (windows/get-active)))

(defn center-active-window []
  "Centers the active window in the screen the window is in."
  (windows/center (windows/get-active)))

;; Set Phoenix configuration
(helpers/set-configuration true false)
;; Show mappings mappings
(helpers/bind "/" ["ctrl"] current-shortcuts)
;; Window mappings
(helpers/bind "h" ["ctrl" "alt"] move-to-left-half)
(helpers/bind "l" ["ctrl" "alt"] move-to-right-half)
(helpers/bind "k" ["ctrl" "alt"] move-to-top-half)
(helpers/bind "j" ["ctrl" "alt"] move-to-bottom-half)
(helpers/bind ";" ["ctrl" "alt"] maximize-active-window)
(helpers/bind "'" ["ctrl" "alt"] center-active-window)
;; Application mappings
(helpers/bind "o" ["ctrl" "cmd"] (fn [] (helpers/launch-or-focus "Opera")))
(helpers/bind ";" ["ctrl" "cmd"] (fn [] (helpers/launch-or-focus "Thunderbird")))
(helpers/bind "j" ["ctrl" "cmd"] (fn [] (helpers/launch-or-focus "Android Studio")))
(helpers/bind "k" ["ctrl" "cmd"] (fn [] (helpers/launch-or-focus "MacVim")))
(helpers/bind "l" ["ctrl" "cmd"] (fn [] (helpers/launch-or-focus "iTerm" "iTerm2")))
(helpers/bind "h" ["ctrl" "cmd"] (fn [] (helpers/launch-or-focus "Franz")))

;; Screen mappings
(helpers/bind "l" ["ctrl" "shift"] mappings/move-window-to-next-screen)
(helpers/bind "h" ["ctrl" "shift"] mappings/move-window-to-previous-screen)
(notifications/notify "Configuration loaded")
