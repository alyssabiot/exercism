=begin
Write your code for the 'Hamming' exercise in this file. Make the tests in
`hamming_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/hamming` directory.
=end

class Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError if strand1.length != strand2.length
    strand1.length.times.count { |i| strand1[i] != strand2[i] }
  end
end
