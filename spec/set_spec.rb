require 'spec_helper'

describe "SET column" do
  describe "assignment" do
    before { load_schema "set" }
    it "accepts single value" do
      b = Balloon.create :gasses => "helium"
      b.should be_valid
      b.reload.gasses.should == "helium"
    end
    it "accepts array of values", :db_support => true do
      b = Balloon.create :gasses => [ "helium", "hydrogen" ]
      b.should be_valid
      b.reload.gasses.should == "helium,hydrogen"
    end
    it "accepts comma-separated values" do
      b = Balloon.create :gasses => "helium,hydrogen"
      b.should be_valid
      b.reload.gasses.should == "helium,hydrogen"
    end
    it "accepts empty list", :db_support => true do
      b = Balloon.create :gasses => [ ]
      b.should be_valid
      b.reload.gasses.should == ""
    end
  end

  describe "getter" do
    before do
      load_schema "set"
      ActiveRecord::Base.connection.execute "INSERT INTO balloons (gasses) VALUES ('helium,hydrogen')"
      @b = Balloon.first
    end
    it "returns comma-separated values by default" do
      @b.gasses.should == "helium,hydrogen"
    end
    it "returns array of values when config option is set"
  end
end

class Balloon < ActiveRecord::Base; end
