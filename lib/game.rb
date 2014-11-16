require_relative 'computer_player'
require_relative 'human_player'

class Hangman
  INCORRECT_GUESSES = 6

  # may not be necessary
  def self.create_board(word_length)
    Array.new(word_length)
  end

  # need to initialize players
  def initialize(guesser, chooser)
    @guesser = guesser
    @chooser = chooser

    @guesses_remaining = INCORRECT_GUESSES
  end

  def run
    @chooser.pick_word
    @word_length = @chooser.word_length
    @board = Hangman.create_board(@word_length)
    @guesser.receive_length(@word_length) # give guesser length of word

    until @guesses_remaining.zero? || @board.all?
      play_turn
    end

    # end game stuff

    # should change to reflect differences in computer and human play
    if @board.all?
      @guesser.win(render_board)
    else
      @guesser.lose(@chooser.inquire_word)
    end

  end

  def render_board
    @board.map { |letter| letter.nil? ? "_" : letter }.join
  end

  def play_turn
    puts "Secret Word: #{render_board}"
    puts "Guesses remaining: #{@guesses_remaining}"

    # run guesser's turn
    guess = @guesser.guess_letter

    # chooser must take response and return if it is in the word and
    # where
    positions = @chooser.confirm(guess)

    # if positions are given, replace board with those positions
    # otherwise, take away from guesses remaining
    @guesses_remaining -= 1 if positions.empty?

    positions.each { |position| @board[position] = guess }

    # let guesser see outcome of guess
    @guesser.respond_to(guess, positions)
  end

end
