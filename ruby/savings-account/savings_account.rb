module SavingsAccount
  NEGATIVE_BALANCE_INTEREST_RATE = -3.213
  LOW_POSITIVE_BALANCE_INTEREST_RATE = 0.5
  MEDIUM_POSITIVE_BALANCE_INTEREST_RATE = 1.621
  HIGH_POSITIVE_BALANCE_INTEREST_RATE = 2.475


  def self.interest_rate(balance)
    case balance
    when proc { |n| n < 0 }
      NEGATIVE_BALANCE_INTEREST_RATE
    when 0...1000
      LOW_POSITIVE_BALANCE_INTEREST_RATE
    when 1000...5000
      MEDIUM_POSITIVE_BALANCE_INTEREST_RATE
    else
      HIGH_POSITIVE_BALANCE_INTEREST_RATE
    end
  end

  def self.annual_balance_update(balance)
    balance + (balance.abs * interest_rate(balance) / 100)
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0
    while current_balance < desired_balance
      current_balance = annual_balance_update(current_balance)
      years += 1
    end
    years
  end
end
