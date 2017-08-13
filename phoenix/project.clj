(defproject phoenix "0.1.0-SNAPSHOT"
  :description "My Phoenix configuration"
  :dependencies [[org.clojure/clojure "1.8.0"]
                 [org.clojure/clojurescript "1.9.521"]]

  :plugins [[lein-cljsbuild "1.1.7"]]
  
  :cljsbuild { :builds [{:source-paths ["src"]
                         :compiler {:output-to "build/phoenix.js"
                                    :optimizations :simple
                                    :pretty-print true
                                    :externs ["phoenix-bindings.js"]}}]})
