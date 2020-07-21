require './lib/board'

describe Board do
    
    board= Board.new
    # describe "#current" do
    #     it "returns 0 or 1 to verify current user" do
    #     board = Board.new

    #         expect(board.current).to include 0,1
    #     end
    # end

    describe "#winner" do
        it "check if someone wins on the first row" do
            expect(board.winner([["X","X","X"],[4,5,6],[7, 8, 9]])).to be true
        end

        it "check if someone wins on the second row" do
            expect(board.winner([[1,2,3],["X","X","X"],[7, 8, 9]])).to be true
        end

        it "check if someone wins on the third row" do
            expect(board.winner([[1,2,3],[4,5,6],["X","X","X"]])).to be true
        end

        it "check if someone wins on the first column" do
            expect(board.winner([["X",2,3],["X",5,6],["X", 8, 9]])).to be true
        end

        it "check if someone wins on the second column" do
            expect(board.winner([[1,"X",3],[4,"X",6],[7,"X", 9]])).to be true
        end

        it "check if someone wins on the third column" do
            expect(board.winner([[1,2,"X"],[4,5,"X"],[7, 8, "X"]])).to be true
        end
        it "check if someone wins on the 45° diagonal" do
            expect(board.winner([["X",2,3],[4,"X",6],[7, 8, "X"]])).to be true
        end

        it "check if someone wins on the 135° diagonal" do
            expect(board.winner([[1,2,"X"],[4,"X",6],["X", 8, 9]])).to be true
        end

    end
end