object Leap {
  def leapYear(year: Int): Boolean = {
    var divisibleBy = (x: Int) => year % x == 0

    if (divisibleBy(400)) true
    else if (divisibleBy(100)) false
    else if (divisibleBy(4)) true
    else false
  }
}
