require 'spec_helper'

describe "SET column" do
  before { load_schema "set" }

  describe "assignment" do
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
    it "accepts values in any order" do
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

  describe "validation" do
    it "rejects disallowed value" do
      b = Balloon.create :gasses => "mercury"
      b.should be_invalid
    end
    it "rejects disallowed value in list" do
      b = Balloon.create :gasses => "helium,mercury"
      b.should be_invalid
    end
  end

  describe "getter" do
    before do
      ActiveRecord::Base.connection.execute "INSERT INTO balloons (gasses) VALUES ('helium,hydrogen')"
      @b = Balloon.first
    end
    it "returns comma-separated values when requested" do
    end
    it "returns array of values" do
      @b.gasses.should == [ "helium", "hydrogen" ]
    end
  end
end

class Balloon < ActiveRecord::Base
  acts_as_set :gasses, ["helium","hydrogen"]
end
