require "./roman_numeral.rb"

describe "convert" do
  it "converts to roman numerals" do
    expect(convert(1)).to eq("I")
    expect(convert(3)).to eq("III")
    expect(convert(4)).to eq("IV")
    expect(convert(5)).to eq("V")
    expect(convert(9)).to eq("IX")
    expect(convert(10)).to eq("X")
    expect(convert(13)).to eq("XIII")
    expect(convert(24)).to eq("XXIV")
    expect(convert(39)).to eq("XXXIX")
    expect(convert(40)).to eq("XL")
    expect(convert(44)).to eq("XLIV")
    expect(convert(49)).to eq("XLIX")
    expect(convert(50)).to eq("L")
    expect(convert(73)).to eq("LXXIII")
    expect(convert(90)).to eq("XC")
    expect(convert(94)).to eq("XCIV")
    expect(convert(100)).to eq("C")
    expect(convert(159)).to eq("CLIX")
    expect(convert(207)).to eq("CCVII")
    expect(convert(296)).to eq("CCXCVI")
    expect(convert(500)).to eq("D")
    expect(convert(1000)).to eq("M")
    expect(convert(1066)).to eq("MLXVI")
    expect(convert(1904)).to eq("MCMIV")
    expect(convert(1954)).to eq("MCMLIV")
    expect(convert(1990)).to eq("MCMXC")
    expect(convert(2014)).to eq("MMXIV")
    expect(convert(3992)).to eq("MMMCMXCII")
  end
end
