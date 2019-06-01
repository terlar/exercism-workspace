const nucleotideComplements = {
  G: "C",
  C: "G",
  T: "A",
  A: "U"
};

function toRna(dnaStrand) {
  return dnaStrand.split("").reduce((rna, nucleotide) => {
    if (nucleotide in nucleotideComplements === false) {
      throw new Error(`Invalid DNA strand: dnaStrand=${dnaStrand}`);
    }

    return `${rna}${nucleotideComplements[nucleotide]}`;
  }, "");
}

module.exports = { toRna };
