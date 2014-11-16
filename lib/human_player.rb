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
    puts "The word to guess is #{word_length} letters long."
  end

  def guess_letter
    print "Please pick a letter: "
    guess = gets.chomp
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
    else
      puts "Good guess!"
    end
  end

end
