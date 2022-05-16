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

  it 'should identify winning positions' do
    winning_combinations = [[0, 1, 2],
                            [3, 4, 5],
                            [6, 7, 8],
                            [0, 3, 6],
                            [1, 4, 7],
                            [2, 5, 8],
                            [0, 4, 8],
                            [2, 4, 6]]
    [*0..8].permutation(3).each do |arr|
      if winning_combinations.include?(arr.sort)
        byebug if TicTacToe.is_winning_position?(arr) == false
        expect(TicTacToe.is_winning_position?(arr)).to eq true
      else
        expect(TicTacToe.is_winning_position?(arr)).to eq false
      end
    end
  end

  it 'should identify if the game is completed' do
    game = TicTacToe.new
    game.play(0)
    expect(game.completed?).to eq false
    game.play(4)
    expect(game.completed?).to eq false
    game.play(3)
    expect(game.completed?).to eq false
    game.play(5)
    expect(game.completed?).to eq false
    game.play(6)
    expect(game.completed?).to eq true
  end

  it 'should update the result when game is completed' do
    game = TicTacToe.new
    game.play(0)
    expect(game.result).to eq nil
    game.play(4)
    expect(game.result).to eq nil
    game.play(3)
    expect(game.result).to eq nil
    game.play(5)
    expect(game.result).to eq nil
    game.play(6)
    expect(game.completed?).to eq true
    expect(game.result).to eq 'X'
  end

  context 'Sample Games' do
    context 'When "X" is the winner' do
      it 'should declare "X" as winner' do
        game = TicTacToe.new
        game.play(0)
        expect(game.completed?).to eq false
        expect(game.result).to eq nil
        game.play(4)
        expect(game.completed?).to eq false
        expect(game.result).to eq nil
        game.play(3)
        expect(game.completed?).to eq false
        expect(game.result).to eq nil
        game.play(5)
        expect(game.completed?).to eq false
        expect(game.result).to eq nil
        game.play(6)
        expect(game.completed?).to eq true
        expect(game.result).to eq 'X'
      end
    end

    context 'When "O" is the winner' do
      it 'should declare "O" as winner' do
        game = TicTacToe.new
        game.play(0)
        expect(game.completed?).to eq false
        expect(game.result).to eq nil
        game.play(4)
        expect(game.completed?).to eq false
        expect(game.result).to eq nil
        game.play(1)
        expect(game.completed?).to eq false
        expect(game.result).to eq nil
        game.play(3)
        expect(game.completed?).to eq false
        expect(game.result).to eq nil
        game.play(8)
        expect(game.completed?).to eq false
        expect(game.result).to eq nil
        game.play(5)
        expect(game.completed?).to eq true
        expect(game.result).to eq 'O'
      end
    end

    context 'When nobody wins' do
      it 'should declare the result as "DRAW"' do
        game = TicTacToe.new
        game.play(0)
        expect(game.completed?).to eq false
        expect(game.result).to eq nil
        game.play(3)
        expect(game.completed?).to eq false
        expect(game.result).to eq nil
        game.play(6)
        expect(game.completed?).to eq false
        expect(game.result).to eq nil
        game.play(4)
        expect(game.completed?).to eq false
        expect(game.result).to eq nil
        game.play(1)
        expect(game.completed?).to eq false
        expect(game.result).to eq nil
        game.play(2)
        expect(game.completed?).to eq false
        expect(game.result).to eq nil
        game.play(5)
        expect(game.completed?).to eq false
        expect(game.result).to eq nil
        game.play(8)
        expect(game.completed?).to eq false
        expect(game.result).to eq nil
        game.play(7)
        expect(game.completed?).to eq true
        expect(game.result).to eq 'DRAW'
      end
    end
  end
end
