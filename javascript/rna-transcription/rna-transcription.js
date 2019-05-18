const nucleotideComplements = {
  G: 'C',
  C: 'G',
  T: 'A',
  A: 'U',
};

function lookupNucleotideComplement(nucleotide) {
  const complement = nucleotideComplements[nucleotide];
  if (!complement) {
    throw new Error('Invalid input DNA.');
  }

  return complement;
}

function toRna(dnaStrand) {
  return dnaStrand
    .split('')
    .map(lookupNucleotideComplement)
    .join('');
}

module.exports = { toRna };
