(ns reverse-string
  (:require [clojure.string :as s]))

(defn reverse-string [str]
  "Reverse a string."
  (s/reverse str))
