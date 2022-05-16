require './lib/tic_tac_toe'
describe 'TicTactoe' do
  it 'should have nine cells' do
    game = TicTacToe.new
    expect(game.cells.count).to eq 9
  end
  it 'should have empty board at start' do
    game = TicTacToe.new
    expect(game.cells).to eq [nil, nil, nil, nil, nil, nil, nil, nil, nil]
  end
  it 'should allow two players to play' do
    game = TicTacToe.new
    expect(game.player1).to eq 'X'
    expect(game.player2).to eq 'O'
  end
  it 'should have current player as "X" in the beginning' do
    game = TicTacToe.new
    expect(game.current_player).to eq 'X'
  end
  it 'should allow players to play alternatively' do
    game = TicTacToe.new
    expect(game.current_player).to eq 'X'
    game.play(4)
    expect(game.current_player).to eq 'O'
    game.play(5)
    expect(game.current_player).to eq 'X'
    game.play(6)
    expect(game.current_player).to eq 'O'
  end

  it 'should save the players move' do
    game = TicTacToe.new
    expect(game.current_player).to eq 'X'
    game.play(4)
    expect(game.get(4)).to eq 'X'
    expect(game.cells).to eq [nil, nil, nil, nil, 'X', nil, nil, nil, nil]
  end

  it 'should not allow to use the same cell twice' do
    game = TicTacToe.new
    game.play(4)
    expect(game.get(4)).to eq 'X'
    expect { game.play(4) }.to raise_error('Cell is already occupied')

    game.play(5)
    expect(game.get(5)).to eq 'O'
    expect { game.play(5) }.to raise_error('Cell is already occupied')
  end

end
