(ns say)

(defn digit [digit]
  (cond (= digit 1) "one"
        (= digit 2) "two"
        (= digit 3) "three"
        (= digit 4) "four"
        (= digit 5) "five"
        (= digit 6) "six"
        (= digit 7) "seven"
        (= digit 8) "eight"
        (= digit 9) "nine"))

(defn number [num]
  (cond
    (or (< num 0)
        (> num 999999999999)) (throw (IllegalArgumentException.
                                      "num must be a number from 0 to 999,999,999,999"))
    (= num 0) "zero"
    (<= 9) (digit num)
    (= num 10) "ten"
    (= num 11) "eleven"
    (= num 12) "twelve"
    (= num 13) "thirteen"
    (= num 14) "fourteen"
    (= num 15) "fifteen"
    (= num 16) "sixteen"
    (= num 17) "seventeen"
    (= num 18) "eighteen"
    (= num 19) "nineteen"
    (= num 20) "twenty"
    (= num 30) "thirty"
    (= num 40) "fourty"
    (= num 50) "fifty"
    (= num 60) "sixty"
    (= num 70) "seventy"
    (= num 80) "eighty"
    (= num 90) "ninety"
    :else num))
