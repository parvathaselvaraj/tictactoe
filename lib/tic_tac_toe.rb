class TicTacToe
  def initialize() 
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

  def self.is_winning_position?(array)
    winning_combinations = [[0, 1, 2],
                            [3, 4, 5],
                            [6, 7, 8],
                            [0, 3, 6],
                            [1, 4, 7],
                            [2, 5, 8],
                            [0, 4, 8],
                            [2, 4, 6]]
    winning_combinations.include?(array.sort)
  end 
end
