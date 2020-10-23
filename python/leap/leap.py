"""Leap year functions."""


def leap_year(year):
    """Return a boolean determining leap year."""
    if year % 4 == 0:
        return not (year % 100 == 0) or (year % 400 == 0)
    else:
        return False
