require 'spec_helper'

describe Game do 
	before do
		@test_game = Game.new
	end

	describe "board" do
		it "should be initialized with nil values inside of the array, [[]]" do
			@test_game.board.should == [[nil, nil, nil], 
									    						[nil, nil, nil], 
									    						[nil, nil, nil]] 
		end

		it "should always have a length of 3" do 
			@test_game.board.length.should == 3
		end

		it "should always have the array within the array length of 3" do
			@test_game.board.each { |array| array.length.should == 3 } 		
		end 
	end

	describe "update_board" do 
		it "should establish a position on the board, using 'x' or 'o'" do
			@test_game.update_board('x', 0, 1)
			@test_game.board[0][1].should == 'x'
		end

    it "should not allow players other than 'x' and 'o'" do
      lambda { @test_game.update_board('y', 0, 0) }.should raise_error(ArgumentError)
    end

    it "should not allow positions outside the 3x3 board" do
      lambda { @test_game.update_board('x', 4, 0) }.should raise_error(ArgumentError)
    end

    it "should not allow an 'x' or 'o' to be inserted into an already full spot" do
      @test_game.update_board('x', 0, 0)
      lambda { @test_game.update_board('x', 0, 0) }.should raise_error(ArgumentError)
    end

    it "should be saved to the database" do
    	@test_game.update_board('x', 2, 1)
    	saved_game = Game.all.find { |g| g.id == @test_game.id }
    	saved_game.display_element(2, 1).should == 'x'
    end
	end

	describe "current_player" do
		it "should set even turns to player 'x' " do
			@test_game.current_player.should == 'x'
		end

		it "should set odd turns to player 'o' " do
			@test_game.play(2, 0)
      @test_game.current_player.should == 'o'
		end
	end

	describe "play" do 
	  it "should set the first player, 'x', to a position on the board" do
	  	@test_game.play(0, 1)
			@test_game.board.should == [[nil, 'x', nil], 
									    					  [nil, nil, nil], 
									    					  [nil, nil, nil]]
		end

		it "should set the second player, 'o', to a position on the board" do
		 	@test_game.play(0, 1)
		 	@test_game.play(2, 1)
		 	@test_game.board.should == [[nil, 'x', nil], 
									    					  [nil, nil, nil], 
									    					  [nil, 'o', nil]]
		end

		it "should determine that player 'x' won with a message!" do
			@test_game.play(0,0)
			@test_game.play(1,0)
			@test_game.play(0,1)
			@test_game.play(1,1)
			@test_game.play(0,2)
			@test_game.play(1,2).should == "Player x is the winner!"
		end

    it "should determine that player 'o' won with a message!" do
      @test_game.play(1,0)
      @test_game.play(0,0)
      @test_game.play(0,1)
      @test_game.play(1,1)
      @test_game.play(0,2)
      @test_game.play(2,2)
      @test_game.play(1,2).should == "Player o is the winner!"
    end
	end 

  describe "winner" do
    it "should return 'x' the first row is filled with x's" do
      @test_game.update_board('x', 0, 0)
      @test_game.update_board('x', 0, 1)
      @test_game.update_board('x', 0, 2)

      @test_game.winner.should == 'x'
    end
    
    it "should return 'd' if the second row is filled with o's" do
      @test_game.update_board('o', 1, 0)
      @test_game.update_board('o', 1, 1)
      @test_game.update_board('o', 1, 2)

      @test_game.winner.should == 'o'
    end

    it "should return nil if elements in any row are not the same" do
      @test_game.update_board('x', 0, 0)
      @test_game.update_board('o', 0, 1)
      @test_game.update_board('x', 0, 2)

      @test_game.winner.should be_nil
    end

    it "should return nil if elements are all still nil" do
      @test_game.winner.should be_nil
    end

    it "should return the letter if all elements in a column are filled with the same letter" do
      @test_game.update_board('x', 0, 0)
      @test_game.update_board('x', 1, 0)
      @test_game.update_board('x', 2, 0)

      @test_game.winner.should == 'x'
    end

    it "should return nil if all elements in a column are nil" do
      @test_game.winner.should be_nil
    end

    it "should return 'x' if there are three x's in a row at a slant from left to right" do
      @test_game.update_board('x', 0, 0)
      @test_game.update_board('x', 1, 1)
      @test_game.update_board('x', 2, 2)

      @test_game.winner.should == 'x'
    end

    it "should return 'x' if there are three x's in a row at a slant from left to right" do
      @test_game.update_board('x', 0, 2)
      @test_game.update_board('x', 1, 1)
      @test_game.update_board('x', 2, 0)

      @test_game.winner.should == 'x'
    end
  end
end
