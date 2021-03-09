class Hangman
  def initialize
    @w = words.sample
    @tries = 7
    @correct_guesses= []
    @w_teaser = ""

    @w.first.size.times do
      @w_teaser += "_ "
    end
  end

  def words
    [
      ["cricket", "A game played by gentlemen"],
      ["jogging", "We are not walking..."],
      ["celebrate", "Remembering special moments"],
      ["continent", "There are 7 of these"],
      ["exoctic", "Not from around here..."],
    ]
  end



  def print_teaser (last_guess = nil)
    update_teaser(last_guess) unless last_guess.nil?
    puts @w_teaser
  end

  def update_teaser (last_guess)
    new_teaser = @w_teaser.split

    new_teaser.each_with_index do |letter, i|
      #replace blank val w guess letters if match
      if letter == '_' && @w.first[i] == last_guess
        new_teaser[i] = last_guess
      end
    end

    @w_teaser = new_teaser.join(' ')
  end

  def make_guess
    if @tries > 0


      puts "Enter a letter"
      guess = gets.chomp

      #if letter is not part of work, remove from array
      good_guess = @w.first.include? guess

      if guess == "exit"
        puts "Thank you for playing"
      elsif good_guess
        puts "You are correct"
        print_teaser guess

        if @w.first == @w_teaser.split.join
          puts "Congratulations... you won"
        else
          make_guess
        end
      else
        @tries -= 1
        puts "Sorry... you have #{@tries} tries left. Try again"
        make_guess
      end
    else
      puts "Game over!"
    end
  end

  def begin
    puts "New game started... your word is #{@w.first.size} characters long"
    puts "To exit game at any point type 'exit'"
    puts "Clue: #{@w.last}"

    print_teaser

    make_guess
  end
end

game = Hangman.new
game.begin
