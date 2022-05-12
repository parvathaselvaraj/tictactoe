class TicTacToe
  def initialize
    @cells = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
    @player1 = 'X'
    @player2 = 'O'
    @current_player = @player1
  end
  attr_reader :cells, :player1, :player2, :current_player # properties

  def play(cell_index) # function
    @current_player = @current_player == @player1 ? @player2 : @player1 
  end
end