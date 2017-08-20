(ns phoenix.windows
  (:require [clojure.string :as string]
            [phoenix.helpers :as helpers]))

(defn alert [& message]
  "Shows a message in a dialog"
  (let [modal (js/Modal.)
        main-screen-rect (.flippedVisibleFrame (.main js/Screen))]
    (set! (.-origin modal) #js {:x (/ (.-width main-screen-rect) 2)
                                :y (/ (.-height main-screen-rect) 2)})
    (set! (.-message modal) (string/join " " message))
    (set! (.-duration modal) 2)
    (.show modal)))

(defn move-and-resize-window [window x y width height]
  "Moves the window to the given x and y coordinates and resizes it to the given width and height."
  (.setFrame window #js {:x x
                         :y y
                         :width width
                         :height height}))

(defn move-window [window x y]
  "Moves a window to the given position"
  (move-and-resize-window window x y 
                          (.-width (.size window)) 
                          (.-height (.size window))))


(defn maximize [window]
  "Maximizes the given window."
  (.maximize window))

(defn center [window]
  "Centers the given window in its current screen"
  (let [frame (.flippedVisibleFrame (.screen window))]
    (move-window window
                 (helpers/get-center-coordinate (.-x frame)
                                                (.-width (.size window))
                                                (.-width frame))
                 (helpers/get-center-coordinate (.-y frame)
                                                (.-height (.size window))
                                                (.-height frame)))))

(defn move-to-screen [window screen]
  "Moves the given window to the given screen"
  (let [frame (.flippedVisibleFrame screen)]
    (move-window window (.-x frame) (.-y frame))))

(defn get-active []
  "Returns the active Window"
  (.focused js/Window))
