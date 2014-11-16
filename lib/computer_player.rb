class ComputerPlayer
  DICTIONARY = File.readlines('./lib/dictionary.txt').map(&:chomp)

  def initialize
    @letters_to_guess = ('a'..'z').to_a
  end

  def pick_word
    @word = DICTIONARY.sample
  end

  def word_length
    @word.length
  end

  def receive_length(word_length)
    @word_length = word_length
  end

  def guess_letter
    @letters_to_guess.shuffle!.pop # stupid AI
  end

  def confirm(guess)
    positions = []

    @word.each_char.with_index do |char, index|
      positions << index if char == guess
    end

    positions
  end

  def respond_to(guess, positions)
    # will update when creating smarter AI
  end

  def inquire_word
    @word
  end

end
