(ns phoenix.screens
  (:require [phoenix.windows :as windows]))

(defn find-next-screen [screen screens]
  (cond
    (<= (count screens) 1) screen
    (= (first screens) (cycle screen)) (first (next (cycle screens)))
    :else (find-next-screen [screen (next screens)])))

(defn find-previous-screen [screen screens]
  (cond
    (<= (count screens) 1) screen
    (= (first (next (cycle screens))) screen) (first (cycle screen))
    :else (find-previous-screen screen (next screens))))

(defn get-all []
  "Returns all the screens in the system."
  (.all js/Screen))

(defn get-next [screen]
  "Returns the next screen to the one provided"
  (find-next-screen screen (get-all)))

(defn get-previous [screen]
  (find-previous-screen screen (get-all)))

