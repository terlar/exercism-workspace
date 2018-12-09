(ns word-count
  (:require [clojure.string :as str]))

(defn word-count [phrase]
  (-> phrase
      (str/lower-case)
      (str/replace #"\W" " ")
      (str/split #"\s+")
      (frequencies)))
