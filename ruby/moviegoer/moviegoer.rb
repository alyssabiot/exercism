# This is a custom exception that you can use in your code
class NotMovieClubMemberError < RuntimeError
end

class Moviegoer
  attr_reader :age, :member

  FULL_PRICE = 15
  REDUCED_PRICE = 10
  OLD_AGE = 60
  YOUNG_AGE = 18

  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price
    @age >= OLD_AGE ? REDUCED_PRICE : FULL_PRICE
  end

  def watch_scary_movie?
    @age >= YOUNG_AGE ? true : false
  end

  # Popcorn is 🍿
  def claim_free_popcorn!
    raise NotMovieClubMemberError unless @member
    "🍿"
  end
end
