(ns phoenix.helpers)

(defn get-center-coordinate [sc window-size screen-size]
  (+ (/ (- screen-size window-size) 2) sc))

(defn bind [key modifiers callback]
  "Binds a shortcut to an action"
  (.on js/Key key (clj->js modifiers) callback))

(defn set-configuration [open-at-login daemon]
  "Sets the Phoenix configuration"
  (.set js/Phoenix #js {:openAtLogin open-at-login
                     :daemon daemon}))

(defn launch-or-focus
  "Launches an app when it is not started or focus it if it is already launched."
  ([app] (launch-or-focus app app))
  ([dockName activeName] (if (.get js/App activeName)
                           (.focus (.get js/App activeName))
                           (.launch js/App dockName))))



