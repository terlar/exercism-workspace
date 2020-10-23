import java.util.*;

class RnaTranscription {

    private static final Map<Character, Character> nucleotideComplements;
    static {
        Map<Character, Character> map = new HashMap<>();
        map.put('C', 'G');
        map.put('G', 'C');
        map.put('T', 'A');
        map.put('A', 'U');
        nucleotideComplements = Collections.unmodifiableMap(map);
    }

    String transcribe(String dnaStrand) {
        String rnaTranscription = "";

        char[] nucleotides = dnaStrand.toCharArray();
        for (char nucleotide : nucleotides) {
            rnaTranscription += nucleotideComplements.get(nucleotide);
        }

        return rnaTranscription;
    }

}