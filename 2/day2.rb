example_input = []

File.open("input.txt", "r") do |f|
    f.each_line do |line|
        example_input << line
    end
  end

games = example_input.map {{
    game_number: _1.split(":")[0].split(" ")[1],
    game_steps: _1.split(":")[1] 
}}

possible_rounds = []

games.each_with_index do |round, index|
    @pass = true

    round[:game_steps].split(";").each do |round_part|
        round_part = round_part.split(",").map(&:strip)

        round_part.each do |grab|
            count, color = grab.split(" ")

            if (color == "red" && count.to_i > 12) || (color == "green" && count.to_i > 13) || (color == "blue" && count.to_i > 14)
                @pass = false
            end
        end
    end

    possible_rounds << round[:game_number].to_i if @pass
end

puts possible_rounds.sum