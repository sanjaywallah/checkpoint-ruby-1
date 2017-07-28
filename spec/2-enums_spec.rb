enums = File.open('enums.rb').read

b = binding

begin
  b.eval(enums)
rescue Exception => exc
  puts exc
end

describe "Enums #4" do
  begin
    lost_boys = b.eval('lost_boys')
  rescue Exception
  end

  it "The .each enumerator is used" do
    expect(enums.scan('.each').length).to be > 1
  end

  it "Each lost boy's age has been increased by 30 years" do
    expect(lost_boys.all? {|boy| boy[:age] >= 38}).to eq(true)
  end
end

describe "Enums #5" do
  begin
    darling_children = b.eval('darling_children')
  rescue Exception
  end

  it "The .map enumerator is used" do
    expect(enums.scan('.map').length).to be > 1
  end

  it "darling_children contains all of the childrens' full names" do
    expect(darling_children.all? { |name| name.include?('Darling') }).to eq(true)
  end
end
