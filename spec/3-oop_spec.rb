oop = File.open('oop.rb').read

b = binding

begin
  b.eval(oop)
rescue Exception => exc
  puts exc
end

describe "OOP #6" do
  begin
    A = b.eval('Animal')
  rescue Exception
  end

  begin
    simon = A.new('Simon')
  rescue Exception
  end

  it "Animal is a class" do
    expect(A).to be_a(Class)
  end

  it "Animal sets attributes and methods" do
    expect(simon.instance_variables).to include(:@name)
    expect(simon.methods).to include(:greet)
  end

  it "Animal's attributes are accessible" do
    expect(simon).to respond_to(:name)
  end
end

describe "OOP #7" do
  it "An instance of Animal has been created" do
    expect(b.eval('ObjectSpace.each_object(Animal).count')).to be > 1
  end
end

describe "OOP #8" do
  begin
    L = b.eval('Lion')
  rescue
  end

  begin
    simba = L.new('Simba')
  rescue
  end

  it "Lion is a class" do
    expect(L).to be_a(Class)
  end

  it "Lion inherits from Animal" do
    expect(L.superclass).to eq(Animal)
  end

  it "Lion adds a king attribute to existing Animal attributes" do
    expect(simba.instance_variables).to include(:@name)
    expect(simba.instance_variables).to include(:@king)
  end
end

describe "OOP #9" do
  it "An instance of Lion has been created" do
   expect(b.eval('ObjectSpace.each_object(Lion).count')).to be > 1
  end
end
