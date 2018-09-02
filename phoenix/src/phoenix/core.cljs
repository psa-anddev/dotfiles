(ns phoenix.core
  (:require [clojure.string :as string]
            [phoenix.notifications :as notifications]
            [phoenix.windows :as windows]
            [phoenix.helpers :as helpers]
            [phoenix.mappings :as mappings]))

;; Set Phoenix configuration
(helpers/set-configuration true false)
;; Show mappings mappings
(helpers/bind "/" ["ctrl"] mappings/current-shortcuts)
;; Window mappings
(helpers/bind "h" ["ctrl" "alt"] mappings/move-to-left-half)
(helpers/bind "l" ["ctrl" "alt"] mappings/move-to-right-half)
(helpers/bind "k" ["ctrl" "alt"] mappings/move-to-top-half)
(helpers/bind "j" ["ctrl" "alt"] mappings/move-to-bottom-half)
(helpers/bind ";" ["ctrl" "alt"] mappings/maximize-active-window)
(helpers/bind "'" ["ctrl" "alt"] mappings/center-active-window)
;; Application mappings
(helpers/bind "o" ["ctrl" "cmd"] (fn [] (helpers/launch-or-focus "qutebrowser")))
(helpers/bind "o" ["ctrl" "cmd" "shift"] (fn [] (helpers/launch-or-focus "Opera")))
(helpers/bind ";" ["ctrl" "cmd"] (fn [] (helpers/launch-or-focus "Thunderbird")))
(helpers/bind "j" ["ctrl" "cmd"] (fn [] (helpers/launch-or-focus "Android Studio")))
(helpers/bind "k" ["ctrl" "cmd"] (fn [] (helpers/launch-or-focus "MacVim")))
(helpers/bind "l" ["ctrl" "cmd"] (fn [] (helpers/launch-or-focus "iTerm" "iTerm2")))
(helpers/bind "h" ["ctrl" "cmd"] (fn [] (helpers/launch-or-focus "Rambox")))
(helpers/bind "j" ["ctrl" "cmd" "shift"] (fn [] (helpers/launch-or-focus "Android Studio 3.3 Preview", "Android Studio")))
(helpers/bind "j" ["ctrl" "cmd" "alt"] (fn [] (helpers/launch-or-focus "Android Studio 3.2 Preview", "Android Studio")))
(helpers/bind "i" ["ctrl" "cmd"] (fn [] (helpers/launch-or-focus "IntelliJ IDEA CE", "IntelliJ IDEA")))

;; Screen mappings
(helpers/bind "l" ["ctrl" "shift"] mappings/move-window-to-next-screen)
(helpers/bind "h" ["ctrl" "shift"] mappings/move-window-to-previous-screen)
(notifications/notify "Configuration loaded")
