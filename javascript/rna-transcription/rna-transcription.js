const nucleotideComplements = {
  G: "C",
  C: "G",
  T: "A",
  A: "U"
};

export function toRna(dnaStrand) {
  return dnaStrand.split("").reduce((rna, nucleotide) => {
    if (nucleotide in nucleotideComplements === false) {
      throw new Error(`Invalid DNA strand: dnaStrand=${dnaStrand}`);
    }

    return `${rna}${nucleotideComplements[nucleotide]}`;
  }, "");
}
