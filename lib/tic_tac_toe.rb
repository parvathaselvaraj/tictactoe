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
end
