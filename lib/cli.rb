class CLI

    def run
    puts "  _______  __    __   __  .______    __       __  " 
    puts " /  _____||  |  |  | |  | |   _  |  |  |     |  | "
    puts "|  |  __  |  |__|  | |  | |  |_)  | |  |     |  | "
    puts "|  | |_ | |   __   | |  | |   _  <  |  |     |  | "
    puts "|  |__| | |  |  |  | |  | |  |_)  | |  `----.|  | "
    puts "|_______| |__|  |__| |__| |______/  |_______||__| "
    puts " "
                                                         
        puts "Welcome to the Ghibli Character Directory!"
        sleep(3)
        puts "Miyazaki would be proud."
        sleep(2)
        puts "Please choose a character to learn more about them:"
        sleep(3)
        API.scrape_characters
        list_characters
        menu
    end

    def list_characters
        Character.all.each.with_index(1) do |character, i|
            puts "#{i}. #{character.name}"
            sleep 0.07
        end
    end

    def menu
        puts "Please select a number from above."
        input = gets.chomp
        if !input.to_i.between?(1, Character.all.count)
            puts "We can't seem to find that character. Please choose a number between 1 and 43."
        list_characters
        menu

        else character = Character.all[input.to_i-1]
            character_info(character)
        end
    end

    def character_info(character)
        API.scrape_details(character)
        puts "Here is a little more about #{character.name}:"
        puts "Films: #{character.films}"
        puts "Species: #{character.species}"
        puts "Gender: #{character.gender}"
        puts "Age: #{character.age}"
        puts "Hair Color: #{character.hair_color}"
    end
end


# git add .
#git add "lib/cli.rb"
#git commit -m "Message of what you did"
#git push
