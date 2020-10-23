import java.lang.Character;

class Acronym {
    String value = "";
    char[] separators = new char[] {' ', '_', '-'};

    Acronym(String phrase) {
        char[] chars = phrase.toCharArray();
        int charsLength = chars.length;

        for (int i = 0; i < charsLength; i++) {
            if (i == 0 || this.isAcronymLetter(chars[i], chars[i - 1])) {
                this.value += Character.toUpperCase(chars[i]);
            }
        }
    }

    private boolean isSeparator(char c) {
        for (char x : separators) {
            if (x == c) {
                return true;
            }
        }
        return false;
    }

    private boolean isAcronymLetter(char curr, char prev) {
        return Character.isLetter(curr)
            && (this.isSeparator(prev)
            || Character.isUpperCase(curr)
            && Character.isLowerCase(prev));
    }

    String get() {
        return value;
    }
}
