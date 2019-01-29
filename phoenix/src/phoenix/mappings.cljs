(ns phoenix.mappings
  (:require [phoenix.windows :as windows]
            [phoenix.screens :as screens]))

(defn move-window-to-next-screen []
  "Moves the active window to the screen after the one the window is in"
  (windows/move-to-screen (windows/get-active)
                          (.next (.screen (windows/get-active)))))

(defn move-window-to-previous-screen []
  "Moves the active window to the screen before the one the window is in"
  (windows/move-to-screen (windows/get-active)
                          (.previous (.screen (windows/get-active)))))

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
