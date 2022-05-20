class TicTacToe
  def initialize
    @cells = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @player1 = 'X' # @player1 => instance variable (using @)
    @player2 = 'O'
    @current_player = @player1
  end
  attr_reader :cells, :player1, :player2, :current_player

  def play(current_index)
    raise 'Cell is already occupied' unless @cells[current_index].nil?

    @cells[current_index] = @current_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def get(current_index)
    @cells[current_index]
  end

  def self.winning_combinations#static method
    [[0, 1, 2],
     [3, 4, 5],
     [6, 7, 8],
     [0, 3, 6],
     [1, 4, 7],
     [2, 5, 8],
     [0, 4, 8],
     [2, 4, 6]]
  end

  def self.is_winning_position?(array)
    winning_combinations.include?(array.sort)
  end

  def completed?
    has_won = self.class.winning_combinations.any? do |indices| # from instance to call a class method, self.class."methodname"
      is_equal = @cells[indices[0]] == @cells[indices[1]] && @cells[indices[1]] == @cells[indices[2]]
      is_valid = @cells[indices[0]] == 'X' || @cells[indices[0]] == 'O'
      is_equal && is_valid
    end
    all_filled = @cells.none?(nil)
    has_won || all_filled
  end

  def result
    if completed? # either has won or all filled
      has_won = self.class.winning_combinations.find do |indices| 
        @cells[indices[0]] == @cells[indices[1]] && @cells[indices[1]] == @cells[indices[2]]
      end
      return 'DRAW' if has_won == nil
      return 'X' if  @cells[has_won[0]] == 'X'
      return 'O' if @cells[has_won[0]] == 'O'
    else
      nil
    end 
  end
end
