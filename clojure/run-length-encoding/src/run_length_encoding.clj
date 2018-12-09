(ns run-length-encoding)

(defn run-length-encode
  "encodes a string with run-length-encoding"
  [s]
  (->> s
       (partition-by identity)
       (map #(let [occurances (count %) char (first %)]
               (if (= 1 occurances)
                 char
                 (str occurances char))))
       (apply str)))

(defn run-length-decode
  "decodes a run-length-encoded string"
  [s]
  (->> s
       (re-seq #"(\d+)?([^\d])")
       (mapcat
        (fn [[_ occurances char]]
          (if (some? occurances)
            (repeat (bigint occurances) char)
            char)))
       (apply str)))
