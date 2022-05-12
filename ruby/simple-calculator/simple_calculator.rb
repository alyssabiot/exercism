class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < ArgumentError
  end

  def self.calculate(first_operand, second_operand, operation)
    raise SimpleCalculator::UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)
    raise ArgumentError unless first_operand.is_a?(Integer) && second_operand.is_a?(Integer)

    calc = "#{first_operand} #{operation} #{second_operand}"
    "#{calc} = #{eval(calc)}"

  rescue ZeroDivisionError
    "Division by zero is not allowed."
  end
end
