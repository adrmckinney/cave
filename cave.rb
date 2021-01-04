

def outside
    puts "You made it out of the cave"
    puts "You breathe a sigh of relief and go about your day"
    exit()
end

def combination_lock
    puts "You go to the door to get out of this room but there is a comination lock on it"
    puts "You also notice that the lock is attached to bomb."
    puts 'There is a note on the bomb that says, "You only get 4 tries."'
    puts "The lock has 3 digits, 1-9"
    code = 952
    locked = true
    chances = 4
    
    
    
    while locked = true && chances != 0
        puts "You can guess the combination or examine the room for the 3- digit code"
        puts "What do you want to do?"
        print "> "
        input = gets.chomp
        if input.include? "guess"
            puts "Enter three numbers for your guess"
            print "> "
            code_guess = gets.chomp.to_i

            if code_guess == code
                locked = false
                puts "You guessed the code!"
                puts "You can now leave the room"
                outside
            else
                chances -= 1
                puts "That is not correct."
                puts "You only have #{chances} chances left"
            end
        elsif input.include? "examine"
            puts "You walk around the room looking at the walls."
            puts "You notice some faint writing on one of the walls"
            puts "You make out the number 529"
            puts "Could these be the numbers for the combination lock?"
        end
    end

    if chances == 0
        dead("The room exploded")
    end
end

def clown_room_with_mirror
    puts "You head through that door and the troll, once again, shuts and locks the door behind you."
    puts "You look around and see a scary clown in the room"
    puts "Terrified, you close your eyes"
    puts "You have to think of something to do, quick!"
    puts "What could you do"
    print "> "
    input = gets.chomp

    if input.include?("stab") || input.include?("sword")
        puts "In your haste to get out of the last room, you left your sword behind"
        dead("The clown jumps in front of you and scares you to death")
    elsif input.include?("run") || input.include?("sit")
        puts "The clown jumped in front of you"
        dead("you died of fright because clowns are scary")
    elsif input.include? "mirror"
        puts "You hold up the mirror and the clown sees himself for the first time"
        puts "The clown dies from fright because clowns are scary"
        puts "You notice another door in the room"
        combination_lock
    end
end

def clown_room_no_mirror
    puts "There is a scary looking clown in this room"
    dead("You die of fright because clowns are scary")
end

def troll_room_two
    puts 'You knock on the door and yell, "Hey troll, I have some bear meat for you!"'
    puts "The troll opens the door, looks inside and sees the dead bear"
    puts "Overjoyed, the troll offers you a gift"
    puts '"Here," the troll says, "this will protect you from the creature in the next room."'
    puts "He hands you a mirror."
    puts "Filled with confusion, you examine the mirror and see some writing on the back. It reads: pennywise"
    puts "Not sure what that means, you turn around and see a door that was behind the bear. You hadn't noticed this door before."
    puts "Do you want to go through the door? (yes/no)"
    print "> "
    door_choice = gets.chomp

    if door_choice == "yes"
        clown_room_with_mirror
    else
        dead("The troll ate you after he ate the bear. You shouldn't have stuck around")
    end
end

def troll_room
    key = 0
    tries = 7
    troll_number = rand(100)
    player_guess = 0
    chances = 2
    
    puts ""
    puts "******** Troll ROOM ********"
    puts ""
    puts "You enter the room and are face to face with a troll"
    puts "Troll: How did you get in here?"
    puts ""
    puts "No worries, I'm hungry and you look delicious"
    puts ""
    puts "I'll tell you what, if you can guess the number"
    puts "I'm thinking of then I will let you pass into the next room"
    puts "But if you can't guess the number the I'm going to eat you"
    puts ""
    
    while chances > 0
        puts "Do you want to play?"
        print "> "
        play_game = gets.chomp

        if play_game == "yes"
            
            puts "Great! Let's play"
            # puts "troll number is #{troll_number}"

            while tries > 0 && player_guess != troll_number
                puts "You have #{tries} tries to guess the number between 1-100"
                puts "Guess a number"
                print "> "
                guess = gets.chomp.to_i
                player_guess = guess

                if guess > troll_number
                    puts "Nope, your guess is too high"
                    tries -= 1
                elsif guess < troll_number
                    puts "Nope, your guess is too low"
                    tries -= 1
                elsif guess == troll_number
                    puts "Well, you guessed it. That's too bad...I am really hungry."
                    puts "I guess I have to let you pass now. If you ever feel like eating with me,"
                    puts "just come on back"
                    puts ""
                    puts "Would you like to go to the next room? (yes/no)"
                    print "> "
                    choice = gets.chomp
                    if choice == "yes" || choice == "y"
                        puts ""
                        puts "As you walk toward the door,"
                        puts "you see some more writing on the wall above the door"
                        puts 'It reads, "smokey"'
                        puts ""
                        puts "...This cave is really weird..."
                        puts ""
                        bear_room
                    else
                        puts "The troll took advantage of you sticking around for so long"
                        dead("The troll ate you")
                    end
                end

                if tries == 0
                    dead("You didn't guess the correct number so the troll ate you in one bite")
                end
            end
        elsif play_game == "no"
            chances -= 1
            puts chances
            puts "What!? No one has every refused to play my game."
            puts "I'll ask you one more time."
            puts "Choose your answer wisely."

            
        end
    end
    dead("The troll did not appreciate you refusing his game offer. He ate you in one bite!")
end

def bear_room
    sword = false
    taken_defense_potion = false
    taken_life_potion = false
    bear_life = 200
    player_life = 100
    original_play_life = player_life
    active_player = true
    attack = false
    possess_defense_potion = false
    possess_life_potion = false
    used_defense = false
    player_attack_hitpoints = 50
    bear_attack_hitpoints = 100

    puts ""
    puts "******** BEAR ROOM ********"
    puts ""
    puts "Oh no!"
    puts "You've entered a room with a sleeping bear"
    puts "...and the troll shut and locked the door behind you!"
    puts ""
    puts "You look around the room and see the bones of someone" 
    puts "who must have come into this room before you."
    puts ""
    puts "You also see a sword next to the bones and it"
    puts "looks like there is something under the bones"
    puts ""
    
    while attack == false

        if sword == true
            player_attack_hitpoints = player_attack_hitpoints * 0.5 + player_attack_hitpoints
        end
        # puts "Player attack: #{player_attack_hitpoints}"

        puts "What do you want to do"
        print "> "
        fight_prep_choice = gets.chomp
        
        if fight_prep_choice.include?("sword") || fight_prep_choice.include?("weapon")
            sword = true
            puts "You successfuly grabbed the sword"
            puts "You have increased your attacking power by 50%"
            puts "The bear is still asleep"
        elsif fight_prep_choice.include?("bones") || fight_prep_choice.include?("search")
            possess_defense_potion = true
            possess_life_potion = true
            sword = false
            puts "You search the bones and discover two potions."
            puts 'The label on one of the bottles read, "potion to increase defense"'
            puts "There is a label on the other bottle but it's hard to read."
            puts "Wonder what this one does..."
        elsif fight_prep_choice.include?("drink") || fight_prep_choice.include?("potion")
            puts "You shouldn't drink this yet"
        elsif fight_prep_choice.include?("bear") || fight_prep_choice.include?("attack")
            attack = true
        else
            puts "I don't understand what you want to do."
            puts ""
        end
    end

    while bear_life > 0 && player_life > 0
        if taken_defense_potion == true
            bear_attack_hitpoints = bear_attack_hitpoints - (bear_attack_hitpoints * 0.25)
        end

        if taken_life_potion == true
            player_life = original_play_life
            
        end
        # puts "Original life: #{original_play_life}"
        # puts "Bear attack: #{bear_attack_hitpoints}"
        # puts "player life #{player_life}"
        # puts "Player attack: #{player_attack_hitpoints}"
        if active_player == true
            puts "You prepare to fight the bear."
            puts "What do you want to do?"
            print "> "
            action = gets.chomp
            if action == "defense"
                if possess_defense_potion == true
                    taken_defense_potion = true
                    possess_defense_potion = false
                    puts ""
                    puts "You drink the defense potion."
                    puts "Your defense is increased by 25%"
                    puts ""
                else
                    taken_defense_potion = false
                    puts ""
                    puts "You already drank the defense potion"
                    puts ""
                end
            
            elsif action.include?("other") || action.include?("life")
                if possess_life_potion == true
                    taken_life_potion = true
                    possess_life_potion = false
                    taken_defense_potion = false
                    puts ""
                    puts "You drink the other potion"
                    puts "You feel stronger, like your life has been restored"
                    puts ""
                else
                    taken_life_potion = false
                    puts ""
                    puts "You already drank the life potion"
                    puts ""
                end

            elsif action.include?("sword") || action.include?("weapon")
                sword = false
                puts "When you run to get the sword the bear"
                dead("jumps in front of you and kills you.")

            elsif action.include?("bones") || action.include?("search")
                puts "When you run to get the sword the bear"
                dead("jumps in front of you and kills you.")

            elsif action.include?("attack") || action.include?("bear")
                taken_defense_potion = false
                player_attack = rand(player_attack_hitpoints)
                new_bear_life = bear_life - player_attack
                puts ""
                puts "You attack the bear and do #{player_attack} damage"
                puts "The bear now has #{new_bear_life} life left"
                puts ""
                bear_life = new_bear_life
                active_player = false
            
            else
                puts "I don't understand what you want to do."
            end
        elsif active_player == false
            bear_attack = rand(bear_attack_hitpoints)
            new_player_life = player_life - bear_attack
            puts ""
            puts ""
            puts "The bear is angry and takes a swipe at you and does #{bear_attack} damage"
            puts "You now have #{new_player_life} life left"
            puts ""
            player_life = new_player_life
            taken_defense_potion = false
            taken_life_potion = false
            active_player = true
        end
    end
    if player_life <= 0
        dead("The bear killed you. Then it ate you.")
    end

    if bear_life <= 0
        puts "Congratulations!! You killed the bear"
        puts "You look at all that tasty bear meat and remember that the troll is hungry"
        puts "You think about letting the troll know about all this meat"
        puts "Do you want to let the troll know? (yes/no)"
        print "> "
        feed_troll = gets.chomp

        if feed_troll == "yes"
            troll_room_two
        else
            puts "Now that you have had time to rest from that fight, you notice that there was a door behind the bear"
            puts "Do you want to go through the door? (yes/no)"
            print "> "
            door_choice = gets.chomp

            if door_choice == "yes"
                clown_room_no_mirror
            else
                dead("You died because you can't make figure out what to do")
            end
        end
    end
end

def cave_entrance
    puts "Inside you see a door in front of you."
    puts "You also notice a pile of rocks in a corner of the room"
    puts "What would you like to do?"
    
    key = 0
    door_locked = true
    
    while true
        print "> "
        choice = gets.chomp

        if key > 0
            door_locked = false
        end

        if choice.include?("rocks") || choice.include?("rock")
            puts "You search the pile of rocks and find a key"
            puts "What would you like to do?"
            

            while key == 0
                print "> "
                key_choice = gets.chomp
                if key_choice.include?("pick") || key_choice.include?("key")
                    puts "You pick up the key and put it in your pocket"
                    key += 1
                    puts "You now have #{key} key"
                    puts "Now what would you like to do?"
                else
                    puts "Wait, don't you want to pick up the key?"
                end
            end
        elsif choice.include?("door") && door_locked
            puts "The door is locked"
        elsif choice.include?("door") && !door_locked
            puts "--------------------------------------"
            puts ""
            puts "You have unlocked the door and as you go through it"
            puts "you notice some writing on the wall"
            puts 'It reads, "stinky"'
            puts "... weird ..."
            puts ""
            puts "--------------------------------------"
            puts ""
            troll_room
        else
            puts "I don't understand what you want to do."
            puts "You can check the door or search the rock pile."
        end
    end
end

def dead(reason)
    puts reason
    puts "You are now dead. Thanks for playing!"
    exit(0)
end

def password_entry
    puts "enter your password"
    print "> "
    input = gets.chomp

    if input == "pennywise"
        clown_room_with_mirror
    elsif input == "stinky"
        troll_room
    elsif input == "smokey"
        bear_room
    else
        start
    end
end

def start
    puts "Welcome to the maze!"
    puts "What is your name?"
    print "> "
    name = gets.chomp
    puts "Hello #{name}" 

    puts "Do you have a password? (yes/no)"
    print "> "
    password_choice = gets.chomp

    if password_choice == "yes"
        password_entry
    else
        puts "You are standing in front of a cave. You decide to go inside to look around?"
        cave_entrance
    end
end

# def test
#     player_attack = 50
#     old_random = rand(player_attack)
#     puts "Old Random: #{old_random}"
#     player_attack = player_attack * 0.5 + player_attack
#     puts "new player attack num: #{player_attack}"
#     puts "new random: #{new"
# end

start