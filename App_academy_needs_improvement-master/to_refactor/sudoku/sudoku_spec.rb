require './sudoku'

describe Sudoku do
  before do
    @puzzle=Sudoku.new( {"12" => 4, "13" => 5, 
                         "14" => 8, "16" => 3, 
                         "17" => 7, "18" => 1, 

                         "21" => 8, "22" => 1, 
                         "28" => 2, "29" => 4, 

                         "31" => 7, "33" => 9, 
                         "37" => 5, "39" => 8,

                         "44" => 9, "46" => 7,

                         "55" => 6, 

                         "64" => 4, "66" => 2, 

                         "71" => 6, "73" => 4, 
                         "77" => 3, "79" => 5, 

                         "81" => 3, "82" => 4, 
                         "88" => 8, "89" => 7, 

                         "92" => 5, "93" => 7, 
                         "94" => 3, "96" => 8, 
                         "97" => 2, "98" => 6} )
  end

  describe "creates a puzzle" do 
    
  end

  describe "tests a row to check if it contains a number" do
  end

  describe "tests a column to check if it contains a number" do
  end

  describe "tests a box to check if it contains a number" do
  end

end
