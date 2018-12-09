(ns bob
  (:require [clojure.string :as str]))

(defn asking? [input]
  "INPUT is determined to be asking."
  (str/ends-with? input "?"))

(defn shouting? [input]
  "INPUT is determined to be shouting."
  (cond
    (not-any? #(Character/isLetter %) input) false
    :else (= input (str/upper-case input))))

(defn silent? [input]
  "INPUT is determined to be silent."
  (str/blank? input))

(defn response-for [input]
  "Bob's response to INPUT."
  (cond
    (shouting? input) "Whoa, chill out!"
    (asking? input) "Sure."
    (silent? input) "Fine. Be that way!"
    :else "Whatever."))
