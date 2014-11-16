class ComputerPlayer
  DICTIONARY = File.readlines('./lib/dictionary.txt').map(&:chomp)

  def initialize
    @guessed_letters = []
  end

  def pick_word
    @word = DICTIONARY.sample
  end

  def word_length
    @word.length
  end

  def receive_length(word_length)

    @working_dictionary = DICTIONARY.select do |word|
      word.length == word_length
    end

    update_frequencies
  end

  def update_frequencies
    @letter_frequencies = Hash.new { |h, k| h[k] = 0 }

    @working_dictionary.each do |word|
      word.each_char do |char|
        @letter_frequencies[char] += 1 unless @guessed_letters.include?(char)
      end
    end

  end

  def guess_letter
    guess = @letter_frequencies.max_by { |char, freq| freq }.first
    @guessed_letters << guess
    guess
  end

  def confirm(guess)
    positions = []

    @word.each_char.with_index do |char, index|
      positions << index if char == guess
    end

    positions
  end

  def respond_to(guess, positions)

    if positions.empty?
      # remove all words that contain guessed character if positions.empty?
      @working_dictionary.reject! { |word| word.include?(guess) }
    else
      # if positions is not empty, select all words that have
      # the guessed character in the right positions
      @working_dictionary.select! do |word|
        positions.all? { |pos| word[pos] == guess }
      end
    end

    update_frequencies
  end

  def inquire_word
    @word
  end

  def win(word)
    puts "So your word is #{word}. That was not hard to guess at all!"
  end

  def lose(word)
    puts "Your word was #{word}? Aww, shucks"
  end

end
