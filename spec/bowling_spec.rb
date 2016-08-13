require_relative '../bowling'

describe "score" do
  it "calculates correctly for a gutter game" do
    expect(score("-"*20)).to eq 0
  end

  it "calculates correctly when you down one pin each roll" do
    expect(score("1"*20)).to eq 20
  end

  it "calculates correctly when you get a spare followed by downing one pin each roll" do
    expect(score("1/"+"1"*18)).to eq 29
  end

  it "calculates correctly when you down one pin each roll except the last which is a spare" do
    expect(score("1"*19+"/1")).to eq 29
  end

  it "calculates correctly when you get a strike followed by downing one pin each roll" do
    expect(score("X"+"1"*18)).to eq 30
  end

  it "calculates correctly when you down one pin each roll except the last which is a strike" do
    expect(score("1"*18+"X11")).to eq 30
  end

  it "calculates correctly for a golden game" do
    expect(score("X"*12)).to eq 300
  end
end
