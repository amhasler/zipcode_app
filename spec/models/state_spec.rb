require 'spec_helper'

describe State do
  
  before {
  	@state = State.new(abbrev:"MI")
  }

  subject { @state }

  it { should respond_to(:abbrev) }

  it { should be_valid }
  
  describe "with blank abbreviation" do
    before { @state.abbrev = " " }
    it { should_not be_valid }
  end

end