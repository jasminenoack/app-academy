require "./morse.rb"


describe "it translates morse code" do 
 
  it "reads simple words" do
    expect(Morse.read(".- -... --- ..- -")).to eq("ABOUT")
    expect(Morse.read("-.-. .- -")).to eq("CAT")
    expect(Morse.read("-... .... ...--")).to eq("BH3")
    expect(Morse.read("-.. --- --.")).to eq("DOG")
    expect(Morse.read(". .- --. .-.. .")).to eq("EAGLE")
    expect(Morse.read("..-. .. ... ....")).to eq("FISH")
    expect(Morse.read(".--- .- -.-. -.-")).to eq("JACK")
    expect(Morse.read(".-.. .- -- -...")).to eq("LAMB")
    expect(Morse.read("-. . .- .-.")).to eq("NEAR")
    expect(Morse.read("--- ...- . .-.")).to eq("OVER")
    expect(Morse.read(".--. --- .--.")).to eq("POP")
    expect(Morse.read("--.- ..- .. . -")).to eq("QUIET")
    expect(Morse.read(".-. .- -. --. .")).to eq("RANGE")
    expect(Morse.read("... --- ...")).to eq("SOS")
    expect(Morse.read("- ..- .-. - .-.. .")).to eq("TURTLE")
    expect(Morse.read("...- . -. ... .. --- -.")).to eq("VENSION")
    expect(Morse.read(".-- .- - . .-.")).to eq("WATER")
    expect(Morse.read("-..- -.-- .-.. --- .--. .... --- -. .")).to eq("XYLOPHONE")
    expect(Morse.read("--.. . -... .-. .-")).to eq("ZEBRA")
  end

  it "reads sentences" do
    expect(Morse.read(".- ...- ..--- .-- .... .. . -.-. -..-  ....- .....")).to eq("AV2WHIECX 45")
    expect(Morse.read("- .... .  --.- ..- .. -.-. -.-  -... .-. --- .-- -.  ..-. --- -..-  .--- ..- -- .--. ...  --- ...- . .-.  - .... .  .-.. .- --.. -.--  -.. --- --.")).to eq("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG")
    expect(Morse.read("-- --- .-. ... .  -.-. --- -.. .")).to eq("MORSE CODE")
    expect(Morse.read(".-- .. -.- .. .... ---")).to eq("WIKIHO")
  end

  it "reads numbers" do
    expect(Morse.read(".---- ..--- ...-- ....- ..... -.... --... ---.. ----. -----")).to eq("1234567890")
  end
end