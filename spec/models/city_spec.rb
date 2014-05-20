require 'spec_helper'

describe City do
  
  before {
  	@state = State.new(abbrev:"MI")
  	@city = @state.cities.build(name:"Detroit")
  }

  subject { @city }

  it { should respond_to(:name) }
  it { should respond_to(:state_id) }
  its(:state) { should eq @state }

  it { should be_valid }
  
  describe "with blank name" do
    before { @city.name = " " }
    it { should_not be_valid }
  end

end