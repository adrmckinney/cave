

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
        input = gets.chomp.downcase
        if input.include? "guess"
            puts "Enter three numbers for your guess"
            print "> "
            code_guess = gets.chomp.downcase.to_i

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
    input = gets.chomp.downcase

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
    door_choice = gets.chomp.downcase

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
    puts "You enter the room and are face to face with a troll"
    puts ""
    puts "Troll: How did you get in here?"
    puts ""
    puts "       No worries, I'm hungry and you look delicious!"
    puts "       The beast dragged a little snack through her a"
    puts "       little while ago, but it wouldn't even share an leg."
    puts ""
    puts "       . . . but I'm also bored."
    puts ""
    puts "       I'll tell you what, if you can guess the number"
    puts "       I'm thinking of then I will let you pass into the next room."
    puts "       But if you can't guess the number then I'm going to eat you."
    puts ""
    
    while true
        puts "Do you want to play? (y/n)"
        print "> "
        play_game = gets.chomp.downcase
        puts ""

        if play_game.include?("yes") || play_game.include?("y")
            
            puts "Great! Let's play"
            puts "troll number is #{troll_number}"

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
                    choice = gets.chomp.downcase
                    if choice == "yes" || choice == "y"
                        puts ""
                        puts "As you walk toward the door,"
                        puts "you see some more writing on the wall above the door"
                        puts 'It reads, "smokey"'
                        puts ""
                        puts "...This cave is really weird..."
                        puts ""
                        print "[hit enter to continue]"
                        gets.chomp.downcase
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
        elsif play_game.include?("no") || play_game.include?("n")
            chances -= 1
            if chances > 0
                puts "What!? No one has every refused to play my game."
                puts "I'll ask you one more time."
                puts "Choose your answer wisely."
                puts ""
            else
                dead("The troll did not appreciate you refusing his game offer. He ate you in one bite!")
            end
        else
            puts "I don't understand what you want to do."
            puts ""
        end
    end
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
    puts "Oh no!"
    puts "You've entered a room with a sleeping bear"
    puts "...and the troll shut and locked the door behind you!"
    puts ""
    puts "You look to your left and see a sconce, so you quietly place" 
    puts "your torch in it."
    puts ""
    puts "You look around the room and see the bones of a person."
    puts "Filled with fear, you think that the bear was the beast"
    puts "that the troll was talking about and that it had already"
    puts "eaten your friend."
    puts "" 
    puts "But as you look more closely, you also see a sword next" 
    puts "to the bones."
    puts "Your friend didn't have a sword . . . this must had been someone else."
    puts ""
    puts "But you keep staring at the bones. It looks like there"
    puts "is something under the them."
    puts ""
    print "[hit enter to continue]"
    gets.chomp
    puts ""
    
    while attack == false

        if sword == true
            player_attack_hitpoints = player_attack_hitpoints * 0.5 + player_attack_hitpoints
        end
        # puts "Player attack: #{player_attack_hitpoints}"

        puts "What do you want to do"
        print "> "
        fight_prep_choice = gets.chomp.downcase
        
        if fight_prep_choice.include?("sword") || fight_prep_choice.include?("weapon")
            sword = true
            puts "You successfuly grabbed the sword"
            puts "You have increased your attacking power by 50%"
            puts "The bear is still asleep"
            puts ""
        elsif fight_prep_choice.include?("bones") || fight_prep_choice.include?("search")
            possess_defense_potion = true
            possess_life_potion = true
            sword = false
            puts "You search the bones and discover two potions."
            puts 'The label on one of the bottles reads, "potion to increase defense"'
            puts 'The other bottle reads, "potion to restore life"'
            puts "Luckily the bear did not hear you rummaging through the bones"
            puts ""
        elsif fight_prep_choice.include?("drink") || fight_prep_choice.include?("potion")
            puts "You shouldn't drink this yet"
            puts ""
        elsif fight_prep_choice.include?("bear") || fight_prep_choice.include?("attack") || fight_prep_choice.include?("fight")
            puts ""
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
            action = gets.chomp.downcase
            puts ""
            if action == "defense"
                if possess_defense_potion == true
                    taken_defense_potion = true
                    possess_defense_potion = false
                    puts ""
                    puts "You drink the defense potion."
                    puts "Your defense is increased by 25%."
                    puts ""
                else
                    taken_defense_potion = false
                    puts ""
                    puts "You already drank the defense potion."
                    puts ""
                end
            
            elsif action.include?("restore") || action.include?("life")
                if possess_life_potion == true
                    taken_life_potion = true
                    possess_life_potion = false
                    taken_defense_potion = false
                    puts ""
                    puts "You drink the life potion and your life is"
                    puts "restored to full health."
                    puts ""
                else
                    taken_life_potion = false
                    puts ""
                    puts "You already drank the life potion."
                    puts ""
                end

            elsif action.include?("sword") || action.include?("weapon")
                sword = false
                puts "When you run to get the sword the bear"
                dead("jumps in front of you and kills you. Should have grabbed the sword when the bear was asleep.")

            elsif action.include?("bones") || action.include?("search")
                puts "When you run to get the sword the bear"
                dead("jumps in front of you and kills you. Should hav searched the bones when the bear was asleep.")

            elsif action.include?("attack") || action.include?("bear") || action.include?("fight")
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
        feed_troll = gets.chomp.downcase

        if feed_troll == "yes"
            troll_room_two
        else
            puts "Now that you have had time to rest from that fight, you notice that there was a door behind the bear"
            puts "Do you want to go through the door? (yes/no)"
            print "> "
            door_choice = gets.chomp.downcase

            if door_choice == "yes"
                clown_room_no_mirror
            else
                dead("You died because you can't make figure out what to do")
            end
        end
    end
end

def cave_entrance
    puts ""
    puts ""
    puts "You are now alone standing in front of the cave."
    puts ""
    puts "You've yelled into the cave for your friend but nothing."
    puts "You sturggle to see anything inside but you know you can't"
    puts "go home without them. You have no option . . ."
    puts ""
    print "[hit enter to continue]"
    gets.chomp
    puts ""
    puts ". . . you decide to go inside to find your friend."
    puts ""
    puts "It's much colder inside the cave. There is some light"
    puts "shinning in from the opening but not enough to see anything."
    puts ""
    puts "You scoot your feet around, careful not to trip and fall."
    puts "You feel something against your foot. Scared to find out what"
    puts "it is, you slowly bend down to feel for it."
    puts ""
    print "[hit enter to continue]"
    gets.chomp
    puts ""
    puts "You're now holding your friends shoe."
    puts ""
    puts "You keep searching for more. You bump into the wall and" 
    puts "your hand touches something. . ."
    puts ""
    print "[hit enter to continue]"
    gets.chomp
    puts ""
    puts ". . . it's a torch sitting in it's sconce!"
    puts ""
    puts "If there is a torch, there must be something to light it with, right?"
    puts ""
    puts "You keep searching and you find some matches on the ground."
    puts ""
    puts "You quickly light the torch."
    puts ""
    print "[hit enter to continue]"
    gets.chomp
    puts ""
    puts "You now see a door in front of you and a pile of rocks" 
    puts "in the corner."
    puts ""
    puts "What would you like to do?"
    
    key = 0
    door_locked = true
    counter = 0
    
    while true
        if counter > 0
            puts ""
            puts "What would you like to do now?"
        end
        
        print "> "
        choice = gets.chomp.downcase
        puts ""
        counter += 1
        if key > 0
            door_locked = false
        end

        if choice.include?("rocks") || choice.include?("rock")
            puts "You search the pile of rocks and find a key"
            puts ""
            puts "What would you like to do?"
            

            while key == 0
                print "> "
                key_choice = gets.chomp.downcase
                if key_choice.include?("pick") || key_choice.include?("key")
                    puts ""
                    puts "You pick up the key and put it in your pocket"
                    key += 1
                    puts "You now have #{key} key"
                else
                    puts "Wait, don't you want to pick up the key?"
                end
            end
        elsif choice.include?("door") && door_locked
            puts "The door is locked"
        elsif choice.include?("door") && !door_locked
            puts "--------------------------------------"
            puts ""
            puts "You grab the torch and head to the door."
            puts "You unlock the door and as you go through it"
            puts "you notice some writing above it."
            puts 'It reads, "stinky"'
            puts ""
            puts "... weird ..."
            puts ""
            puts "--------------------------------------"
            puts ""
            print "[hit enter to continue]"
            gets.chomp
            puts ""
            troll_room
        else
            puts "I don't understand what you want to do."
            puts "You can check the door or search the rock pile."
        end
    end
end

def story
    puts "You and a friend are exploring the woods in the country."
    puts "You've never been this far out into the woods and the sun"
    puts "looks like it's about to go down. Before you can say that" 
    puts "maybe you two should head back to the house, your friend" 
    puts "discovers a cave hidden behind some brush. You both try to look" 
    puts "inside the cave but it's too dark to see anything. Your" 
    puts "friend wants to go inside to check it out but you are not" 
    puts "interested in that. Your friend goes in by themself..."
    puts ""
    print "[hit enter to continue]"
    puts ""
    gets.chomp
    puts ". . ."
    puts ""
    print "[hit enter to continue]"
    puts ""
    gets.chomp
    puts ""
    puts ". . . ."
    puts ""
    puts ""
    print "[hit enter to continue]"
    gets.chomp
    cave_entrance
end

def dead(reason)
    puts reason
    puts "You are now dead. Thanks for playing!"
    puts ""
    puts "Do you want to play again? (y/n)"
    print "> "
    input = gets.chomp.downcase
    if input == "y"
        password_prompt
    elsif input == "n"
        exit(0)
    else
        puts "I don't understand what you want to do."
    end
end

def password_entry
    puts "enter your password"
    print "> "
    input = gets.chomp.downcase

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

def get_name
    puts ""
    puts "           ~~~~~~~~~~~~~~~~~~~~"
    puts "         ~~~                  ~~~"
    puts "       ~~                       ~~"
    puts "     /                            \\"
    puts "    /                              \\"
    puts "   /                                \\"
    puts "  |                                  |"
    puts " |                                    |"
    puts "|                                      |"
    puts "* * * * * WELCOME TO THE CAVE! * * * * *"
    puts ""
    puts "What is your name?"
    print "> "
    name = gets.chomp
    puts ""
    puts "Hello #{name}"
    puts ""
    password_prompt
end

def password_prompt
    puts ""
    puts "Do you have a password? (y/n)"
    print "> "
    password_choice = gets.chomp.downcase

    if password_choice.include?("yes") || password_choice.include?("y")
        password_entry
    elsif password_choice.include?("no") || password_choice.include?("n")
        puts ""
        puts "That's okay. Pay attention during the game for" 
        puts "words that seem strange. They might come in handy later."
        puts ""
        print "[hit enter to continue]"
        gets.chomp.downcase
        puts ""
        puts ""
        puts ""
        puts ""
        story
    else
        puts "I don't understand. Please try again"
    end
end


get_name