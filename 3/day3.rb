example = [
  "467$..114..",
  "...*......",
  "..35..633.",
  "......#...",
  "617*......",
  ".....+.58.",
  "..592.....",
  "......755.",
  "...$.*....",
  ".664.598.."
]

# We could split each line into an array of characters, and use the index
# to each if each number is adjacent to a special character either on index +1
# index -1, next line index, next line index +1, next line index -1, and
# previous line index, previous line index +1, previous line index -1

example.each_with_index do |line, index|
  next unless index == 0


  # [0, 1, 2, 4, 5, 6]
  digit_indexes = line.chars.map.with_index { |char, index| index if char.match(/[0-9]/) }.filter { _1 != nil }

  # [[0, 1, 2], [4, 5, 6]]
  clustered_digit_indexes = digit_indexes.chunk_while { |i, j| i + 1 == j }.to_a

  clustered_digit_indexes.each do |number_group|
    # [0, 1, 2]
    @valid = false

    number_group.each do |number_index|
      if !line[number_index] == 0 && line[number_index - 1].match(/[^a-zA-Z0-9|.]/)
        @valid = true
        puts "number before #{line[number_index]} is #{line[number_index - 1].to_s}"
      end

      puts "#{!(line[number_index + 1].match(/[^a-zA-Z0-9|.]/))} + #{line[number_index]}"

      if !(line[number_index + 1].scan(/[^a-zA-Z0-9|.]/).empty?)
        @valid = true
        puts "number after #{line[number_index]} is #{line[number_index + 1].to_s}"
      end

      # puts example[index + 1].inspect

      # if (example[index + 1][number_index + 1] || example[index - 1][number_index - 1]).match(/[^a-zA-Z0-9|.]/)
      #   @valid = true
      # end

      # skip if we're at the last line
      # next if index == example.length - 1
      # puts index.inspect + "" + line.inspect
      # # line above
      # if (example[index + 1][number_index]).match(/[^a-zA-Z0-9|.]/)
      #   @valid = true
      # end

      # if (example[index + 1][number_index + 1] || example[index + 1][number_index - 1]).match(/[^a-zA-Z0-9|.]/)
      #   @valid = true
      # end

    end

    # if @valid
    #   # print out the actual line numbers corresponding to the indexes if they're valid
    #   puts "Number group #{number_group} is valid"
    # else
    #   puts "Number group #{number_group} is invalid"
    # end
  end
end
