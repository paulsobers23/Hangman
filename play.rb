class Hangman
  def initialize
    @l = ('a' .. 'z').to_a
    @w = words.sample
    @tries = 7
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

  def print_teaser
    w_teaser = ""

    @w.first.size.times do
      w_teaser += "_ "
    end

    puts w_teaser
  end

  def make_guess
    if @tries > 0


      puts "Enter a letter"
      guess = gets.chomp

      #if letter is not part of work, remove from array
      good_guess = @w.first.include? guess

      if good_guess
        puts "Good guess"
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
    puts "Clue: #{@w.last}"

    print_teaser

    make_guess
  end
end

game = Hangman.new
game.begin
