=begin
Write your code for the 'Resistor Color Trio' exercise in this file. Make the tests in
`resistor_color_trio_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/resistor-color-trio` directory.
=end

class ResistorColorTrio
  COLORS = %w[black brown red orange yellow green blue violet grey white]

  def initialize(colors)
    raise ArgumentError unless colors.all? { |color| COLORS.include?(color) }
    @colors = colors
  end

  def label
    label = @colors.first(2).map { |color| COLORS.index(color)}.join.to_i
    zeros = COLORS.index(@colors[2])
    total = label * (10 ** zeros)
    total >= 1000 ? "Resistor value: #{total/1000} kiloohms" : "Resistor value: #{total} ohms"
  end
end
