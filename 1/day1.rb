### Day 1: Day 1: Trebuchet?! ###

### Part A ###
input = []

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    input << line
  end
end

number_regex = /[0-9]+/

solutionA = []

input.each do |line|
  numbers_in_line = line.chars.filter { _1.match(number_regex) }

  solutionA << (numbers_in_line.first + numbers_in_line.last).to_i
end

puts "The solution to part 1A is: #{solutionA.reduce(:+)}"


### Part B ###

solutionB = []

digit_lookup = {
  "one" => "1",
  "two" => "2",
  "three" => "3",
  "four" => "4",
  "five" => "5",
  "six" => "6",
  "seven" => "7",
  "eight" => "8",
  "nine" => "9",
  "1" => "1",
  "2" => "2",
  "3" => "3",
  "4" => "4",
  "5" => "5",
  "6" => "6",
  "7" => "7",
  "8" => "8",
  "9" => "9",
  "0" => "0",
}

words = digit_lookup.keys
r_words = words.map(&:reverse)


result = input.each.map do |line|
  digits = line.match(/(#{words.join("|")})/, 0)
  first = digit_lookup[digits[0]]

  digits = line.reverse.match(/(#{r_words.join("|")})/, 0)
  last = digit_lookup[digits[0].reverse]
  (first + last).to_i
end

puts "The solution to part 1B is: #{result.reduce(:+)}" 