fundamentals = File.open('fundamentals.rb').read

b = binding

begin
  b.eval(fundamentals)
rescue Exception => exc
  puts exc
end

describe "Fundamentals #1" do
  begin
    offer_rose = b.method(:offer_rose)
  rescue Exception
  end

  it "offer_rose is a method" do
    expect(offer_rose).to be_a(Method)
  end

  it "offer_rose interpolates person into string" do
    expect {offer_rose.call('Young Prince')}.to output(/Young Prince/).to_stdout
  end
end

describe "Fundamentals #2" do
  begin
    town = b.eval('town')
  rescue Exception
  end

  it "Belle has been removed from the town residents" do
    expect(town[:residents]).to_not include('Belle')
  end

  it "Belle has been added to the castle guests" do
    expect(town[:castle][:guests]).to include('Belle')
  end
end

describe "Fundamentals #3" do
  it "A loop is used" do
    expect(fundamentals.scan(/for|while|until|loop do|.times/).length).to be > 0
  end

  it "The loop prints each friend to the terminal" do
    expect {
      begin
        eval(fundamentals)
      rescue Exception
      end
    }.to output(/Mrs. Potts/).to_stdout
  end
end
