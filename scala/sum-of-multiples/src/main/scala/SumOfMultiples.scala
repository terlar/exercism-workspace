object SumOfMultiples {
  def sum(factors: Set[Int], limit: Int): Int =
    factors.size match {
      case 0 => 0
      case _ =>
        (factors.min until limit)
          .filter(n => factors.exists(n % _ == 0))
          .sum
    }
}