type NucleotideComplement = "C" | "G" | "A" | "U"

interface NucleotideComplementDictionary {
  [key: string]: NucleotideComplement
}

const nucleotideComplements: NucleotideComplementDictionary = {
  G: "C",
  C: "G",
  T: "A",
  A: "U"
}

function lookupNucleotideComplement(nucleotide: string): NucleotideComplement {
  const complement = nucleotideComplements[nucleotide]

  if (!complement) {
    throw new Error("Invalid input DNA.")
  }

  return complement
}

class Transcriptor {
  toRna(dnaStrand: string): string {
    return dnaStrand
      .split("")
      .map(lookupNucleotideComplement)
      .join("")
  }
}

export default Transcriptor
