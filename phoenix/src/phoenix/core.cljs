(ns phoenix.core
  (:require [clojure.string :as string]))

(defn notify [^String message]
  "Displays a notification using the Notification center."
  (.notify js/Phoenix message))

(defn bind [key modifiers callback]
  "Binds a shortcut to an action"
  (.on js/Key key (clj->js modifiers) callback))

(defn alert [& message]
  "Shows a message in a dialog"
  (let [modal (js/Modal.)
        main-screen-rect (.flippedVisibleFrame (.main js/Screen))]
    (set! (.-origin modal) #js {:x (/ (.-width main-screen-rect) 2)
                                :y (/ (.-height main-screen-rect) 2)})
    (set! (.-message modal) (string/join " " message))
    (set! (.-duration modal) 2)
    (.show modal)))

(defn current-shortcuts []
  "Shows a dialog with the current shortcuts"
  (alert "Current shortcuts" "\nWindow movement\t\t\t\tApplications" "\nCtrl+/\t Shows this modal"))

(defn half-screen-width [window screen-frame]
  "Calculates the left half of the screen for a given window in a given screen frame"
  (/ (- (.-width screen-frame)
        (.-x screen-frame))
     2))

(defn move-to-left-half []
  "Move a window to the left half of the screen"
  (when-let [window (.focused js/Window)]
    (let [screen-frame (.flippedVisibleFrame (.screen window))]
      (.setFrame window #js {:x (.-x screen-frame)
                             :y (.-y screen-frame)
                             :width (half-screen-width window screen-frame)
                             :height (.-height screen-frame)}))))
(defn move-to-right-half []
  (when-let [window (.focused js/Window)]
    (let [screen-frame (.flippedVisibleFrame (.screen window))]
      (.setFrame window #js {:x (+ (.-x screen-frame) (half-screen-width window screen-frame))
                             :y (.-y screen-frame)
                             :width (half-screen-width window screen-frame)
                             :height (.-height screen-frame)}))))
(defn move-to-top-half []
  (when-let [window (.focused js/Window)]
    (let [screen-frame (.flippedVisibleFrame (.screen window))]
      (.setFrame window #js {:x (.-x screen-frame)
                             :y (.-y screen-frame)
                             :width (.-width screen-frame)
                             :height (/ (.-height screen-frame) 2)}))))

(defn move-to-bottom-half []
  (when-let [window (.focused js/Window)]
    (let [screen-frame (.flippedVisibleFrame (.screen window))]
      (.setFrame window #js {:x (.-x screen-frame)
                             :y (- (+ (.-y screen-frame)
                                      (.-height screen-frame)) 
                                   (/ (.-height screen-frame) 2))
                             :width (.-width screen-frame)
                             :height (/ (.-height screen-frame) 2)}))))

(bind "/" ["ctrl"] current-shortcuts)
(bind "h" ["ctrl" "alt"] move-to-left-half)
(bind "l" ["ctrl" "alt"] move-to-right-half)
(bind "k" ["ctrl" "alt"] move-to-top-half)
(bind "j" ["ctrl" "alt"] move-to-bottom-half)
