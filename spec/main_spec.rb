require './lib/board'
require './lib/user'

describe User do
  describe '#initialize' do
    user = User.new('X', 'nombre')
    it 'Verify initialize name works' do
      expect(user.name).to eql('nombre')
    end

    it 'Verify initialize symbol works' do
      expect(user.symb).to eql('X')
    end

    it 'Verify do not initialize with wrong symbol' do
      expect(user.symb).not_to eql('0')
    end
  end
end

describe Board do
  board = Board.new

  describe '#initialize' do
    it 'Verify initialize array works' do
      expect(board.b).to eql([["\e[0;34;49m1\e[0m", "\e[0;34;49m2\e[0m", "\e[0;34;49m3\e[0m"], ["\e[0;34;49m4\e[0m", "\e[0;34;49m5\e[0m", "\e[0;34;49m6\e[0m"], ["\e[0;34;49m7\e[0m", "\e[0;34;49m8\e[0m", "\e[0;34;49m9\e[0m"]])
    end
    it 'Verify initialize counter works' do
      expect(board.counter).to eql(9)
    end
    it 'Verify initialize symb works' do
      expect(board.symb).to eql('')
    end
    it 'Verify initialize symbols works' do
      expect(board.symbols).to eql(%w[X O])
    end
  end

  describe '#turn' do
    board1 = Board.new
    it 'returns false if the input is invalid' do
      expect(board1.turn('x', 'as')).to be false
    end

    it 'returns true if the input is valid' do
      expect(board1.turn('X', 3)).to be true
    end
  end

  describe '#current' do
    board2 = Board.new
    board3 = Board.new
    it 'returns 0 to verify current user' do
      expect(board2.current).to eql(0)
    end
    board3.turn('X', 9)
    it 'returns 1 to verify current user' do
      expect(board3.current).to eql(1)
    end
  end

  describe '#display' do
    it 'display the board correctly' do
      expect(board.display).to eql(["\e[0;34;49m1\e[0m|\e[0;34;49m2\e[0m|\e[0;34;49m3\e[0m", "\e[0;34;49m4\e[0m|\e[0;34;49m5\e[0m|\e[0;34;49m6\e[0m", "\e[0;34;49m7\e[0m|\e[0;34;49m8\e[0m|\e[0;34;49m9\e[0m"])
    end
  end

  describe '#winner' do
    it 'check if someone wins on the first row' do
      expect(board.winner([%w[X X X], [4, 5, 6], [7, 8, 9]])).to be true
    end

    it 'check if someone wins on the second row' do
      expect(board.winner([[1, 2, 3], %w[X X X], [7, 8, 9]])).to be true
    end

    it 'check if someone wins on the third row' do
      expect(board.winner([[1, 2, 3], [4, 5, 6], %w[X X X]])).to be true
    end

    it 'check if someone wins on the first column' do
      expect(board.winner([['X', 2, 3], ['X', 5, 6], ['X', 8, 9]])).to be true
    end

    it 'check if someone wins on the second column' do
      expect(board.winner([[1, 'X', 3], [4, 'X', 6], [7, 'X', 9]])).to be true
    end

    it 'check if someone wins on the third column' do
      expect(board.winner([[1, 2, 'X'], [4, 5, 'X'], [7, 8, 'X']])).to be true
    end
    it 'check if someone wins on the 45° diagonal' do
      expect(board.winner([['X', 2, 3], [4, 'X', 6], [7, 8, 'X']])).to be true
    end

    it 'check if someone wins on the 135° diagonal' do
      expect(board.winner([[1, 2, 'X'], [4, 'X', 6], ['X', 8, 9]])).to be true
    end

    it 'check if someone does not win on the first row' do
      expect(board.winner([['X',2, 'X'], [4, 5, 6], [7, 8, 9]])).to be false
    end

    it 'check if someone does not win on the first column' do
      expect(board.winner([['X',2, 3], ['X', 5, 6], [7, 8, 9]])).to be false
    end


  end

  describe '#invalid_input' do
    it 'Verify the input has no more than 1 character' do
      expect(board.invalid_input(12)).to be true
    end
    it 'Verify the input is not a letter' do
      expect(board.invalid_input('a')).to be true
    end
    it 'Verify the input is available' do
      board.update_board(1, 'X')
      expect(board.invalid_input(1)).to be true
    end
    it 'Verify the input 2 is correct' do
      expect(board.invalid_input(2)).to be false
    end
    it 'Verify the input 3 is correct' do
      expect(board.invalid_input(2)).to be false
    end
  end

  describe '#update_board' do
    it 'Override the board with the choosen input' do
      expect(board.update_board(1, 'X')).to eql('X')
    end
  end
end
