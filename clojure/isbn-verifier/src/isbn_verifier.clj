(ns isbn-verifier)

(defn isbn-digits [isbn]
  {:post [(= 10 (count %))
          (not-any? #(= 10 %) (butlast %))]}
  (->> isbn
       (map #(cond (= \X %) 10
                   (Character/isDigit %) %))
       (remove nil?)))

(defn isbn-sum [digits]
  (->> digits
       (reverse)
       (map-indexed
        (fn [i digit]
          (* (Integer/parseInt (str digit))
             (inc i))))
       (apply +)))

(defn isbn? [isbn]
  (try
    (-> isbn
        (isbn-digits)
        (isbn-sum)
        (mod 11)
        (zero?))
    (catch java.lang.AssertionError e false)))