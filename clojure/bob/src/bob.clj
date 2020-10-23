(ns bob
  (:require [clojure.string :as str]))

(defn question? [input]
  "INPUT is determined to be a question."
  (str/ends-with? input "?"))

(defn yelling? [input]
  "INPUT is determined to be yelling."
  (cond
    (not-any? #(Character/isLetter %) input) false
    :else (= input (str/upper-case input))))

(defn yelling-question? [input]
  "INPUT is determined to be yelling a question."
  ((every-pred yelling? question?) input))

(defn silent? [input]
  "INPUT is determined to be silent."
  (str/blank? input))

(defn response-for [input]
  "Bob's response to INPUT."
  (condp apply [(str/trim input)]
    yelling-question? "Calm down, I know what I'm doing!"
    question? "Sure."
    yelling? "Whoa, chill out!"
    silent? "Fine. Be that way!"
    "Whatever."))
