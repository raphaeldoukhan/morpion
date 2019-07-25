    def new_board
      @a1 = " "
      @a2 = " "
      @a3 = " "
      @b1 = " "
      @b2 = " "
      @b3 = " "
      @c1 = " "
      @c2 = " "
      @c3 = " "
    end

    def squares
      [@a1, @a2, @a3, @b1, @b2, @b3, @c1, @c2, @c3]
      
    end

    def win_combos 
      [[@a1, @a2, @a3],
      [@a1, @b2, @c3],
      [@a1, @b1, @c1],
      [@b1, @b2, @b3],
      [@c1, @c2, @c3],
      [@c1, @b2, @a3],
      [@a2, @b2, @c2],
      [@a3, @b3, @c3]]  
    end

    def print_grid
      puts
      puts "   1   2   3"
      puts "A  #{@a1} | #{@a2} | #{@a3} " 
      puts "  ---|---|---"
      puts "B  #{@b1} | #{@b2} | #{@b3} "
      puts "  ---|---|---"
      puts "C  #{@c1} | #{@c2} | #{@c3} "
      puts
      check_for_winner 
    end


    def check_validity (square_availability)
      if square_availability == " "
        true 
      else
        puts "La case est déjà remplie, merci de choisir une nouvelle case!"
      end 
    end


    def user_choicehash
      user_choice_hash = 
      {
        "a1" => @a1,
        "a2" => @a2,
        "a3" => @a3,
        "b1" => @b1,
        "b2" => @b2,
        "b3" => @b3,
        "c1" => @c1,
        "c2" => @c2,
        "c3" => @c3
      }
    end

    def user_turn_x
      
      user_choice_hash = user_choicehash
      
      puts "Choisis une case sur laquelle jouer"
      user_choice = gets.chomp.downcase
      user_choice_hash.each do |choice, square|
        if user_choice == choice 
          if check_validity(square)
            square.sub!(" ", "X")
            print_grid
          end
        elsif user_choice == "q" || user_choice == "Q" || user_choice == "quit"
          exit
        end
      end
    end


    def user_turn_o
      user_choice_hash = user_choicehash
      
      puts "Choisis une case sur laquelle jouer"
      user_choice = gets.chomp.downcase
      user_choice_hash.each do |choice, square|
        if user_choice == choice 
          if check_validity(square)
            square.sub!(" ", "O")
          end
        elsif user_choice == "q" || user_choice == "Q" || user_choice == "quit"
          exit
        end
      end
    end

    def check_for_winner 
      win_combos.each do |combos| 
        if combos[0] == "O" && combos[1] == "O" && combos[2] == "O"
          puts "Bien ouej #{$player2} t'es vraiment le plus fort! #{$player1}, t'as raté ta vie!"
          exit 
        elsif combos[0] == "X" && combos[1] == "X" && combos[2] == "X"
          puts "Bien ouej #{$player1} t'es vraiment le plus fort! #{$player2}, t'as raté ta vie!"
          exit
        end
      end
    end


    def start_game
      puts "Bienvenue dans mon super jeu!"
      puts "Player1, comment t'appelles-tu ?"
      print ">"
      $player1 = gets.chomp
      puts "Player2, comment t'appelles-tu ?"
      print ">"
      $player2 = gets.chomp
      puts "Pour quitter le jeu vous n'avez qu'à tapper sur Q"
    end
    
    def perform
      start_game
      new_board
      while true
        print_grid
        user_turn_x
        user_turn_o
      end
    end
    
    perform