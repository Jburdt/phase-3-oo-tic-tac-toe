class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize
    # @board = "X","O","X","O","X","O","X","O","X"
    @board =  Array.new(9, " ")
  end
  
  
  def display_board
   puts " #{ @board[0] } | #{ @board[1] } | #{ @board[2] } "
   puts "-----------"
   puts " #{ @board[3] } | #{ @board[4] } | #{ @board[5] } "
   puts "-----------"
   puts " #{ @board[6] } | #{ @board[7] } | #{ @board[8] } "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(idx)
    @board[idx] != " "
  end

  def valid_move?(idx)
    !position_taken?(idx) && idx.between?(0, 8)
  end

  def turn_count
    @board.count {|element| element != " " }
  end
  
  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    print "Please choose between (1-9): "
    user_input = gets.strip
    idx = input_to_index(user_input)
    if valid_move?(idx)
      move(idx, current_player)
      display_board
    else
      puts "Invalid Position"
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.find { |win_combo| position_taken?(win_combo[0]) && @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]]
    }
  end

  def full?
    @board.none? {|token| token == " " }
  end
  
  def over?
    won? || full?
  end

  def winner
    @board[won?[0]]
  end

  def draw?
    !won? && full?
  end
  
  def play
    until !over?
      turn
    end

    if won?
      puts "Congratulations #{ winner }!"
    else
      puts "Cat's game!"
    end
  end

end