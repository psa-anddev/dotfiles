(ns phoenix.mappings
  (:require [phoenix.windows :as windows]
            [phoenix.screens :as screens]))

(defn move-window-to-next-screen []
  "Moves the active window to the screen after the one the window is in"
  (windows/move-to-screen (windows/get-active)
                          (screens/get-next (.screen (windows/get-active)))))

(defn move-window-to-previous-screen []
  "Moves the active window to the screen before the one the window is in"
  (windows/move-to-screen (windows/get-active)
                          (screens/get-previous (.screen (windows/get-active)))))
