type NucleotideComplement = "C" | "G" | "A" | "U"

interface NucleotideComplementDictionary {
  readonly [key: string]: NucleotideComplement
}

type NucleotidesToRnaReducer = (rna: string, nucleotide: string) => string

const nucleotideComplements: NucleotideComplementDictionary = {
  G: "C",
  C: "G",
  T: "A",
  A: "U",
}

export function toRna(dnaStrand: string): string {
  const reducer: NucleotidesToRnaReducer = (rna, nucleotide) => {
    const complement = nucleotideComplements[nucleotide]
    if (!complement) {
      throw new TypeError(`Invalid input DNA.`)
    }

    return `${rna}${complement}`
  }

  return dnaStrand.split("").reduce(reducer, "")
}
