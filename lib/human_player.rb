class HumanPlayer

  def initialize
    @guessed_letters = []
  end

  def pick_word
    puts "How long is your word?"
    @word_length = Integer(gets.chomp)
  end

  def word_length
    @word_length
  end

  def receive_length(word_length)
    puts
    puts
    puts "The word to guess is #{word_length} letters long."
  end

  def guess_letter
    puts "Guessed letters: #{@guessed_letters.join(", ")}" unless @guessed_letters.empty?
    print "Please pick a letter: "
    guess = gets.chomp
    puts
    while @guessed_letters.include?(guess)
      puts "Already picked that letter"
      print "Please pick another letter: "
      guess = gets.chomp
    end

    @guessed_letters << guess
    guess
  end

  def confirm(guess)
    positions = []
    puts "Does your word contain the letter #{guess}? (y/n)"
    response = gets.chomp

    if response == "y"
      puts "Which positions?"
      positions = gets.chomp.split.map{ |pos| Integer(pos) - 1 }
    end

    positions
  end

  def respond_to(guess, positions)
    if positions.empty?
      puts "I'm sorry. The letter #{guess} is not in the word."
      puts
      puts "Please press <enter> to continue"
      gets
      puts
    else
      puts "Good guess! The letter #{guess} is in the word!"
      puts
      puts "Please press <enter> to continue"
      gets
      puts
    end
  end

  def inquire_word
    puts "What was your word?"
    gets.chomp
  end

  def win(word)
    puts "Congratulations! You won!"
    puts "The word was #{word}."
  end

  def lose(word)
    puts "Game Over"
    puts "Better luck next time"
    puts "By the way, the word was #{word}"
  end

end
