object Bob {
  def response(statement: String): String =
    (isAsking(statement), isShouting(statement), isSilent(statement)) match {
      case (false, false, true) => "Fine. Be that way!"
      case (false, true, false) => "Whoa, chill out!"
      case (true, false, false) => "Sure."
      case (true, true, false) => "Calm down, I know what I'm doing!"
      case _ => "Whatever."
    }

  private def isAsking(statement: String): Boolean = statement.trim.endsWith("?")
  private def isShouting(statement: String): Boolean =
    statement.exists(_.isLetter) && statement == statement.toUpperCase
  private def isSilent(statement: String): Boolean = statement.trim.isEmpty
}
