type NucleotideComplement = "C" | "G" | "A" | "U"

interface NucleotideComplementDictionary {
  readonly [key: string]: NucleotideComplement
}

type NucleotidesToRnaReducer = (rna: string, nucleotide: string) => string

const nucleotideComplements: NucleotideComplementDictionary = {
  G: "C",
  C: "G",
  T: "A",
  A: "U"
}

class Transcriptor {
  toRna(dnaStrand: string): string {
    const reducer: NucleotidesToRnaReducer = (rna, nucleotide) => {
      const complement = nucleotideComplements[nucleotide]
      if (!complement) {
        throw new TypeError(`Invalid DNA strand: dnaStrand=${dnaStrand}`)
      }

      return `${rna}${complement}`
    }

    return dnaStrand.split("").reduce(reducer, "")
  }
}

export default Transcriptor
