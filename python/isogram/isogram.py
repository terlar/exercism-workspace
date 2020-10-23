"""Isogram functions."""


def is_isogram(string):
    """Return a boolean based on string being phrase or isogram."""
    seen = set()
    for char in string.lower():
        if not char.isalpha():
            continue
        elif char in seen:
            return False
        else:
            seen.add(char)
    return True
