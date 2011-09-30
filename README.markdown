ActiveSet
=========

What is it?
-----------

SET behavior for ActiveRecord.

    class Balloon < ActiveRecord::Base
      acts_as_set :gasses, ["helium","hydrogen"]
    end

    b = Balloon.create :gasses => [ "helium", "hydrogen" ]

Unstable!
---------

Seriously, this project may change drastically without warning. Or I may lose interest. Use at your own risk.
