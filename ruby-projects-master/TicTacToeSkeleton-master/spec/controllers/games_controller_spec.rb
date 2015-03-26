# GamesController_controller_spec

require 'spec_helper'

describe GamesController do
	describe "games#index" do
		before(:each) do 
			get :index
		end

		it "should set the @games instance variable to a set of all Games" do
    	assigns[:games].should_not be_nil
    	assigns[:games].all? {|game| game.kind_of?(Game)}.should be_true
   	end
  end

  describe "games#new" do
    let(:request) { get :new }

    it "should set the @game variable to a new game" do
      request
      assigns[:game].try(:kind_of?, Game).should be_true
    end

    it "should create and save a new game in the database" do
     lambda { request }.should change(Game, :count).by(1)
    end

    it "should redirect to show" do
      request.should redirect_to(game_path(Game.last.id))
    end

	end

  describe "games#show" do
    describe 'with valid params' do
      before(:each) do
        g = Game.new
        g.save

        @game_id = g.id
        get :show, :id => @game_id
      end

      it 'should set the @game instance variable' do
        assigns[:game].try(:kind_of?, Game).should be_true
        assigns[:game].should == Game.find(@game_id)
      end
    end

    describe 'with invalid params' do
      invalid_id = Game.last.nil? ? 1 : (Game.last.id + 1)
      let(:request) { get :show, :id => 1 }

      it "should not create a new game object" do
        Game.any_instance.should_not_receive(:initalize)
        expect { request }.to raise_error(ActiveRecord::RecordNotFound)
      end

      it "should not create a new game in the database" do
        # need to nest the expect so we don't crash before checking count
        lambda { expect { request }.to raise_error(ActiveRecord::RecordNotFound) }.should_not change(Game, :count)
      end

    end
  end

  describe "games#update" do
   let(:request) { put :update, :id => @game.id, :game => { :row => 0, :column => 1 } }

    before(:each) do
      @game = Game.new
      @game.save!
    end

    it "should enter a value into the board" do
      Game.any_instance.should_receive(:play).with(0,1)
      request
    end

    it "should redirect to show" do
      request.should redirect_to(game_path(Game.last.id))
    end


  end
end
