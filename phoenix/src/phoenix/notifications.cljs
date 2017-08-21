(ns phoenix.notifications
  (:require [clojure.string :as string]))


(defn notify [^String message]
  "Displays a notification using the Notification center."
  (.notify js/Phoenix message))
