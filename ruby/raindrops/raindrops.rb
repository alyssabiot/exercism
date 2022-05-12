=begin
Write your code for the 'Raindrops' exercise in this file. Make the tests in
`raindrops_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/raindrops` directory.
=end

class Raindrops
  CONVERSION = {3 => 'Pling', 5 => 'Plang', 7 => 'Plong'}

  def self.convert(number)
    song = ''
    CONVERSION.each { |num, sound| song+= sound if number%num == 0 }
    song.empty? ? number.to_s : song
  end
end
