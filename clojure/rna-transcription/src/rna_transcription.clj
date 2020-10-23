(ns rna-transcription)

(def nucleotide-complements
  (hash-map \G \C
            \C \G
            \T \A
            \A \U))

(defn get-nucleotide-complement
  "Return complement for nucleotide."
  [nucleotide]
  {:post [(some? %)]}
  (nucleotide-complements nucleotide))

(defn to-rna
  "Return RNA complement for DNA strand."
  [dna-strand]
  (apply str (map get-nucleotide-complement dna-strand)))