(ns phoenix.core
  (:require [clojure.string :as string]))

;; Helper functions
(defn notify [^String message]
  "Displays a notification using the Notification center."
  (.notify js/Phoenix message))

(defn bind [key modifiers callback]
  "Binds a shortcut to an action"
  (.on js/Key key (clj->js modifiers) callback))

(defn set-configuration [open-at-login daemon]
  "Sets the Phoenix configuration"
  (.set js/Phoenix #js {:openAtLogin open-at-login
                     :daemon daemon}))

(defn alert [& message]
  "Shows a message in a dialog"
  (let [modal (js/Modal.)
        main-screen-rect (.flippedVisibleFrame (.main js/Screen))]
    (set! (.-origin modal) #js {:x (/ (.-width main-screen-rect) 2)
                                :y (/ (.-height main-screen-rect) 2)})
    (set! (.-message modal) (string/join " " message))
    (set! (.-duration modal) 2)
    (.show modal)))

(defn launch-or-focus [app]
  "Launches an app when it is not started or focus it if it is already launched."
  (if (.get js/App app)
    (.focus (.get js/App app))
    (.launch js/App app)))

;; Mapping functions
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

;; Set Phoenix configuration
(set-configuration true false)
;; Show mappings mappings
(bind "/" ["ctrl"] current-shortcuts)
;; Window mappings
(bind "h" ["ctrl" "alt"] move-to-left-half)
(bind "l" ["ctrl" "alt"] move-to-right-half)
(bind "k" ["ctrl" "alt"] move-to-top-half)
(bind "j" ["ctrl" "alt"] move-to-bottom-half)
;; Application mappings
(bind "o" ["ctrl" "cmd"] (partial launch-or-focus "Opera"))
(bind ";" ["ctrl" "cmd"] (partial launch-or-focus "Thunderbird"))
(bind "j" ["ctrl" "cmd"] (partial launch-or-focus "Android Studio"))
(bind "k" ["ctrl" "cmd"] (partial launch-or-focus "MacVim"))
(bind "l" ["ctrl" "cmd"] (partial launch-or-focus "iTerm2"))
(bind "h" ["ctrl" "cmd"] (partial launch-or-focus "Franz"))
(notify "Configuration loaded")
