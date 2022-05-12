=begin
Write your code for the 'Grep' exercise in this file. Make the tests in
`grep_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/grep` directory.
=end

class Grep
  def self.grep(pattern, flags, files)
    files_count = files.count
    full_pattern = get_full_pattern(pattern, flags)
    result = []

    files.each do |file|
      File.readlines(file).each_with_index do |line, idx|
        line = line.strip
        result << get_return_message(files_count, file, line, idx, flags) if self.match?(line, full_pattern, flags)
      end
    end

    result.uniq.join("\n")
  end

  def self.get_full_pattern(pattern, flags)
    case_insensitive = flags.include?("-i")
    full_line = flags.include?("-x")

    pattern_content = full_line ? "^#{pattern}$" : pattern
    case_insensitive ? /#{pattern_content}/i : /#{pattern_content}/
  end

  def self.get_return_message(files_count, file, line, idx, flags)
    line_number = flags.include?("-n")
    filename = flags.include?("-l")

    return file if filename

    if files_count > 1
      line_number ? "#{file}:#{idx + 1}:#{line}" : "#{file}:#{line}"
    else
      line_number ? "#{idx + 1}:#{line}" : line
    end
  end

  def self.match?(line, full_pattern, flags)
    inverted_match = flags.include?("-v")
    inverted_match ? line !~ full_pattern : line =~ full_pattern
  end
end
