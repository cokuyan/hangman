class ComputerPlayer
  DICTIONARY = File.readlines('dictionary.txt').map(&:chomp)

  def initialize

  end

  def pick_word
    @word = DICTIONARY.sample
  end

  def word_length
    @word.length
  end

  def receive_length(word_length)
  end

  def guess_letter
  end

  def confirm(guess)
    positions = []

    @word.each_char.with_index do |char, index|
      positions << index if char == guess
    end

    positions
  end

  def respond_to(guess, positions)
  end

end
