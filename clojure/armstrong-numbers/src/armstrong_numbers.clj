(ns armstrong-numbers)

(defn digits [num]
  (->> num str (map (comp read-string str))))

(defn exp [x num]
  (reduce * (repeat num x)))

(defn exp-digits [num]
  (let [digits (digits num)
		count  (count digits)]
	(map (fn [digit] (exp digit count))
		 digits)))

(defn armstrong? [num]
  (->> (exp-digits num)
	   (reduce +)
           (= num)))
