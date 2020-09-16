class CLI

    def run
    puts "  _______  __    __   __   ______    __       __  ".light_red.on_light_white.bold
    puts " /  _____||  |  |  | |  | |   _  |  |  |     |  | ".light_red.on_light_white.bold
    puts "|  |  __  |  |__|  | |  | |  |_)  | |  |     |  | ".light_red.on_light_white.bold
    puts "|  | |_ | |   __   | |  | |   _  <  |  |     |  | ".light_red.on_light_white.bold
    puts "|  |__| | |  |  |  | |  | |  |_)  | |  `----.|  | ".light_red.on_light_white.bold
    puts "|_______| |__|  |__| |__| |______/  |_______||__| ".light_red.on_light_white.bold
    puts " "

                                                         
        puts "Welcome to the Ghibli Character Directory!".bold
        sleep(3)
        puts "Miyazaki would be proud.".bold
        sleep(2)
        puts "Please choose a character to learn more about them:".bold
        sleep(3)
        puts ""
        API.scrape_characters
        list_characters
        menu
    end

    def list_characters
        Character.all.sort_by{|char| char.name}.each.with_index(1) do |character, i|
            puts "#{i}. #{character.name}"
            sleep 0.05
        end
    end

    def menu
        puts ""
        puts "So many choices! Choose a number to learn more about that character.".bold
        input = gets.chomp
        if !input.to_i.between?(1, Character.all.count)
            puts "We can't seem to find that character. Please choose a number between 1 and 43.".red.bold
            sleep 3
        list_characters
        menu

        else character = Character.all[input.to_i-1]
            character_info(character)
        end
        puts "Would you like to learn about someone else?".blue.on_light_white.bold
        puts "Please enter Y or N.".blue.on_light_white.bold
        another_character = gets.strip.downcase
        if another_character == "y"
            list_characters
            menu
        elsif another_character == "n"
            puts "        Once you've met someone...       ".light_red.on_light_white.bold
            sleep 1
            puts "      you never really forget them.      ".light_red.on_light_white.bold
            sleep 1
            sleep 3
            puts "        It just takes a while...         ".cyan.on_light_white.bold
            sleep 1
            puts "      for your memories to return.       ".cyan.on_light_white.bold
            sleep 3
            puts "              !         !                ".black.on_light_white.bold
            puts "             ! !       ! !               ".black.on_light_white.bold
            puts "            ! . !     ! . !              ".black.on_light_white.bold
            puts "               ^^^^^^^^^^^               ".black.on_light_white.bold
            puts "             ^             ^             ".black.on_light_white.bold
            puts "           ^  (O)       (O)  ^           ".black.on_light_white.bold
            puts "          ^         ^^        ^          ".black.on_light_white.bold
            puts "         ^        ******       ^         ".black.on_light_white.bold
            puts "       ^   *                 *   ^       ".black.on_light_white.bold
            puts "      ^   *    ^    ^    ^    *    ^     ".black.on_light_white.bold
            puts "     ^   *                     *    ^    ".black.on_light_white.bold
            puts "    ^   *   ^    ^     ^    ^   *    ^   ".black.on_light_white.bold
            puts "   ^   *                         *    ^  ".black.on_light_white.bold
            puts "   ^  *                           *   ^  ".black.on_light_white.bold
            puts "   ^  *                           *   ^  ".black.on_light_white.bold
            puts "    ^ *                           *  ^   ".black.on_light_white.bold
            puts "      ^ *                        * ^     ".black.on_light_white.bold
            puts "      ^ *                        * ^     ".black.on_light_white.bold
            puts "      ^  *                      *  ^     ".black.on_light_white.bold
            puts "        ^  *       ) (         * ^       ".black.on_light_white.bold
            puts "            ^^^^^^^^ ^^^^^^^^^           ".black.on_light_white.bold
            sleep 3
            puts "           Thank you for playing!        ".light_red.on_light_white.bold
            sleep 2
            exit
        else 
            puts "I didn't understand that. Please choose from the list below!".red.bold
            sleep 3
            list_characters
            menu
        end
    end

    def character_info(character)
        API.scrape_details(character)
        # puts "Here is a little more about #{character.name}:".red.on_white.bold
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
