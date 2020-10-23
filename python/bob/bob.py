def is_silent(phrase):
    return not phrase.strip()


def is_shouting(phrase):
    return phrase.isupper()


def is_asking(phrase):
    return phrase.strip().endswith("?")


def response(phrase):
    """
    Bob responds to your phrase.
    """
    if is_silent(phrase):
        return "Fine. Be that way!"
    elif is_shouting(phrase) and is_asking(phrase):
        return "Calm down, I know what I'm doing!"
    elif is_shouting(phrase):
        return "Whoa, chill out!"
    elif is_asking(phrase):
        return "Sure."
    else:
        return "Whatever."
