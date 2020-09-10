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
            sleep 0.05
        end
    end

    def menu
        puts "Please select a number from above."
        input = gets.chomp
        if !input.to_i.between?(1, Character.all.count)
            puts "~~~We can't seem to find that character. Please choose a number between 1 and 43.~~~"
            sleep 3
        list_characters
        menu

        else character = Character.all[input.to_i-1]
            character_info(character)
        end
        puts "Would you like to learn about someone else?"
        puts "Please enter Y or N."
        if another_character == "y"
            list_characters
            menu
            another_character==gets.strip.downcase
        elsif another_character == "n"
            puts "Once you've met someone you never really forget them."
            sleep 1
            puts "It just takes a while for your memories to return."
            sleep 1
            puts "Thanks for playing!"
            sleep 1
            exit
        else 
            puts "I didn't understand that. Please try again!"
            list_characters
            menu
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

    def self.display_films(film)
        puts "Films: #{film.title}"
        puts "Director: #{film.director}"
        puts "Description: #{film.description}"
    end
end


# git add .
#git add "lib/cli.rb"
#git commit -m "Message of what you did"
#git push
