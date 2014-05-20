require 'spec_helper'

describe Zipcode do
  let(:state) { State.create(abbrev:"MI") }
  let(:city) { state.cities.create(name:"Detroit") }

  before {
  	@zip = city.zipcodes.build(zip:48204,lat:42.365337,lon:-83.14254)
  }

  subject { @zip }

  it { should respond_to(:zip) }
  it { should respond_to(:city_id) }
  it { should respond_to(:lat) }
   it { should respond_to(:lon) }
  its(:city) { should eq city }

  it { should be_valid }
  
  describe "with blank zipcode" do
    before { @zip.zip = " " }
    it { should_not be_valid }
  end

  describe "with blank city" do
    before { @zip.city_id = " " }
    it { should_not be_valid }
  end
end