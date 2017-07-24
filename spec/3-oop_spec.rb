oop = File.open('oop.rb').read

b = binding
b.eval(oop)

describe "OOP #6" do
  begin
    Animal = b.eval('Animal')
  rescue
  end

  begin
    simon = Animal.new('Simon')
  rescue
  end

  it "Animal is a class" do
    expect(Animal).to be_a(Class)
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
    Lion = b.eval('Lion')
  rescue
  end

  begin
    simba = Lion.new('Simba')
  rescue
  end

  it "Lion is a class" do
    expect(Lion).to be_a(Class)
  end

  it "Lion inherits from Animal" do
    expect(Lion.superclass).to eq(Animal)
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
