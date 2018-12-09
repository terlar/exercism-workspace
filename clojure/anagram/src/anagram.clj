(ns anagram
  (:require [clojure.string :as str]))

(defn anagram-of? [a b]
  (let [a (str/lower-case a)
        b (str/lower-case b)]
    (if (= a b)
      false
      (= (sort a) (sort b)))))

(defn anagrams-for [word list]
  (filter #(anagram-of? % word) list))
